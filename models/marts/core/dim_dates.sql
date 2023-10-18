WITH DateRange AS (
  SELECT
    DATE '2016-01-01' AS DateKey,
    DATE '2016-01-01' AS Date
  UNION ALL
  SELECT
    DateKey + 1 AS DateKey,
    Date + 1 AS Date
  FROM DateRange
  WHERE Date < DATE '2030-12-31'
)
SELECT
  DateKey,
  Date,
  EXTRACT(DOW FROM Date) AS DayOfWeek, -- Day of the week (1 for Sunday, 2 for Monday, etc.)
  EXTRACT(MONTH FROM Date) AS Month,
  EXTRACT(QUARTER FROM Date) AS Quarter,
  EXTRACT(YEAR FROM Date) AS Year
FROM DateRange
