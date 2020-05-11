SELECT DISTINCT
  carriers.name AS carrier

FROM flights
INNER JOIN carriers
  ON flights.carrier_id = carriers.cid

WHERE flights.origin_city = 'Seattle WA'
AND flights.dest_city = 'San Francisco CA'
ORDER BY carriers.name;

/*
rows = 3
execution_time = 0s

| carrier               |
|-----------------------|
| Alaska Airlines Inc.  |
| United Air Lines Inc. |
| Virgin America        |

*/
