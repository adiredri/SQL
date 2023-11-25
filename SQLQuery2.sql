use SamiRestaurant
go


-- Q1
-- The details of the tables that can accommodate more than 5 diners must be presented.

SELECT * FROM Tables
WHERE Capacity > '5';

-- Q2
-- The details of customers who live in Ashdod or Be'er Sheva must be presented.

SELECT * FROM Diners
WHERE City IN ('Ashdod', 'Beer Sheva');

-- Q3
-- All customers who visited the restaurant in 2021 must be presented.

SELECT * FROM Visits
where Date between CONVERT(date,'1/1/2021',104)and CONVERT(date, '31/12/2021',104);

-- Q4
-- Show how many customers come from the city of Ashdod.

SELECT COUNT(City) 
FROM Diners 
WHERE city='Ashdod';

-- Q5
-- Each waiter must be shown the number of times he is a waiter and the number of customers that he served in total.

SELECT Wid, COUNT(Wid) as Num_Times, SUM(numOfDiners) as Num_Custumers
FROM Visits
GROUP BY Wid;

-- Q6
-- The waiters who worked at the same table more than twice must be introduced.

SELECT Wid, COUNT(Tnum) as Num_Wid
FROM Visits
GROUP BY Wid
HAVING COUNT(Tnum)>2;

-- Q7
-- The name and phone number of all the customers sitting at the table must be presented.

SELECT dinerName, phone
FROM Visits
WHERE Tnum = 5

-- Q8
-- All visits in which a number of people greater than the capacity of the table sat at the table must be presented.

SELECT dinerName,phone,Date,Visits.Tnum,Wid,numOfDiners
FROM Visits, Tables
WHERE Visits.Tnum = Tables.Tnum AND numOfDiners > Capacity;

