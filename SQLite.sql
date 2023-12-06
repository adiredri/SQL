-------------------------------   SQL Learning   -------------------------------
 

-- Create table car 
create table car (id int PRIMARY KEY, model text, 
                  year int, subtype text, engine int, km int, cost int);

-- Insert values to table
insert into car values (55798, 'Toyota', 2019, 'yaris', 1800, 45000, 300);
insert into car values (19465, 'Lamborghini', 2020, 'v3', 2800, 30000, 900);
insert into car values (38351, 'Suzuki',2018,'Alto',1000,60000,300);
insert into car values (22055,'Volvo',2018,'s80',2200,60000,500);
insert into car values (29293,'BMW',2020,'X5',2500,30000,400);
insert into car values (58494,'Skoda',2019,'Superb',2200,45000,200);
insert into car values (23509,'Subaru',2015,'v4',2200,90000,500);
insert into car values (59599,'Nissan',2021,'xara',2000,15000,300);
insert into car values (58484,'Toyota',2022,'yaris',1600,4000,400);
insert into car values (71866,'Toyota',2022,'ch',1800,7000,150);
insert into car values (36468,'Subaru',2015,'A9',2000,105000,100);
insert into car values (68300,'Volvo',2018,'s40',2200,60000,200);
insert into car values (94015,'Suzuki',2019,'R90',1700,45000,400);
insert into car values (13714,'Volvo',2017,'s80',2400,75000,100);
insert into car values (13305,'Subaru',2016,'v4',1900,90000,300);
insert into car values (89571,'Toyota',2017,'yaris',1600,75000,300);
insert into car values (19391,'Nissan',2019,'xara',1600,45000,200);
insert into car values (61406,'Lamborghini',2020,'r450',2600,30000,900);
insert into car values (41874,'Toyota',2021,'ch',1800,15000,300);

-- Show table
select * from car;


-------------------------------- BASIC QUERYS ------------------------------------------


-- Show 3 lines from line 7
select *  from car limit(3) offset(7)

-- Show all cars whose production year is after 2018:
select * from car WHERE YEAR > 2018

-- All cars whose model name is Toyota:
select * from car where model=='Toyota';

-- All Toyota cars whose year of manufacture is less than 2020
select * from car where model=='Toyota' AND year < 2020;

-- All cars whose production year is 2019 or whose cost is less than 500
select * from car where year==2019 OR cost < 500;

-- All cars whose mileage is greater than 40,000.
select * from car where km > 40000

-- The years of production of the cars whose cost is between 200 and 500.
select year from car where cost > 200 and cost < 500

-- All cars whose cost is 300 or whose mileage is less than or equal to 60000.
select * from car where cost==300 or km <= 60000

-- The names of the types of cars whose engine capacity is greater than 2000 and also their cost is less than 500.
select model from car where engine > 2000 and cost < 500

-- All the cars for which the year field is not specified (Nulls)
select * from car where Year is NULL

-- All the cars that do have the year field specified
select * from car where year is NOT null;

-- The list of all cars whose model is Toyota or Suzuki
select * from car where Model in ('Suzuki', 'Toyota');

-- Types of costs that are not less than 800
select DISTINCT cost from car where not cost < 800;


----------------------- UPDATE, DROP, ALTER, RENAME, DUPLICATE --------------------------


-- Delete all values 
DELETE from car;

-- Delete of all cars manufactured after 2020
delete from car where year > 2020;

-- Adding a new column
alter table car add cost_dollar3;
update car set cost_dollar3 = cost / 3;

-- Rename column
ALTER TABLE car RENAME COLUMN cost_dollar3 TO costDollar;

-- A new table based on the columns and values that exist in the table car
CREATE TABLE new_car AS SELECT * FROM car ;

-- Duplicate values
insert into new_car (id, model) select id, model from car;

-- Based on the cars table, create a new table so that it contains only the Model, Year, and Mileage fields. Put in this table all the cars whose production year is 2022 or higher, or whose mileage is less than 50,000.
create table new_car2 as select model, year, km from car where year >= 2022 or km < 50000;


------------------------------------- BETWEEN -------------------------------------


-- Show cars whose production year is between 2019 and 2020 (int)
select * from car where year BETWEEN 2019 and 2020;

-- Show cars whose starts between A and C (string)
select DISTINCT model from car where model BETWEEN 'A' and 'D';

-- Show all cars whose production year is between 2022 and 2020 or whose cost is between 100 and 200
select * from car where year BETWEEN 2020 and 2022 or cost BETWEEN 100 and 200;


---------------------------------- DATETIME -------------------------------------


-- Adding a new date column 
alter table car ADD COLUMN date;

-- Update all the values of date's column
update car set date = '2023-12-05 15:06:22.34'

-- Update all the values of date's column to today  
update car set date = datetime('now');

-- Update date's column to today from car table, if their cost is bigger than 600,  
update car set date = datetime('now') WHERE cost > 600;

-- Show all cars whose date column shows the date of the last two weeks
select date, cost from car where date BETWEEN '2023-11-22 07:36:39' and datetime('now');

-- Another way to show this query:
select date, cost from car where date > '2023-11-22 07:36:39';


------------------------------------- SORT --------------------------------------


-- Sorting with ORDER BY
select * from car order by cost;       -- low to high 
select * from car order by cost DESC;  -- high to low 

-- Show all the cars sorted by the earliest year
select * from car order by year;

-- Show all the cars sorted by the newest year
select * from car order by year DESC;

-- Create a query to get the id of the cars, and the mileage, sorted by mileage.
select id, km from car order by cast(km as int);   -- CAST to compare between strings


------------------------------------ Functions ----------------------------------------


-- min, max, avarage, count
select max(cost) from car;
select min(cost) from car;
select avg(cost) from car;
select count(id) from car;

-- substring
select model, substr(model, 2, 3) from car limit (1);

-- Show all names of the models in the table of cars whose second letter in the model name is u.
select distinct model from car where substr(model, 2, 1) = 'u';


----------------------------------- Nesting queries ------------------------------------


-- What is the maximum cost among the vehicles whose mileage is greater than the average mileage?
select max(Cost) from car WHERE km > (select avg(km) from car);

-- Show the model names of cars whose cost is not more than 100 shekels than the price of the cheapest car.
select model from car where cost < (100 + (select min(cost) from car));

-- Show the oldest production year whose mileage is not less than 10,000 compared to the average mileage.
select min(year), km from car where km > 10000 + (select avg(km) from car);


----------------------------------- Create table person -----------------------------------
CREATE TABLE person(
id int primary key not null,
fname text not null, 
lname text not null,
year int,
city text,
car_id int   
);

-- Insert values to table
insert into person values(0, 'david', 'cohen', 1992, 'jerusalem', 55796);
insert into person values(1, 'ori', 'levi', 1985, 'telaviv', 19465);
insert into person values(2, 'moshe', 'salamon', 2001, 'haifa', 38351);
insert into person values(3, 'yosef', 'friedman', 2005, 'haifa', 22055);
insert into person values(4, 'rina', 'azulay', 1987 , 'telaviv', 29293);
insert into person values(5, 'tova', 'levi', 1992, 'jerusalem', 58494);
insert into person values(6, 'eliyahu', 'cohen', 2005, 'beersheva', 23509);
insert into person values(7, 'sivan', 'levi', 1985, 'jerusalem', 58484);
insert into person values(8, 'gadi', 'azulay', 2001, 'jerusalem', 71866);
insert into person values(9, 'david', 'dahan', 1986, 'telaviv', 36468);
insert into person values(10, 'Noach' ,'yoav',1975,'haifa',36468);
insert into person values(11, 'Simcha' ,'shalom',1985,'rishon-letzion',68300);
insert into person values(12, 'Yona' ,'ben-david',2001,'beit-shemesh',94015);
insert into person values(13, 'Shalva' ,'tzion',1997,'eilat',60031);
insert into person values(14, 'Sami' ,'eliav',1968,'beersheva',13714);
insert into person values(15, 'Jane' ,'sason',1983,'ramat-gan',13305);
insert into person values(16, 'shalom' ,'burnstain',1987,'ramat-gan',89571);
insert into person values(17, 'Roi' ,'epstain',1988,'yesodot',19391);
insert into person values(18, 'Lea' ,'tzion',1994,'efrat',61406);
insert into person values(19, 'chen' ,'golan',1993,'dagan',41874);

-- Show table
select * from person;


---------------------------------- BASIC QUERYS-----------------------------------------


-- Execute a query to the table, to get all the names of the different cities in the table.
select distinct city from person;

-- updated the birth year of the person with id=0 to be 1995.
UPDATE person SET year=1995 WHERE id=0 

-- Changed the first name of all people born in 1992 to be Avigail.
update person set fname="Avigail" where year == 1992;

-- Delete everyone who was born after 2000 and also lives in Jerusalem.
delete from person where year > 2000 and city == 'jerusalem';

-- How many different surnames are there in the table? Use the query to see them without duplicates.
select distinct lname from person;

-- Change the last name of anyone whose current last name is Cohen and who also lives in Jerusalem. Or if it has an id greater than 8. The new last name you will use will be coen instead of cohen.
update person set lname='coen' where (lname=='cohen' and city=='jerusalem') or id > 8;

-- Show all the last names of all people whose year field is null.
select lname from person where year is null;


--------------------------------------- Nesting queries -------------------------------------------


-- Show the km of all cars whose owner is called david
select km from car  where id in
(select car_id from person where fname == 'david');

-- Show the names of the people whose cars cost more than the average
select fname from person where car_id in
(select id from car WHERE cost > (select avg(cost) from car));

-- Show the names of the cities where people whose Toyota cars live
select distinct(city) from person where car_id in
(select id from car WHERE model = "Toyota");


--------------------------------------- JOINS -------------------------------------------


-- Classic INNERJOIN
select *  from person join car on person.car_id = car.id;

-- Write a query that will display values containing a person's name and the name of their car model
select person.fname, car.model from person join car on person.car_id = car.id;

-- Show only the rows where a car costs more than 800
select p.fname, c.model from person p join car c
on p.car_id = c.id where cost > 800;

-- LEFT JOIN
select * from car c left join person p on c.id == p.car_id;

-- RIGHT JOIN
select * from car c RIGHT join person p on c.id == p.car_id;

-- FULL OUTER JOIN
select * from car c FULL OUTER join person p on c.id == p.car_id;

-- Show a join table when the join condition is that the person's year of birth is 10 years earlier than the car's year of manufacture.
select * from car c join person p on c.year = p.year + 10;


--------------------------------------- GROUP BY -------------------------------------------


-- Show the average mileage of the cars, but according to the different years. That the result will also contain a column with the grade of the year, so that the information will be more informative.
select year, avg(km) from car group by year;

-- Show how many values there are from each group (models)
select model, count(model) from car group by model;

-- How many different costs are there in the car table, and how many cars are there for each cost?
select cost, count(cost) from car group by cost;

-- How many different production years are there for the cars, and how many cars from each production year?
select year, count(*) from car group by year ;

-- What is the most common car year of manufacture, and how many cars are there?
select T.year, max(T.cnt) from (select year, count(*) as cnt from car group by year) as T;

-- Divide into groups by both the car's model name and its year of manufacture and show a count
select year, model, count(*) from car
group by  year, model;


--------------------------------------- REGULAR EXPRESSION ------------------------------------------


-- Show all Toyota model cars.
select model from car where  model like 'toyota';

-- Find words that contains the letter 'o'
select DISTINCT model from car where  model like '%o%';

-- Find words that starts with the letter 'v'
select DISTINCT model from car where  model like 'v%';

-- Find words that end with the letter 'a'
select DISTINCT model from car where  model like '%a';

-- Search for a person whose name contains the letters 'ch':
select DISTINCT fname from person where fname like '%ch%';

select fname, Lname from person where fname like '_a%';

-- Show all cars whose model is exactly 5 letters long
select DISTINCT model from car where model like '_____';

-- Find all cars whose model starts with 'b'.
select model from car where model like 'b%';

-- Find all the people from the person table whose first and last names contain the letter 'a'
select fname, lname from person where lname like '%a%' and fname like '%a%';

-- Find the first name of the person whose year of birth is the latest among the values in person's table , and whose last name contains the letter 'a' in the second letter.
select max(year), fname from person where fname like "_a%";


--------------------------------------- TRANSACTION -------------------------------------------

-- A transaction that adding 2 columns and casting the cost to dollar and euro.
BEGIN TRANSACTION;

alter table car add costDollar;
alter table car add costEuro;
update car set costDollar = cost * 3;
update car set costEuro = cost * 4;

COMMIT;























