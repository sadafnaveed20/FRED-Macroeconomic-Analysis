-- ============================================================
-- PROJECT: FRED Macroeconomic Analysis
-- File: 04_validation_checks.sql
-- Description: Post-load data quality checks for CPI and 
--              Unemployment datasets
-- Author: Sadaf Naveed
-- Date: May 2026
-- Version: 1.0
-- ============================================================

-- ============================================================
-- DATA VALIDATION: CPI_DATA table post-load quality checks
-- Checking row count, nulls, duplicates and date range
-- ============================================================

-- Total row count

SELECT COUNT(*) FROM CPI_DATA;

-- Preview first 10 rows

SELECT * FROM CPI_DATA LIMIT 10;

-- Check for NULL values in the table

SELECT * FROM CPI_DATA
WHERE OBSERVATION_DATE IS NULL
OR CPI_VALUE IS NULL;

-- Check for duplicate rows

SELECT OBSERVATION_DATE, COUNT(*) AS ROW_COUNT
FROM CPI_DATA
GROUP BY OBSERVATION_DATE
HAVING COUNT(*) > 1;

-- Date range validation

SELECT MIN(OBSERVATION_DATE), MAX(OBSERVATION_DATE)
FROM CPI_DATA;

-- Value range validation for CPI_VALUE

SELECT MIN(CPI_VALUE) AS MIN_CPI_VALUE, MAX(CPI_VALUE) AS MAX_CPI_VALUE
FROM CPI_DATA;


-- ============================================================
-- DATA VALIDATION: UNEMPLOYMENT_DATA table post-load quality checks
-- Checking row count, nulls, duplicates and date range
-- ============================================================

-- Total row count

SELECT COUNT (*) AS TOTAL_ROW_COUNT FROM UNEMPLOYMENT_DATA;

-- Preview first 10 rows

SELECT * FROM UNEMPLOYMENT_DATA LIMIT 10;

-- Check for NULL values in the table

SELECT *
FROM UNEMPLOYMENT_DATA
WHERE OBSERVATION_DATE IS NULL 
OR UNEMPLOYMENT_RATE IS NULL;

-- Check for duplicate rows

SELECT OBSERVATION_DATE, COUNT(*) AS ROW_COUNT
FROM UNEMPLOYMENT_DATA
GROUP BY OBSERVATION_DATE
HAVING COUNT(*) > 1;

-- Date range validation

SELECT MIN(OBSERVATION_DATE) AS EARLIEST_DATE,
MAX(OBSERVATION_DATE) AS MOST_RECENT_DATE
FROM UNEMPLOYMENT_DATA;

-- Value range validation for UNEMPLOYMENT_RATE

SELECT MIN(UNEMPLOYMENT_RATE) AS MIN_UNEMPLOYMENT_RATE, MAX(UNEMPLOYMENT_RATE) AS MAX_UNEMPLOYMENT_RATE
FROM UNEMPLOYMENT_DATA;