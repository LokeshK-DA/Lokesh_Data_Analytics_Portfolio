
-- Total revenue by month
SELECT DATE_FORMAT(order_date, '%Y-%m-01') AS month_start,
       ROUND(SUM(revenue),2) AS monthly_revenue
FROM sales
GROUP BY month_start
ORDER BY month_start;

-- Top 10 products by revenue
SELECT product_id, product_name, category,
       ROUND(SUM(revenue),2) AS total_revenue, SUM(quantity) AS units_sold
FROM sales
GROUP BY product_id, product_name, category
ORDER BY total_revenue DESC
LIMIT 10;

-- Revenue by region with YoY growth
WITH yearly AS (
  SELECT region, YEAR(order_date) AS yr, SUM(revenue) AS rev
  FROM sales
  GROUP BY region, YEAR(order_date)
)
SELECT a.region,
       a.yr,
       ROUND(a.rev,2) AS revenue,
       ROUND(100.0*(a.rev - b.rev)/NULLIF(b.rev,0),2) AS yoy_growth_pct
FROM yearly a
LEFT JOIN yearly b
  ON a.region=b.region AND a.yr=b.yr+1
ORDER BY a.region, a.yr;

-- High-value customers (top 5% by revenue)
SELECT customer_id, ROUND(SUM(revenue),2) AS customer_revenue
FROM sales
GROUP BY customer_id
HAVING customer_revenue >= (
  SELECT PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY srev)
  FROM (SELECT SUM(revenue) AS srev FROM sales GROUP BY customer_id) t
)
ORDER BY customer_revenue DESC;

-- Monthly revenue by channel
SELECT DATE_FORMAT(order_date, '%Y-%m-01') AS month_start,
       channel,
       ROUND(SUM(revenue),2) AS revenue
FROM sales
GROUP BY month_start, channel
ORDER BY month_start, revenue DESC;
