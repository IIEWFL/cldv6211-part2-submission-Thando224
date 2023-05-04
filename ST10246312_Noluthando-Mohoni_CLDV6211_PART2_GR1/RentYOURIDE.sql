--statement to run ALL AT ONCE --
USE MASTER 
if EXISTS (SELECT * FROM sys.databases WHERE NAME ='RentYOURRIDE')
DROP DATABASE RentYOURRIDE
CREATE DATABASE RentYOURRIDE --CREATE DB
USE RentYOURRIDE

--TABLE CREATION
--Q1.

CREATE TABLE CarMake (
carmakeID VARCHAR  (11) PRIMARY KEY,
[description] VARCHAR (20)
);


CREATE TABLE CarBodyType(
bodytype VARCHAR (11) PRIMARY KEY,
[description] VARCHAR (20)
);


CREATE TABLE Car (
Car_no VARCHAR (10) PRIMARY KEY,
CarmakeID VARCHAR (20) ,
Model VARCHAR (50),
Body_type VARCHAR (50),
Km_travelled INT,
Km_serviced INT,
Available VARCHAR (5)
);

CREATE TABLE Inspector (
Inspector_no VARCHAR (20) PRIMARY KEY,
[Name] VARCHAR (50),
Email VARCHAR(50),
mMbile INT
);

CREATE TABLE Driver (
DriveID VARCHAR (20) PRIMARY KEY,
[Name] VARCHAR (30),
[Address] VARCHAR (70),
Email VARCHAR (50),
Mobile INT
);


CREATE TABLE Rental(
RentalID INT IDENTITY (1,1) PRIMARY KEY,
Car_no VARCHAR (10)  FOREIGN KEY REFERENCES Car(Car_no),
Inspector_no VARCHAR (20)  FOREIGN KEY REFERENCES Inspector(Inspector_no),
DriverId VARCHAR (20) FOREIGN KEY REFERENCES Driver(DriveID),
RentalFEE INT,
StartDate DATE,
EndDate DATE
);


CREATE TABLE ReturnCar (
RetrunCarID INT IDENTITY (1,1) PRIMARY KEY,
Car_no VARCHAR (10) FOREIGN KEY REFERENCES Car(Car_no),
Inspector_no VARCHAR (20) FOREIGN KEY REFERENCES Inspector(Inspector_no),
DriverId VARCHAR (20) FOREIGN KEY REFERENCES Driver(DriveID),
ReturnDate DATE,
ElapsedDate INT,
Fine INT
);


--TABLE INSERTION
--Q3

INSERT INTO CarMake
VALUES ('C101','HOnda'),
	   ('C102', 'BMW'),
	   ('C103', 'Mercedes Benz'),
	   ('C104', 'Toyota'),
	   ('C105', 'Ford')


INSERT INTO  CarBodyType
VALUES ('B101', 'Hatchback'),
       ('B102', 'Sedan'),
       ('B103', 'Coupe'),
       ('B104', 'SUV')

	  

INSERT INTO Car 
VALUES ('HYU001', 'Hyundai', 'Grand i10 1.0 Motion', 'Hatchback', 1500, 15000, 'yes'),('HYU002 ', 'Hyundai', 'i20 1.2 Fluid', 'Hatchback', 3000, 15000, 'yes'),('BMW001', 'BMW', '320d 1.2', 'Sedan', 20000, 50000, 'yes'),('BMW002', 'BMW', '240d 1.4', 'Sedan', 9500, 15000, 'yes'),('TOY001', 'Toyota', 'Corolla 1.0', 'Sedan', 15000, 50000, 'yes'),('TOY002', 'Toyota', 'Avanza 1.0', 'SUV', 98000, 15000, 'yes'),('TOY003', 'Toyota', 'Corolla Quest 1.0', 'Sedan', 15000, 50000, 'yes'),('MER001', 'Mercedes Benz', 'c180', 'Sedan', 5200, 15000, 'yes'),('MER002', 'Mercedes Benz', 'A200 Sedan', 'Sedan', 4080, 15000, 'yes'),('FOR001', 'Ford', 'Fiesta 1.0', 'Sedan', 7600, 15000, 'yes')
INSERT INTO Inspector
VALUES
('I101', 'Bud Barnes', 'bud@therideyourent.com', 0821585359),
('I102', 'Tracy Reeves', 'tracy@therideyourent.com', 0822889988),
('I103', 'Sandra Goodwin', 'sandra@therideyourent.com', 0837695468),
('I104', 'Shannon Burke', 'shannon@therideyourent.com', 0836802514)

INSERT INTO Driver
VALUES 
('D101', 'Gabrielle Clarke', '917 Heuvel St Botshabelo Free State 9781', 'gorix10987@macauvpn.com', 0837113269),
('D102', 'Geoffrey Franklin', '1114 Dorp St Paarl Western Cape 7655', 'noceti8743@drlatvia.com', 0847728052),('D103', 'Fawn Cooke', '2158 Prospect St Garsfontein Gauteng 0042', 'yegifav388@enamelme.com', 0821966584),('D104', 'Darlene Peters', '2529 St. John Street Somerset West Western Cape 7110', 'mayeka4267@macauvpn.com', 0841221244),
('D105', 'Vita Soto', '1474 Wolmarans St Sundra Mpumalanga 2200', 'wegog55107@drlatvia.com', 0824567924),
('D106', 'Opal Rehbein', '697 Thutlwa St Letaba Limpopo 0870', 'yiyow34505@enpaypal.com', 0826864938),
('D107', 'Vernon Hodgson', '1935 Thutlwa St Letsitele Limpopo 0885', 'gifeh11935@enamelme.com', 0855991446),
('D108', 'Crispin Wheatly', '330 Sandown Rd Cape Town Western Cape 8018', 'likon78255@macauvpn.com', 0838347945),('D109', 'Melanie Cunningham', '616 Loop St Atlantis Western Cape 7350', 'sehapeb835@macauvpn.com', 0827329001),('D111', 'Kevin Peay', '814 Daffodil Dr Elliotdale Eastern Cape 5118', 'xajic53991@enpaypal.com', 0832077149)


INSERT INTO Rental
VALUES
('HYU001', 'I101', 'D101', 5000, '2021-08-30', '2021-08-31'),
('HYU002', 'I101', 'D101', 5000, '2021-09-01', '2021-09-10'),
('FOR001', 'I101', 'D102', 6500, '2021-09-01', '2021-09-10'),
('BMW002', 'I102', 'D105', 7000, '2021-09-20', '2021-09-25'),
('TOY002', 'I102', 'D104', 5000, '2021-10-03', '2021-10-31'),
('MER001', 'I103', 'D104', 8000, '2021-10-05', '2021-10-15'),
('HYU002', 'I104', 'D107', 5000, '2021-12-01', '2022-02-10'),
('TOY003', 'I104', 'D109', 5000, '2021-08-10', '2021-08-31')


INSERT INTO ReturnCar
VALUES 
('HYU001', 'I101', 'D101', '2021-08-31', 0, 0),
('HYU002', 'I101', 'D101', '2021-09-10', 0 , 0),
('FOR001', 'I101', 'D102', '2021-09-10', 0, 0),
('BMW002', 'I102', 'D105', '2021-09-30', 5, 2500),
('TOY002', 'I102', 'D104', '2021-10-31', 2, 1000),
('MER001', 'I103', 'D104', '2021-10-15', 1, 500),
('HYU002', 'I104', 'D107', '2022-02-10', 0, 0),
('TOY003', 'I104', 'D109', '2021-08-31', 0, 0)


--WRITING QUERIES
--Q5 Return rental from specific days
SELECT *FROM Rental WHERE StartDate BETWEEN '2021-08-01' AND '2021-10-30';

--Q6 Rentals placed by Bud Barnes
SELECT*FROM Rental WHERE Inspector_no = 'I101';

--Q7 Display retuened cars made by Toyota
SELECT*FROM ReturnCar WHERE Car_no LIKE 'TOY%'; --PERCENTAGE MEANS TO IGNORE ANYTHING AFTER

--Q8  counts the number of rentals for Hyundai
SELECT COUNT(*) AS Hyundai_Placed_Rentals FROM Rental A JOIN Car B on (A.Car_no=B.Car_no) WHERE B.CarmakeID= 'Hyundai' group by B.CarmakeID;

--Q9  update the Model of the car with CarNo FOR001 from “Fiesta” to “Focus”
UPDATE Car  SET Model = 'Focus' WHERE Car_no = 'FOR001';

--Q10 display the CarNo, Driver Name, Rental Fee, Start Date, End Date and Availability of all available rentals.SELECT A.Car_no, A.DriverId, A.RentalFEE,A.StartDate,A.EndDate,B.Available FROM Rental A JOIN Car B on (A.Car_no=B.Car_no) 

--Q11 DISTINCT command.
SELECT DISTINCT CarmakeID  FROM Car WHERE Available='yes';

--Q12 determine the cars which will need service soon.
SELECT CarmakeID,Model FROM Car WHERE (Km_serviced-Km_travelled) <= (Km_serviced - 9000);

--Q13 calculate the late fee for a return
SELECT A.Car_no, A.DriverId, A.ReturnDate, A.ElapsedDate, A.Fine FROM ReturnCar A JOIN Car B on (A.Car_no = B.Car_no)
WHERE (A.ElapsedDate > 0);