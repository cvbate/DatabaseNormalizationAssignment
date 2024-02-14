--Part 1. Understanding and Designing for 1NF
CREATE TABLE Pets_ive_had ( -- creates a table called Parks_info
OrderID SERIAL PRIMARY KEY, -- creates a primary key column called OrderID that is a sequence of numbers ie. 1, 2, 3, 4, etc 
PetName VARCHAR(255), -- next column is called PetName, the datastype for each row in the column is a VARCHAR which is a list of strings with a maximum length of 255
descriptions VARCHAR(255) -- next column is called descrip
);

-- create a table called Pets_ive_had that has three columns, OrderID, PetName, and descrip
CREATE TABLE Pets_ive_had ( 
OrderID SERIAL PRIMARY KEY, 
PetName VARCHAR(255), 
descriptions VARCHAR(255) 
);



-- populate Pets_ive_had with the OrderID, the names of my three pets, and their descriptions
INSERT INTO Pets_ive_had (OrderID, PetName, descriptions) VALUES
(1, 'Loon', 'Female, Cat, Black and White, Cute'),
(2, 'Nemy', 'Male, Cat, Black, Cute'),
(3, 'Jaya', 'Female, Dog, Black, Cute');



--Create a table called pets with two columns, PetID and PetName.
--This will hold the names of the pets
CREATE TABLE Pets (
PetID SERIAL PRIMARY KEY,
PetName VARCHAR(255)
);


-- Create a table called Descrip with tho columns,DescripID PetID and Descriptions 
CREATE TABLE Descrip (
DescripID SERIAL PRIMARY KEY,
PetID INT,
Descriptions VARCHAR(255),
FOREIGN KEY (PetID) REFERENCES Pets(PetID) -- Links PetID in this table(Descrip) to PetID in the table Pets
);


-- Populate the table Pets with PetID, and PetName- the same as Pets_ive_Had
INSERT INTO Pets (PetID, PetName) VALUES
(1, 'Loon'),
(2, 'Nemy'),
(3, 'Jaya');


-- Populate the table Descrip with the PetID from Pets and the corresponding descriptions
INSERT INTO Descrip (PetID, Descriptions) VALUES
(1,'Female'),
(1,'Cat'),
(1,'Black and White'),
(1,'Cute'),
(2,'Male'),
(2,'Cat'),
(2,'Black'),
(2,'Cute'),
(3,'Female'),
(3,'Dog'),
(3,'Black'),
(3,'Cute')
;

-- Part 2! Advancing to 2NF

--Create table called Pet_Descrip with two columns, 
--DescripID and Descrip to hold the IDs that correspond to the Pet Descriptions
CREATE TABLE Pet_Descrip (
DescripID SERIAL PRIMARY KEY,
Descriptions VARCHAR(255)
);


-- Populate the Pet Descrip with DescripID and the corresponding descriptions for the three pets
INSERT INTO Pet_Descrip (DescripID, Descriptions) VALUES
(1,'Female'),
(2,'Cat'),
(3,'Black and White'),
(4,'Cute'),
(5,'Male'),
(6,'Black'),
(7,'Dog');


-- Adding the column PetDescripID to the table Descrip
ALTER TABLE Descrip ADD COLUMN PetDescripID INT;

-- Linking the Foreign key column PetDescripID from Pet_Descriptios to the Primary Key column DescripID in Descrip
ALTER TABLE Descrip
ADD CONSTRAINT fk_PetDescripID FOREIGN KEY (PetDescripID) REFERENCES Pet_Descrip(DescripID);

-- Update the Table Descrip so that the PetDescripID in Pet_Descrip(Foreign KEy) is transfered/related
-- to the DescripID column so that each description has its own unique idenfyer in the table Descrip
UPDATE Descrip
SET PetDescripID = (SELECT DescripID FROM Pet_Descrip WHERE Descriptions = Descrip.Descriptions);

--Drop the now redundant column Descriptions forom the table Descrip
ALTER TABLE Descrip DROP COLUMN Descriptions;


/*
Pets_Ive_Had = Parks_info
Parks = Pets
Pet_Descrip =ParkFacilities
Descrip = Facilities
Descriptions = FacilityName

*/


