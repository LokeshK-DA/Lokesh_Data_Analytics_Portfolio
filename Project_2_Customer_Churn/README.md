# Customer Churn Analysis

## Overview
This project analyzes **telecom-style customer data** (3,500 records) to understand churn drivers and retention opportunities. It demonstrates SQL-based segmentation, Excel summaries, and **Power BI dashboards**.

## Objectives
- Calculate overall churn and segment by **contract type**, **region**, and **plan**
- Compare **pricing** and **satisfaction** effects on churn
- Build an interactive dashboard for **Retention KPIs**

## Tools & Tech
- Database: MySQL
- Visualization: Power BI, Excel
- Language: SQL

## Data Dictionary
- `customer_id` (INT), `region` (TEXT), `plan_type` (TEXT), `contract_type` (TEXT)
- `internet_service` (TEXT), `tenure_months` (INT)
- `monthly_charges`, `total_charges` (NUMERIC)
- `auto_pay` (Yes/No), `support_tickets` (INT)
- `partner` (Yes/No), `dependents` (Yes/No)
- `satisfaction_score` (1–5), `last_interaction_days` (INT)
- `is_churn` (0/1)

## Key KPIs
- **Churn Rate %** and **Retention Rate %**
- **Avg Monthly Charges** — churned vs retained
- **Churn by Contract Type**, **Region**, **Plan**

## How to Reproduce
1. Import `customer_churn.csv` as table `churn` in MySQL.
2. Run `churn_analysis.sql` to generate KPI tables.
3. Open `churn_dashboard.xlsx` for pivot summaries.
4. In Power BI, load `customer_churn.csv`, apply the provided theme and DAX (`powerbi_measures.txt`):
   - Cards: Total Customers, Churn %, Retention %
   - Bar: Churn by Contract Type
   - Matrix: Churn by Region & Plan
   - Column: Avg Monthly Charges (Churned vs Retained)
   - Slicers: Region, Plan, Contract

## Screenshots
See `/dashboard_screenshots` for preview images:
- `churn_by_contract.png`
- `charges_vs_churn.png`
- `churn_by_region_plan_heatmap.png`

## Notes
- Dataset is synthetic but **statistically realistic**; churn probability is influenced by tenure, contract type, satisfaction, auto-pay, support tickets, and recency of interaction.
