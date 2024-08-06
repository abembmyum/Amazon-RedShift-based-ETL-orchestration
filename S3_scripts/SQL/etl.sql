INSERT INTO public.yellow_trips_new
SELECT 
    vendorid, 
    tpep_pickup_datetime, 
    tpep_dropoff_datetime, 
    passenger_count, 
    trip_distance, 
    ratecodeid,  
    pulocationid, 
    dolocationid, 
    payment_type, 
    fare_amount, 
    extra, 
    mta_tax, 
    tip_amount, 
    tolls_amount, 
    improvement_surcharge, 
    total_amount, 
    congestion_surcharge
FROM yellow_tlc_trips.yellow_trips_jan_2023;