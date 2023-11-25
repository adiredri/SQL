use SamiRestaurant
go


-- Q1
-- For each table that has been sat at least once with an excess of people, the capacity must be updated to the highest number of people that sat at that table.

UPDATE Tables 
SET Capacity = (SELECT numOfDiners FROM Visits WHERE Visits.Tnum = Tables.Tnum)
WHERE EXISTS (SELECT numOfDiners FROM Visits WHERE Visits.Tnum = Tables.Tnum AND numOfDiners > Capacity);

-- Q2
-- We will delete the dishes that were never ordered

DELETE FROM RESTAURANT_DISH 
WHERE dishName NOT IN 
(SELECT DISTINCT dishName FROM ORDERED_DISH);

-- Q3
-- Find the details of the visit where more than 5 dishes were ordered

SELECT * FROM Visits WHERE dinerName IN ( 

SELECT dinerName 
FROM ORDERED_DISH 
GROUP BY dinerName, phone, Date
HAVING COUNT(dishName) > 5 );

--Q4
-- Find the visit where all the dishes were from at most two different categories.

SELECT * FROM Visits WHERE dinerName IN(

SELECT dinerName  
FROM RESTAURANT_DISH AS R JOIN ORDERED_DISH AS O ON R.dishName = O.dishName
GROUP BY dinerName, phone, Date 
HAVING COUNT(DISTINCT category) <= 2);










