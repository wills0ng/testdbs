SELECT one_stop.city
FROM (
  SELECT DISTINCT
    flight_2.dest_city AS city
  FROM flights AS flight_1
  INNER JOIN flights AS flight_2
    ON flight_1.dest_city = flight_2.origin_city
  WHERE flight_1.origin_city = 'Seattle WA'
    AND flight_2.dest_city != 'Seattle WA'
) AS one_stop
WHERE one_stop.city NOT IN (
  SELECT DISTINCT flights.dest_city AS city
  FROM flights
  WHERE flights.origin_city = 'Seattle WA'
)
ORDER BY city;

/*
rows = 254
execution_time = 6s

| city                          |
|-------------------------------|
| Aberdeen SD                   |
| Abilene TX                    |
| Aguadilla PR                  |
| Akron OH                      |
| Albany GA                     |
| Albany NY                     |
| Alexandria LA                 |
| Allentown/Bethlehem/Easton PA |
| Alpena MI                     |
| Amarillo TX                   |
| Appleton WI                   |
| Arcata/Eureka CA              |
| Asheville NC                  |
| Ashland WV                    |
| Aspen CO                      |
| Atlantic City NJ              |
| Augusta GA                    |
| Bakersfield CA                |
| Bangor ME                     |
| Barrow AK                     |
*/
