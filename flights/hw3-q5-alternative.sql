-- Method 2
SELECT
  one_stop.city AS one_stop_city,
  nonstop.city AS nonstop_city

FROM
(
  SELECT DISTINCT flight_2.dest_city AS city
  FROM flights AS flight_1
  INNER JOIN flights AS flight_2
    ON flight_1.dest_city = flight_2.origin_city
  WHERE flight_1.origin_city = 'Seattle WA'
  -- TODO: remove flights that go from Seattle to Seattle
) AS one_stop

LEFT OUTER JOIN
(
    SELECT DISTINCT flights.dest_city AS city
    FROM flights
    WHERE flights.origin_city = 'Seattle WA'
) AS nonstop
ON one_stop.city = nonstop.city

WHERE nonstop.city IS NULL;

--255 rows
-- 5.860 s
