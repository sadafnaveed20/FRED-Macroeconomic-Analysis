-- ============================================================
-- PROJECT: FRED Macroeconomic Analysis
-- File: 05_analysis_queries.sql
-- Description: Analysis queries for CPI and 
--              Unemployment datasets
-- Author: Sadaf Naveed
-- Date:  June 2026
-- Version: 1.0
-- ============================================================

-- Question 1: When was inflation at its worst?

SELECT 
    OBSERVATION_DATE,
    CPI_VALUE
FROM CPI_DATA
WHERE CPI_VALUE = (SELECT MAX(CPI_VALUE) FROM CPI_DATA);

-- Question 2: When was unemployment at its worst?

SELECT 
    OBSERVATION_DATE,
    UNEMPLOYMENT_RATE
FROM UNEMPLOYMENT_DATA
WHERE UNEMPLOYMENT_RATE = (SELECT MAX(UNEMPLOYMENT_RATE) FROM UNEMPLOYMENT_DATA);

-- Question 3: What did inflation and unemployment look like during COVID?

SELECT 
    C.OBSERVATION_DATE,
    C.CPI_VALUE,
    U.UNEMPLOYMENT_RATE
FROM CPI_DATA C
JOIN UNEMPLOYMENT_DATA U
    ON C.OBSERVATION_DATE = U.OBSERVATION_DATE
WHERE C.OBSERVATION_DATE BETWEEN '2020-01-01' AND '2023-01-01'
ORDER BY C.OBSERVATION_DATE;

-- Question 4: Find all months where unemployment was at crisis level (above 8%) and show what inflation was doing

SELECT 
    U.OBSERVATION_DATE,
    U.UNEMPLOYMENT_RATE,
    C.CPI_VALUE
FROM UNEMPLOYMENT_DATA U
JOIN CPI_DATA C
    ON U.OBSERVATION_DATE = C.OBSERVATION_DATE
WHERE U.UNEMPLOYMENT_RATE > 8
ORDER BY U.OBSERVATION_DATE DESC;

-- Question 5: What is the Year-over-year (YOY) inflation rate for each month?

-- Approach: Uses the LAG window function inside a CTE to pull each 
-- month's CPI from 12 months earlier, then calculates YoY inflation 
-- as the percentage change. The CTE avoids repeating the LAG 
-- expression and keeps the calculation readable.
--
-- Note: The first 12 months return NULL since no prior-year value 
-- exists for them.
    
    WITH CPI_PRIOR_YEAR AS (
    SELECT 
        OBSERVATION_DATE,
        CPI_VALUE AS CURRENT_CPI,
        LAG(CPI_VALUE, 12) OVER (ORDER BY OBSERVATION_DATE) AS CPI_12_MONTHS_AGO
    FROM CPI_DATA
)
SELECT 
    OBSERVATION_DATE,
    CURRENT_CPI,
    CPI_12_MONTHS_AGO,
    ROUND((CURRENT_CPI - CPI_12_MONTHS_AGO) / CPI_12_MONTHS_AGO * 100, 2) AS YOY_INFLATION_PERCENT
FROM CPI_PRIOR_YEAR;

