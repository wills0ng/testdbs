SELECT
  count_all.origin_city AS city,
  (100.0 * count_under3hrs.num_flights) / count_all.num_flights AS percentage
FROM (
  SELECT
  flights.origin_city,
  COUNT(*) AS num_flights
  FROM flights
  GROUP BY flights.origin_city
) AS count_all
LEFT OUTER JOIN (
  SELECT
  flights.origin_city,
  COUNT(*) AS num_flights
  FROM flights
  WHERE flights.actual_time < 3*60
  GROUP BY flights.origin_city
) AS count_under3hrs
  ON count_all.origin_city = count_under3hrs.origin_city;

/*
rows = 323
execution_time = 1s

| city                   | percentage       |
|------------------------|------------------|
| Dothan AL              | 100.000000000000 |
| Toledo OH              | 100.000000000000 |
| Peoria IL              | 100.000000000000 |
| Yuma AZ                | 100.000000000000 |
| Bakersfield CA         |  85.714285714285 |
| Ontario CA             |  89.308176100628 |
| Daytona Beach FL       | 100.000000000000 |
| Laramie WY             | 100.000000000000 |
| Victoria TX            | 100.000000000000 |
| North Bend/Coos Bay OR | 100.000000000000 |
| Erie PA                | 100.000000000000 |
| Guam TT                |                  |
| Columbus GA            | 100.000000000000 |
| Wichita Falls TX       | 100.000000000000 |
| Juneau AK              | 100.000000000000 |
| Hartford CT            |  85.798816568047 |
| Hattiesburg/Laurel MS  | 100.000000000000 |
| Myrtle Beach SC        |  97.560975609756 |
| Arcata/Eureka CA       | 100.000000000000 |
| Kotzebue AK            | 100.000000000000 |
*/
