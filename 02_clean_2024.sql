-- 02_clean_2024.sql
-- Preparing the 2024 country-level dataset for analysis.

-- I first filtered the raw dataset to the latest survey year (2024)
-- and kept only overall-population observations.
--
-- I did this because the raw dataset also contains demographic subgroup
-- observations, which would create multiple rows for the same economy.

SELECT *
FROM findex_raw
WHERE year = 2024
  AND `group` = 'all'
  AND group2 = 'all';

-- Finding:
-- This returned 153 observations.
--
-- At first, this looked like 153 economies. However, earlier profiling
-- showed that the dataset also contains World Bank aggregate rows such as
-- World, regional totals and income-group totals.

-- I then checked how those aggregate rows could be separated from actual
-- economy observations. In this dataset, the aggregate rows do not have
-- an income-group classification.

SELECT *
FROM findex_raw
WHERE year = 2024
  AND `group` = 'all'
  AND group2 = 'all'
  AND incomegroupwb24 IS NOT NULL;

-- Finding:
-- This returned 141 observations.
--
-- Conclusion:
-- The original 153 rows consisted of 141 economies and 12 aggregate rows.
-- I excluded the aggregates from country-level analysis because mixing
-- pre-calculated regional/global totals with individual economies would
-- distort country-level averages.
