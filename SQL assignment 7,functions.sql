Create table country (Id int not null primary key, Country_name varchar(15) not null,
Population int not null,Area int not null );

desc country;

create table Persons(Id int not null primary key,Fname varchar(15) not null ,
Lname varchar(15)not null,Population int not null ,Rating float not null ,
Country_id varchar(5) not null,Country_name varchar(20)not null );

desc persons;

#Insert 10 rows to Table Country

insert into Country(Id,Country_name,Population,Area)values
(200,'China' , 1400000, 9600000 ),
 ( 201,'India', 1400000,  3300000) ,
( 202,'United States', 335000 , 9800000 ),
( 203,'Indonesia',  277000 , 1900000 ),
( 204,'Brazil',  215000, 8400000),
 (205,'Pakistan',  2350000 , 881913 ),
 (206,'Nigeria',21800, 923768 ),
  (207,'Bangladesh',80000, 148571) ,
 (208,'Russia',1440000, 17125191 ),
(209,'Australia',260000,7692024 );

select * from country;

insert into persons(Id,Fname,Lname,Population,Rating,Country_id,Country_name)values
(205,'John', 'Doe', 10000 , 4.5 ,'US' ,'United states'),
( 206 ,'Jane', 'Smith',  9000 , 3.8 , 'CA', 'Canada' ),
( 207 ,'Michael', 'Johnson', 800000, 4.2 ,' AU','Australia' ),
(208,'Emily', 'Davis' ,7000,  4.0 , 'CA', 'Canada'),
( 209,'Ethan ','Lee',9000 , 4.7,  'CN  ','China'),
( 210,'Olivia',  'Martinez' ,600000,3.9,'US','United states'), 
 (211,'Ava','Williams' ,12000,4.8,'UK','UK'),
(212,'Sophia','Alex' , 400000 , 3.7,'IN', 'India'),
(213,'Isabella','Jones', 15000 , 4.9,'JP', 'Japan'),
( 214,'Liam', 'Miller',  30000  ,3.6,'MX','Mexico');

SELECT * FROM PERSONS;

-- 1. Add a new column called DOB in Persons table with data type as Date.
Alter table persons add column DOB date;

update persons set DOB='2000-10-24' where id=205;
update persons set DOB='1989-12-21' where id=206;
update persons set DOB='2001-06-24' where id=207;
update persons set DOB='1999-07-31' where id=208;
update persons set DOB='1998-10-30' where id=209;
update persons set DOB='1992-02-07' where id=210;
update persons set DOB='2000-01-14' where id=211;
update persons set DOB='1996-03-24' where id=212;
update persons set DOB='1990-04-12' where id=213;
update persons set DOB='2003-05-13' where id=214;


-- 2. Write a user-defined function to calculate age using DOB. 
DELIMITER $$
CREATE FUNCTION calculate_age(Date_of_birth date)
RETURNS int
DETERMINISTIC
BEGIN
 DECLARE age INT;
    SET age = timestampdiff(YEAR,Date_of_birth,CURDATE());
    RETURN age;
END $$
DELIMITER ;

-- 3. Write a select query to fetch the Age of all persons using the function that has been created.
 select  Id,Fname,calculate_age(DOB)  from persons;

--  4. Find the length of each country name in the Country table. 
select Country_name,length(Country_name) as Country_name_length from country;

 -- 5. Extract the first three characters of each country's name in the Country table.
 select Country_name,substring(Country_name,1,3) as First_3_characters from country;
 
 -- 6. Convert all country names to uppercase and lowercase in the Country table.
select  Country_name,UPPER(Country_name) as Upper_case ,
 LOWER(Country_name) as Lower_case from country;
 
 