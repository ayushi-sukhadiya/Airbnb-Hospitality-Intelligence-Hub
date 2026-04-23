show databases;

create database Airbnb;

show databases;

use Airbnb;

select * from booking_details;

select * from listings;

# Q2 Write a query to show names from Listings table
select name from listings;

# Write a query to fetch total listings from the listings table
select distinct count(*) from listings;

# Write a query to fetch total listing_id from the booking_details table
select distinct count(listing_id) from booking_details;

# Write a query to fetch host ids from listings table
select distinct count(host_id) from listings;

# Write a query to fetch all unique host name from listings table
select distinct host_name from listings;

# Write a query to show all unique neighbourhood_group from listings table
select distinct neighbourhood_group from listings; 

# Write a query to show all unique neighbourhood from listings table
select distinct neighbourhood from listings; 

# Write a query to fetch unique room_type from listings tables
select distinct room_type from listings;

# Write a query to show all values of Brooklyn & Manhattan from listings tables
select * from listings where neighbourhood_group in ('Brooklyn', 'Manhattan');

# Write a query to show maximum price from booking_details table
select max(price) from booking_details;

# Write a query to show minimum price fron booking_details table
select min(price) from booking_details;

# Write a query to show average price from booking_details table
select round(avg(price)) from booking_details;

# Write a query to show minimum value of minimum_nights from booking_details table
select min(minimum_nights) from booking_details;

# Write a query to show maximum value of minimum_nights from booking_details table
select max(minimum_nights) from booking_details;

# Write a query to show average availability_365 
select round(avg(availability_365)) from booking_details;

# Write a query to show id , availability_365 and all availability_365 values greater than 300
select listing_id,availability_365 from booking_details where availability_365>300;

# Write a query to show count of id where price is in between 300 to 400
select count(listing_id) from booking_details where price between 300 and 400;

# Write a query to show count of id where minimum_nights spend is less than 5
select count(listing_id) from booking_details where minimum_nights < 5;

# Write a query to show count where minimum_nights spend is greater than 100
select count(listing_id) from booking_details where minimum_nights > 100;

# Write a query to show all data of listings & booking_details
select * from 
listings inner join booking_details
on listings.id = booking_details.listing_id;

# Write a query to show host name and price 
select host_name, price from 
listings join booking_details
on listings.id = booking_details.listing_id;

# Write a query to show room_type and price
SELECT l.room_type, AVG(b.price) AS avg_price
FROM listings l
JOIN booking_details b
ON l.id = b.listing_id
GROUP BY l.room_type;

# Write a query to show neighbourhood_group & minimum_nights spend
select l.neighbourhood_group , avg(b.minimum_nights) 
FROM listings l
JOIN booking_details b
ON l.id = b.listing_id
group by l.neighbourhood_group;

# Write a query to show neighbourhood & availability_365
select l.neighbourhood , avg(b.availability_365) 
FROM listings l
JOIN booking_details b
ON l.id = b.listing_id
group by l.neighbourhood;

# Write a query to show total price by neighbourhood_group
select sum(b.price) ,l.neighbourhood_group
FROM listings l
JOIN booking_details b
ON l.id = b.listing_id
group by l.neighbourhood_group;

# Write a query to show maximum price by neighbourhood_group
select max(b.price) ,l.neighbourhood_group
FROM listings l
JOIN booking_details b
ON l.id = b.listing_id
group by l.neighbourhood_group;

# Write a query to show maximum night spend by neighbourhood_group
select max(b.minimum_nights) ,l.neighbourhood_group
FROM listings l
JOIN booking_details b
ON l.id = b.listing_id
group by l.neighbourhood_group;

# Write a query to show maximum reviews_per_month spend by neighbourhood
select max(b.reviews_per_month) ,l.neighbourhood
FROM listings l
JOIN booking_details b
ON l.id = b.listing_id
group by l.neighbourhood;

# Write a query to show maximum price by room type
select max(b.price) ,l.room_type
FROM listings l
JOIN booking_details b
ON l.id = b.listing_id
group by l.room_type;

# Write a query to show average number_of_reviews by room_type
select avg(b.number_of_reviews) ,l.room_type
FROM listings l
JOIN booking_details b
ON l.id = b.listing_id
group by l.room_type;

# Write a query to show average price by room type
select avg(b.price) ,l.room_type
FROM listings l
JOIN booking_details b
ON l.id = b.listing_id
group by l.room_type;

# Write a query to show average night spend by room type
select avg(b.minimum_nights) ,l.room_type
FROM listings l
JOIN booking_details b
ON l.id = b.listing_id
group by l.room_type;

# Write a query to show average price by room type but average price is less than 100
select avg(b.price) ,l.room_type
FROM listings l
JOIN booking_details b
ON l.id = b.listing_id
group by l.room_type
having avg(b.price)<100;

# Write a query to show average night by neighbourhood and average_nights is greater than 5
select avg(b.minimum_nights) ,l.neighbourhood
FROM listings l
JOIN booking_details b
ON l.id = b.listing_id
group by l.neighbourhood
having avg(b.minimum_nights)>5;

# Write a query to show all data from listings where price is greater than 200 using sub-query.
SELECT * FROM listings
WHERE id IN (
    SELECT listing_id
    FROM booking_details
    WHERE price > 200
);

# Write a query to show all values from booking_details table where host id is 314941 using sub-query.
select * from booking_details
where listing_id in(
		select id from listings where host_id=314941);

# Find all pairs of id having the same host id, each pair coming once only.

# Write an sql query to show fetch all records that have the term cozy in name
select * from listings where name like "%cozy%";

# Write an sql query to show price, host id, neighbourhood_group of manhattan neighbourhood_group
select b.price, l.host_id,l.neighbourhood_group
from listings l 
join booking_details b
on l.id=b.listing_id
where neighbourhood_group= "manhattan";

