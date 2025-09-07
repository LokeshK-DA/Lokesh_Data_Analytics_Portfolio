# Sales Performance Dashboard

## Overview
This project analyzes **retail sales** across India (2023–2024) to uncover revenue trends, top products, and regional performance. It demonstrates an end-to-end workflow using **SQL**, **Excel**, and **Power BI**.

## Objectives
- Track monthly revenue trend and YoY growth
- Identify top-performing products and channels
- Compare region-wise performance
- Highlight high-value customers

## Tools & Tech
- Database: MySQL
- Visualization: Power BI, Excel
- Language: SQL

## Data Dictionary
- `order_id` (INT), `order_date` (DATE), `customer_id` (INT)
- `region`, `city`, `channel`, `payment_method` (TEXT)
- `product_id`, `product_name`, `category` (TEXT/INT)
- `quantity` (INT), `unit_price` (NUMERIC), `discount` (0–1)
- `revenue`, `cost`, `profit` (NUMERIC)

## Key KPIs
- **Total Revenue** and **Monthly Revenue**
- **YoY Growth %** by Region
- **Top 10 Products** by Revenue
- **Revenue by Channel**
- **High-value Customers** (top 5% by spend)

## How to Reproduce
1. Import `sales_data.csv` into MySQL as table `sales`.
2. Run queries from `sales_queries.sql` to generate KPI tables.
3. Open `sales_summary.xlsx` to view summary charts.
4. In Power BI, load `sales_data.csv`, apply the provided theme and DAX (`powerbi_measures.txt`):
   - Line: Monthly Revenue
   - Column: Revenue by Region
   - Bar: Top 10 Products
   - Cards: Total Revenue, Profit, Orders, Units
   - Slicers: Region, Category, Channel, Year

## Screenshots
See `/dashboard_screenshots` for preview images:
- `monthly_revenue_trend.png`
- `revenue_by_region.png`
- `top_products.png`

## Notes
- Dataset is synthetic but **statistically realistic** with seasonal effects (festive months Oct–Dec).
