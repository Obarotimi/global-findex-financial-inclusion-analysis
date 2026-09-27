-- 01_data_quality.sql
-- Initial data quality checks for the Global Findex dataset

-- 1. Total number of rows
SELECT COUNT(*)
FROM findex_raw;

-- 2. Number of distinct economies/entities
SELECT COUNT(DISTINCT countrynewwb)
FROM findex_raw;

-- 3. Number of non-missing account ownership observations
SELECT COUNT(account_t_d)
FROM findex_raw;

-- 4. Number of non-missing mobile money observations
SELECT COUNT(mobileaccount_t_d)
FROM findex_raw;

-- Results observed:
-- Total rows: 8578
-- Distinct economies/entities: 175
-- Non-null account ownership: 8488
-- Non-null mobile money account: 2528
