-- ============================================================
-- PROJECT: FRED Macroeconomic Analysis
-- File: 05_analysis_queries.sql
-- Description: Analysis queries for CPI and 
--              Unemployment datasets
-- Author: Sadaf Naveed
-- Date: May 2026
-- Version: 1.0
-- ============================================================

-- Question 1: When was inflation at its worst?

SELECT OBSERVATION_DATE, CPI_VALUE
FROM CPI_DATA
WHERE CPI_VALUE = (SELECT MAX(CPI_VALUE) FROM CPI_DATA);

-- Question 2: When was unemployment at its worst?

SELECT OBSERVATION_DATE, UNEMPLOYMENT_RATE
FROM UNEMPLOYMENT_DATA
WHERE UNEMPLOYMENT_RATE = (SELECT MAX(UNEMPLOYMENT_RATE) FROM UNEMPLOYMENT_DATA);

-- Question 3:During the highest unemployment periods, what was inflation doing?

SELECT U.OBSERVATION_DATE,
       U.UNEMPLOYMENT_RATE,
       C.CPI_VALUE
FROM UNEMPLOYMENT_DATA U
JOIN CPI_DATA C 
     ON U.OBSERVATION_DATE = C.OBSERVATION_DATE
WHERE U.UNEMPLOYMENT_RATE > 6
ORDER BY U.UNEMPLOYMENT_RATE DESC;

-- Question 4: What did inflation and unemployment look like during COVID?

SELECT 
    C.OBSERVATION_DATE,
    C.CPI_VALUE,
    U.UNEMPLOYMENT_RATE
FROM CPI_DATA C
JOIN UNEMPLOYMENT_DATA U
    ON C.OBSERVATION_DATE = U.OBSERVATION_DATE
WHERE C.OBSERVATION_DATE BETWEEN '2020-01-01' AND '2023-01-01'
ORDER BY C.OBSERVATION_DATE;

