# Summary
This project builds an analysis-ready macroeconomic dataset in **Snowflake** using the **U.S. Consumer Price Index (CPI)** and **National Unemployment Rate** time series from **Federal Reserve Economic Data (FRED)**. It produces stakeholder-friendly metrics such as **Year-over-Year (YoY) inflation** and explores the historical relationship between inflation and unemployment. The goal is to translate an everyday question—*"Why does everything feel more expensive?"*—into a structured, reproducible analytics workflow that supports consistent reporting, trend monitoring, and decision-making.

I designed a SQL-first pipeline with **data quality controls**, **explicit type handling**, and **time-series calculations** to ensure accurate results (including handling months with **missing values as NULL** rather than hiding gaps). Outputs from SQL will be extended into **Power BI** for executive-ready visuals and narrative insights.

*Data current as of May 2026.*

# Business Problem
Inflation affects consumer behavior, budgeting, pricing strategies, and cost forecasting—yet many "inflation conversations" are anecdotal. Stakeholders need a reliable way to answer:

* **What is inflation YoY right now (headline inflation)?**
* **Is inflation accelerating or cooling (disinflation)?**
* **When were inflation spikes most severe historically?**
* **What was inflation doing during periods of high unemployment?**
* **How should planning assumptions change based on observed trends?**

This project converts macroeconomic time-series data into a repeatable analytics model that supports consistent **YoY inflation reporting**, anomaly detection, and trend interpretation.

# Tech Stack
* **Snowflake** — cloud data warehouse for storage and SQL analysis
* **SQL** — data modeling, validation, joins, and time-series calculations
* **Power BI** — planned visualization layer (in progress)
* **Git / GitHub** — version control and project documentation

# Data Sources
* **CPI:** FRED Series `CPIAUCSL` — Consumer Price Index for All Urban Consumers (monthly, 1947–present, 1982–84 = 100)
* **Unemployment:** FRED Series `UNRATE` — National Unemployment Rate (monthly, 1948–present)

# Repository Structure
* `01_create_database.sql' -  database and table creation
* `02_load_cpi_data.sql` -  CPI data ingestion documentation
* `03_load_unemployment_data.sql` - unemployment data ingestion documentation
* `04_validation_checks.sql` - post-load data quality checks
* `05_analysis_queries.sql` - analysis queries and insights
