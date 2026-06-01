-- ============================================================
-- PROJECT: FRED Macroeconomic Analysis
-- Description: End-to-end SQL data analysis project using macroeconomic data from
--              the Federal Reserve Economic Data (FRED) sourced from fred.stlouisfed.org. 
--              The project covers data ingestion, validation, joins, window functions,
--              views, and stored procedures.          
-- Author: Sadaf Naveed
-- Date: May 2026
-- Version: 1.0
-- ============================================================


-- Create database to store Federal Reserve Economic Data (FRED) for macroeconomic analysis

CREATE DATABASE FRED_DB;

-- Note: PUBLIC schema created automatically with database
-- All project tables will be stored in PUBLIC schema
-- Additional schemas not required for this project


-- Create CPI table to store Consumer Price Index data
-- Source: fred.stlouisfed.org
-- Baseline: 1982-1984 = 100

CREATE TABLE CPI_DATA (
    OBSERVATION_DATE DATE,
    CPI_VALUE FLOAT
);

-- Create unemployment table to store National Unemployment Rate data
-- Source: fred.stlouisfed.org
-- Series: UNRATE - National Unemployment Rate

CREATE TABLE UNEMPLOYMENT_DATA (
    OBSERVATION_DATE DATE,
    UNEMPLOYMENT_RATE FLOAT
);

