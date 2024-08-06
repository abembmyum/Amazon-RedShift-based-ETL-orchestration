UNLOAD ('
    SELECT 
        vendorid, 
        pulocationid, 
        dolocationid, 
        trip_distance, 
        payment_type, 
        fare_amount, 
        tip_amount, 
        total_amount, 
        EXTRACT(YEAR FROM tpep_pickup_datetime) AS year, 
        EXTRACT(MONTH FROM tpep_pickup_datetime) AS month, 
        AVG(passenger_count) as average_passengers 
    FROM public.yellow_trips_new
    GROUP BY 
        vendorid, 
        pulocationid, 
        dolocationid, 
        trip_distance, 
        payment_type, 
        fare_amount, 
        tip_amount, 
        total_amount, 
        EXTRACT(YEAR FROM tpep_pickup_datetime), 
        EXTRACT(MONTH FROM tpep_pickup_datetime)
    ORDER BY 
        EXTRACT(YEAR FROM tpep_pickup_datetime), 
        EXTRACT(MONTH FROM tpep_pickup_datetime), 
        fare_amount DESC, 
        tip_amount DESC
')
TO 's3://redshift-databucket123456/tripunload/'
IAM_ROLE 'arn:aws:iam::811504225581:role/myCCproject_role';