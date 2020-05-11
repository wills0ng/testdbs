-- Get cities reachable from Seattle by direct flight
WITH direct_flight_cities AS (
  SELECT DISTINCT flights.dest_city AS city
  FROM flights
  WHERE flights.origin_city = 'Seattle WA'
),

-- Get cities reachable from Seattle by one stop flight
one_stop_cities AS (
  SELECT DISTINCT
    flight_2.dest_city AS city
  FROM flights AS flight_1
  INNER JOIN flights AS flight_2
    ON flight_1.dest_city = flight_2.origin_city
  WHERE flight_1.origin_city = 'Seattle WA'
    AND flight_2.dest_city != 'Seattle WA'
)

-- Main logic
SELECT DISTINCT flights.dest_city AS city
FROM flights
WHERE flights.dest_city NOT IN (
  SELECT city FROM direct_flight_cities
)
AND flights.dest_city NOT IN (
  SELECT city FROM one_stop_cities
)
AND flights.dest_city != 'Seattle WA'
ORDER BY city;

/*
rows = 4
execution_time = 7s

| city                   |
|------------------------|
| Devils Lake ND         |
| Hattiesburg/Laurel MS  |
| International Falls MN |
| Niagara Falls NY       |

*/
