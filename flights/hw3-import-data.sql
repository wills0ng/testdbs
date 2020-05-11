CREATE EXTERNAL DATA SOURCE info330blob
WITH (  TYPE = BLOB_STORAGE,
        LOCATION = 'https://info33019au.blob.core.windows.net/info330'
);

bulk insert Carriers from 'carriers.csv'
with (ROWTERMINATOR = '0x0a',
DATA_SOURCE = 'info330blob', FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
FIRSTROW=1,TABLOCK);

bulk insert Months from 'months.csv'
with (ROWTERMINATOR = '0x0a',
DATA_SOURCE = 'info330blob', FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
FIRSTROW=1,TABLOCK);

bulk insert Weekdays from 'weekdays.csv'
with (ROWTERMINATOR = '0x0a',
DATA_SOURCE = 'info330blob', FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
FIRSTROW=1,TABLOCK);

-- Import for a subset of the large Flights table
-- This last import might take a little longer
bulk insert Flights from 'flights_first_day_only.csv'
with (ROWTERMINATOR = '0x0a',
DATA_SOURCE = 'info330blob', FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
FIRSTROW=1,TABLOCK);

SELECT count(*)
FROM Carriers;
--1594 rows

SELECT count(*)
FROM Months;
--12 rows

SELECT count(*)
FROM Weekdays;
--8 rows

SELECT count(*)
FROM Flights;
--37922 rows

