--Task 1.1: Create a Non-Normalized Table
CREATE TABLE Pets_ive_had ( -- creates a table called Parks_info
OrderID SERIAL PRIMARY KEY, -- creates a primary key column called OrderID that is a sequence of numbers ie. 1, 2, 3, 4, etc 
PetName VARCHAR(255), -- next column is called PetName, the datastype for each row in the column is a VARCHAR which is a list of strings with a maximum length of 255
descrip VARCHAR(255) -- next columni s called descrip
);

CREATE TABLE Pets_ive_had ( 
OrderID SERIAL PRIMARY KEY, 
PetName VARCHAR(255), 
descrip VARCHAR(255) 
);


INSERT INTO Pets_ive_had (OrderID, PetName, descrip) VALUES
(1, 'Loon', 'Female, Cat, Black and White, Cute'),
(2, 'Nemy', 'Male, Cat, Black, Cute'),
(3, 'Jaya', 'Female, Dog, Black, Cute');

--Task 1.2: Normalize the Table to 1NF
--Modify the Parks_Info table to ensure it complies with 1NF.
--Split the Descprption column to remove the list of values, ensuring each row/column intersection has a single value.

CREATE TABLE Pets (
PetID SERIAL PRIMARY KEY,
PetName VARCHAR(255)
);

CREATE TABLE Pet_Descrip (
DescripID SERIAL PRIMARY KEY,
PetID INT,
Descrip VARCHAR(255),
FOREIGN KEY (PetID) REFERENCES Pets(PetID)
);

INSERT INTO Pets (PetID, PetName) VALUES
(1, 'Loon'),
(2, 'Nemy'),
(3, 'Jaya');

INSERT INTO Pet_Descrip (DescripID, Descrip) VALUES
(1,'Female'),
(2,'Male'),
(3,'Cat'),
(4,'Dog'),
(5,'Black and White'),
(6,'Black'),
(7,'Cute')
;


--Female = 1 Male = 2, 3 = cat, 4 = dog, 5 = Black and White, 6 = Black, 7 = Cute