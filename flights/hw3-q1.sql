SELECT DISTINCT
  flights.origin_city,
  flights.dest_city,
  flights.actual_time AS time
FROM flights
INNER JOIN (
  SELECT
    flights.origin_city AS origin_city,
    MAX(flights.actual_time) AS actual_time
  FROM flights
  GROUP BY flights.origin_city
) AS max_flight_times
  ON flights.origin_city = max_flight_times.origin_city
  AND flights.actual_time = max_flight_times.actual_time
ORDER BY flights.origin_city, flights.dest_city;

/*
rows = 327
execution_time = 1s

| origin_city                   | dest_city            | time |
|-------------------------------|----------------------|------|
| Aberdeen SD                   | Minneapolis MN       |  101 |
| Abilene TX                    | Dallas/Fort Worth TX |   84 |
| Aguadilla PR                  | Newark NJ            |  247 |
| Akron OH                      | Denver CO            |  203 |
| Albany GA                     | Atlanta GA           |   94 |
| Albany NY                     | Las Vegas NV         |  325 |
| Albuquerque NM                | New York NY          |  229 |
| Alexandria LA                 | Houston TX           |  168 |
| Allentown/Bethlehem/Easton PA | Chicago IL           |  141 |
| Alpena MI                     | Detroit MI           |   56 |
| Amarillo TX                   | Las Vegas NV         |  125 |
| Anchorage AK                  | Atlanta GA           |  428 |
| Appleton WI                   | Atlanta GA           |  155 |
| Arcata/Eureka CA              | San Francisco CA     |   79 |
| Asheville NC                  | Houston TX           |  142 |
| Ashland WV                    | Cincinnati OH        |   55 |
| Aspen CO                      | Chicago IL           |  176 |
| Atlanta GA                    | Honolulu HI          |  649 |
| Atlantic City NJ              | Fort Lauderdale FL   |  166 |
| Augusta GA                    | Atlanta GA           |   87 |
*/
