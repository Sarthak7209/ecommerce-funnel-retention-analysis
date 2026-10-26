-- 1. Load raw events (source of truth, never modify)
CREATE OR REPLACE TABLE events_raw AS
SELECT *
FROM read_csv_auto('C:/Users/KIIT/Documents/ecommerce-funnel-retention-analysis/data/raw/events.csv');

-- 2. Check the schema
DESCRIBE events_raw;

-- 3. Convert epoch milliseconds to a real timestamp
CREATE OR REPLACE TABLE events AS
SELECT
    make_timestamp(CAST("timestamp" AS BIGINT) * 1000) AS ts,
    visitorid,
    event,
    itemid,
    transactionid
FROM events_raw;

-- 4. Verify the conversion
SELECT MIN(ts) AS first_event, MAX(ts) AS last_event, COUNT(*) AS n_rows
FROM events;