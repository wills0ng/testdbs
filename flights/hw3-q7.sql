SELECT carriers.name AS carrier

FROM carriers
WHERE cid IN (
  SELECT DISTINCT
    flights.carrier_id
  FROM flights
  WHERE flights.origin_city = 'Seattle WA'
  AND flights.dest_city = 'San Francisco CA'
)
ORDER BY carrier
;

/*
rows = 3
execution_time = 0s

| carrier               |
|-----------------------|
| Alaska Airlines Inc.  |
| United Air Lines Inc. |
| Virgin America        |

*/
