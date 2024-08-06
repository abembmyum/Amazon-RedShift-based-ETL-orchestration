-- Create an external schema for the TLC trip data
CREATE EXTERNAL SCHEMA yellow_tlc_trips
FROM data catalog
DATABASE 'yellow_tlc_trips'
IAM_ROLE 'arn:aws:iam::811504225581:role/myCCproject_role'
CREATE EXTERNAL DATABASE IF NOT EXISTS;

CREATE EXTERNAL TABLE yellow_tlc_trips.yellow_trips_jan_2023 ( 
  vendorid bigint,
  tpep_pickup_datetime timestamp,
  tpep_dropoff_datetime timestamp,
  passenger_count double precision,
  trip_distance double precision,
  ratecodeid double precision,
  pulocationid bigint,
  dolocationid bigint,
  payment_type bigint,
  fare_amount double precision,
  extra double precision,
  mta_tax double precision,
  tip_amount double precision,
  tolls_amount double precision,
  improvement_surcharge double precision,
  total_amount double precision,
  congestion_surcharge double precision
)
STORED AS PARQUET
LOCATION 's3://redshift-scriptbucket123456/data/';

CREATE TABLE IF NOT EXISTS public.yellow_trips_new (
  vendorid bigint,
  tpep_pickup_datetime timestamp,
  tpep_dropoff_datetime timestamp,
  passenger_count double precision,
  trip_distance double precision,
  ratecodeid double precision,
  pulocationid bigint,
  dolocationid bigint,
  payment_type bigint,
  fare_amount double precision,
  extra double precision,
  mta_tax double precision,
  tip_amount double precision,
  tolls_amount double precision,
  improvement_surcharge double precision,
  total_amount double precision,
  congestion_surcharge double precision
)
DISTKEY (pulocationid)
SORTKEY (tpep_pickup_datetime);