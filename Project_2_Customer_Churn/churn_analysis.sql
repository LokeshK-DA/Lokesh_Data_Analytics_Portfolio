
-- Overall churn rate
SELECT ROUND(100.0*AVG(is_churn),2) AS churn_rate_pct FROM churn;

-- Churn by contract type
SELECT contract_type,
       ROUND(100.0*AVG(is_churn),2) AS churn_rate_pct,
       COUNT(*) AS customers
FROM churn
GROUP BY contract_type
ORDER BY churn_rate_pct DESC;

-- Average monthly charges: churned vs retained
SELECT is_churn,
       ROUND(AVG(monthly_charges),2) AS avg_monthly_charges
FROM churn
GROUP BY is_churn;

-- Churn by region and plan
SELECT region, plan_type,
       ROUND(100.0*AVG(is_churn),2) AS churn_rate_pct
FROM churn
GROUP BY region, plan_type
ORDER BY churn_rate_pct DESC;

-- Impact of satisfaction and support tickets
SELECT satisfaction_score,
       CASE WHEN support_tickets>=3 THEN '3+ Tickets' ELSE '<3 Tickets' END AS ticket_bucket,
       ROUND(100.0*AVG(is_churn),2) AS churn_rate_pct,
       COUNT(*) AS n
FROM churn
GROUP BY satisfaction_score, ticket_bucket
ORDER BY satisfaction_score, ticket_bucket;
