create database SamiRestaurant;

CREATE TABLE Tables
(
Tnum int,
PRIMARY KEY(Tnum), 
Floor int,
CONSTRAINT CHK_Floor CHECK (Floor >=0 AND Floor <=4),
Capacity int,
CONSTRAINT CHK_Capacity CHECK (Capacity >=0 AND Capacity <=25),
Location varchar(255)
);

insert into Tables values('6','2','6','Near stairs');
insert into Tables values('1','1','4','Near entrance');
insert into Tables values('2','1','4','Far corner on the right');
insert into Tables values('7','2','4','Far corner');
insert into Tables values('8','2','8','Far corner');
insert into Tables values('3','1','2','Near window');
insert into Tables values('4','1','2','Far corner on the left');
insert into Tables values('5','1','2','Near window');
insert into Tables values('9','2','8','Near stairs');

DROP TABLE Tables;

CREATE TABLE Diners
(
name varchar(255),
phone varchar(255),
City varchar(255),
CONSTRAINT PK_NamePhone PRIMARY KEY (name,phone)
);

insert into Diners values('Dana Shalev','050-1234567','Ashdod');
insert into Diners values('Afik Swissa','054-4561987','Ashdod');
insert into Diners values('Adir Edri','052-1597534','Ashdod');
insert into Diners values('Yossi Cohen','050-1486357','Ashkelon');
insert into Diners values('Eli Ohana','050-1748652','Ashdod');
insert into Diners values('Itzik Zohar','050-4598125','Ramle');
insert into Diners values('Shani Feldman','050-4781523','Tel Aviv');
insert into Diners values('Zhoara Vaanono','050-9658412','Ako');
insert into Diners values('Shontal Karadi','050-4875321','Afula');
insert into Diners values('Yariv Goldwaser','050-1546328','Savion');

DROP TABLE Diners;

CREATE TABLE Waiters
(
wid int,
PRIMARY KEY(wid),
wname varchar(255),
City varchar(255),
);

insert into Waiters values('111','Shoshana Yehezkeli','Ashdod');
insert into Waiters values('112','Avi Shukrun','Ashdod');
insert into Waiters values('113','Noa Malka','Ashdod');
insert into Waiters values('114','Maayan Cohen','Ashdod');
insert into Waiters values('115','Aviad Vaknin','Ashdod');
insert into Waiters values('116','Shiran Lasri','Ashdod');
insert into Waiters values('117','Adi Aharon','Ashdod');
insert into Waiters values('118','Eli Ben Lulu','Ashdod');
insert into Waiters values('119','Daniel Ellashvili','Ashdod');
insert into Waiters values('120','Vladi Tommy','Ashdod');

DROP TABLE Waiters;

CREATE TABLE Visits
(
dinerName varchar(255),
phone varchar(255),
Date date,
Tnum int,
Wid int,
numOfDiners int,
CONSTRAINT PK_dinerNamePhone PRIMARY KEY (dinerName,phone,Date),
FOREIGN KEY (Tnum) REFERENCES Tables(Tnum),
FOREIGN KEY (wid) REFERENCES Waiters(wid),
);

insert into Visits values('Dana Shalev','050-1234567','5/9/2022','5','111','6');
insert into Visits values('Afik Swissa','054-4561987','5/9/2022','4','114','5');
insert into Visits values('Adir Edri','052-1597534','6/9/2022','6','115','4');
insert into Visits values('Yossi Cohen','050-1486357','6/9/2022','8','118','8');
insert into Visits values('Eli Ohana','050-1748652','10/9/2022','5','119','10');
insert into Visits values('Itzik Zohar','050-4598125','8/8/2022','9','120','9');
insert into Visits values('Shani Feldman','050-4781523','11/9/2022','2','111','3');
insert into Visits values('Zhoara Vaanono','050-9658412','4/10/2022','3','113','2');
insert into Visits values('Shontal Karadi','050-4875321','5/12/2022','8','112','2');
insert into Visits values('Yariv Goldwaser','050-1546328','4/1/2023','7','119','1');


DROP TABLE Visits;

CREATE TABLE RESTAURANT_DISH
(
dishName varchar(255),
category varchar(255),
price decimal(5,2),
CONSTRAINT PK_dishName  PRIMARY KEY (dishName)
);

insert into RESTAURANT_DISH values('Steak','Meat','300');
insert into RESTAURANT_DISH values('Kabab','Meat','150');
insert into RESTAURANT_DISH values('Shnitzel','Meat','99.90');
insert into RESTAURANT_DISH values('Fettuccine','Pasta','120');
insert into RESTAURANT_DISH values('Penne','Pasta','80');
insert into RESTAURANT_DISH values('Spaggeti','Pasta','100');
insert into RESTAURANT_DISH values('Risotto','Appetizer','79.90');
insert into RESTAURANT_DISH values('Fries','Appetizer','50');
insert into RESTAURANT_DISH values('Souffle','Dessert','90');
insert into RESTAURANT_DISH values('Cheesecake','Dessert','60');

DROP TABLE RESTAURANT_DISH;


CREATE TABLE ORDERED_DISH
(
dinerName varchar(255),
phone varchar(255),
Date date,
dishName varchar(255),
CONSTRAINT PK_orderedDish PRIMARY KEY (dinerName, phone, Date, dishName),
FOREIGN KEY (dinerName, phone, Date) REFERENCES Visits(dinerName, phone, Date), 
FOREIGN KEY (dishName) REFERENCES RESTAURANT_DISH(dishName)
);

insert into ORDERED_DISH values('Dana Shalev','050-1234567','5/9/2022','Steak');
insert into ORDERED_DISH values('Dana Shalev','050-1234567','5/9/2022','Penne');
insert into ORDERED_DISH values('Dana Shalev','050-1234567','5/9/2022','Souffle');
insert into ORDERED_DISH values('Dana Shalev','050-1234567','5/9/2022','Fettuccine');
insert into ORDERED_DISH values('Dana Shalev','050-1234567','5/9/2022','Cheesecake');
insert into ORDERED_DISH values('Dana Shalev','050-1234567','5/9/2022','Risotto');
insert into ORDERED_DISH values('Dana Shalev','050-1234567','5/9/2022','Fries');

insert into ORDERED_DISH values('Afik Swissa','054-4561987','5/9/2022','Penne');
insert into ORDERED_DISH values('Adir Edri','052-1597534','6/9/2022','Souffle');
insert into ORDERED_DISH values('Yossi Cohen','050-1486357','6/9/2022','Fettuccine');
insert into ORDERED_DISH values('Eli Ohana','050-1748652','10/9/2022','Cheesecake');
insert into ORDERED_DISH values('Itzik Zohar','050-4598125','8/8/2022','Steak');
insert into ORDERED_DISH values('Shani Feldman','050-4781523','11/9/2022','Risotto');
insert into ORDERED_DISH values('Zhoara Vaanono','050-9658412','4/10/2022','Shnitzel');
insert into ORDERED_DISH values('Shontal Karadi','050-4875321','5/12/2022','Penne');
insert into ORDERED_DISH values('Yariv Goldwaser','050-1546328','4/1/2023','Fries');

DROP TABLE ORDERED_DISH;


