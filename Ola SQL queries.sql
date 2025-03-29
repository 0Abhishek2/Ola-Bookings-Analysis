create database projects;
use projects;
show tables;
-- 1. Retrieve all successful bookings:
-- Ans - -- select * from Successful_Bookings;
create view Successful_Bookings as
select * from bookings
where Booking_Status = 'success';

-- 2. Find the average ride distance for each vehicle type:
create view  ride_distance_for_each_vehicle as
select vehicle_type, AVG(ride_distance)
as avg_distance from bookings 
group by vehicle_type;

-- 3. Get the total number of cancelled rides by customers:
create view total_number_of_canceled_rides_by_customers as 
select count(8) from bookings
where booking_status = 'canceled by customer';

-- 4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers as
select customer_id , count(Booking_id) as total_rides
from bookings 
group by customer_id 
order by total_rides DESC limit 5;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view canceled_by_drivers_issues as 
select count(*)from bookings 
where canceled_rides_by_driver = 'personal & car related issues';

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW driver_ratings_for_Prime_Sedan_bookings as 
SELECT MAX(Driver_Ratings) as max_rating, 
MIN(Driver_Ratings) as min_rating 
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';

-- 7. Retrieve all rides where payment was made using UPI:
create view UPI_payment as
select * from bookings 
where payment_Method = 'UPI';

-- 8. Find the average customer rating per vehicle type:
create view customer_rating_per_vehicle as 
select Vehicle_type, avg(Customer_Rating) as avg_customer_rating
from bookings 
group by Vehicle_Type;

-- 9. Calculate the total booking value of rides completed successfully:
create view total_value_of_ride_completeded as 
select sum(Booking_value) as sum_booking_value
from bookings 
where Booking_Status ='success';

-- 10. List all incomplete rides along with the reason:
create view incomplete_rides_along_with_the_reason as 
SELECT Booking_ID, Incomplete_Rides_Reason
 FROM bookings 
 WHERE Incomplete_Rides ='Yes';
