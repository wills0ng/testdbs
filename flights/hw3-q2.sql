SELECT
	flights.origin_city AS city
FROM flights
GROUP BY flights.origin_city
HAVING MAX(flights.actual_time) < (3*60);

/*
rows = 197
execution_time = 1s

| city                   |
|------------------------|
| Dothan AL              |
| Toledo OH              |
| Peoria IL              |
| Yuma AZ                |
| Daytona Beach FL       |
| Laramie WY             |
| Victoria TX            |
| North Bend/Coos Bay OR |
| Erie PA                |
| Columbus GA            |
| Wichita Falls TX       |
| Juneau AK              |
| Hattiesburg/Laurel MS  |
| Arcata/Eureka CA       |
| Kotzebue AK            |
| Medford OR             |
| Green Bay WI           |
| Santa Maria CA         |
| Muskegon MI            |
| Elko NV                |
*/
