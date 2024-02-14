# Database Normalization using PostgreSQL with PostGIS Extension 
## Spatial Databases IDCE 376 | Assignment 2: | Clio Bate | 02/14/2024

This project was created as part of the class Spatial Databases at Clark University Spring, 2024. The objective of this assignent is to introduce and implement the concept of database normalization by creating a non-normal database and normalizing it to 1NF and 2NF. To write and implement the SQL script I used the SQLShell to interact with PGAdmin and used VSCode to manage my repository and store my SQL script.     
The full assignment instructions can be found on the class website, [here](https://studyingplace.space/spatial-database/labs/A2-Database_Normalization.html)  

The data example given to us for the assignment was a simple table called Parks in which three parks were listed along with the facilities they each posessed (ex. restroom, playground etc.). I decided to use diffent varibales,'Pets' instead of 'parks' and 'descriptions' instead of 'facilities'. This proved to be an additional challenge, as will be discussed in the challenges section further down in this document. The full list of name subistutions is bellow:
- Pets_Ive_Had = Parks_info
- Pets = Parks
- Pet_Descrip = ParkFacilities
- Descrip = Facilities
- Descriptions = FacilityName (this is a column) 
  
Often when a database is not normalized, when there are multiple values within a column or there are partial dependencies, issues will arise when trying to preform an analysis as some of the data may not be easily accessable. Esentilly normalization increases the efficiency and integrity of a database.
  
### This repository includes
1. analysis.sql : SQL script that created and normaled tables
1. REPORT.MD (this document): A Markdown file containing the Normalization Report.
1. Screenshots showing the structures of my final tablesin pgAdmin. The screenshots of each table includes:  
    - Pets_Ive_Had_table1 = 'orignal' table 
    - Pets_table2 = lists pets with PetID as primary key = 1NF
    - Pets_Descrip_table3 = lists decriptions with DescripID as primary key  = 1NF
    - Descrip_table4  = 2NF
  
### Methods
Part 1: 1NF  
1. Create a non-normalized table called Pets_ive_had that contains three columns, OrderID, PetName, and Descriptions
1. Populate Pets_ive_had with the OrderID, the names of my three pets, and their descriptions
1. Create a second table called Pets with two columns, PetID and PetName. This will hold the names of the pets and give each pet a primary key
1. Populate the table Pets with PetID, and PetName- the same as Pets_ive_Had
1. Create a table called Descrip with three columns; DescripID, PetID, and Descriptions 
1. Populate the table Descrip with the PetID from Pets and the corresponding descriptions - now we have two 1NF tables, Descrip and Pets  
  
Part 2: 2NF    
1. Create table called Pet_Descrip with two columns; DescripID and Descrip to hold the IDs that correspond to the Pet Descriptions
1. Populate the Pet Descrip with DescripID and the corresponding descriptions for the three pets - this is a 3rd 1NF table
1. Alter Descrip by adding the column PetDescripID to the table Descrip
1. Alter the table Descrip and add the contraint that the foregn key, PetDescripID from Pet_Descriptios refernces the the Primary Key column DescripID in Descrip
1. Update the table Descrip so that the PetDescripID in Pet_Descrip(Foreign KEy) is transfered into the DescripID column so that each description has its own unique idenfier in the table Descrip
1. Drop the column Descriptions from Descrip
1. (Optional) rename the table Descrip to MyPets_Descriptions_3NF 

  
### Challenges:
Using my own variables instead of the Park/Facilities variables used in the example in the assignment instructions added a layer of difficulty, however I found that it also increased my understanding of what was happening in the tables, because I had to think harder about how these examples were applied to my variables. Due to this I also had to think carefully about what I would name each table and column- and actually had to rename some of my tables/ columns to be more intuitive. 
For example, I orignally named all of the "Descriptions" columns "Descrip- which is the name of one my tables, so when it came down to Update Descrip with the DescripID fom Pet_Discrip my code looked like this:  
` UPDATE Descrip
SET PetDescripID = (SELECT DescripID FROM Pet_Descrip WHERE Descrip = Descrip.Descrip);`  
I never ran this code because I took one look at at "Descript = Descrip.Descrip" and 1. was confused as to what was happening and 2. Doubted it would even work.  
Additionally, I had originaly named Descrip "Pets_Descrip" because I wanted to mark it as being assoicated with the Pets/Pet_Ive_Had tables, but decided to rename it Descrip, so that I could name the FacilitiesPark equvilant table Pets_Descrip. That is why at the end I renamed my Descripts table to MyPets_Descriptions_3NF. There are a few other tables in the Postgres database so I wanted it to be intuitive by name alone that these four tables are related.

   
### Screneshots of tables:
Pets_Ive_Had_table1:  
![Pets_Ive_Had Table](Pets_Ive_Had_table1.png)  
Pets_table2:  
![Pets Table](Pets_table2.png)  
Pet_Descrip_table3:  
![Pet_Descrip Table](Pet_Descrip_table3.png)  
Pets and their Descriptions 3NF (Descrip_table4):  
![Descrip Table](Descrip_table4.png)  