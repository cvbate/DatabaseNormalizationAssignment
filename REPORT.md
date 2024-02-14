# Database Normalization using PostgreSQL with PostGIS Extension 
## Spatial Databases IDCE 376 | Assignment 2: | Clio Bate | 02/14/2024

This project was created as part of the class, Spatial Databases at Clark University Spring, 2024. The objective of this assignent is to introduce database normalization and implement these concepts by creating a non-normal database, and normalizing it to 1NF and 2NF. To write and implement the SQL script I used the SQLShell to interact with PGAdmin and used VSCode to manage my repository and save my SQL script.     
The full assignment instructions can be found on the class website, [here](https://studyingplace.space/spatial-database/labs/A2-Database_Normalization.html)  

The data example given to us for the assignment was a simple table called Parks in which three parks were listed along with the facilities they each posessed (ex. restroom, playground etc.). I decided to use diffent varibales,'Pets' instead of 'parks' and 'descriptions' instead of 'facilities'. This proved to be an additional challenges, as will be discussed in the challenges section further down in this document. The full list of subistutions is bellow:
- Pets_Ive_Had = Parks_info
- Parks = Pets
- Pet_Descrip = ParkFacilities
- Descrip = Facilities
- Descriptions = FacilityName (this is a column) 


### This repository includes
1. analysis.sql : SQL script for creating and normalizing tables
1. REPORT.MD (this document): A Markdown or text file containing your normalization report.
1. Screenshots showing your final table structures in pgAdmin or the command-line outputs.  
    - Pets_Ive_Had_table1 = orignal table 
    - Pets_table2 = lists pets with PetID as primary key
    - Pets_Descrip_table3 = lists decriptions with DescripID as primary key
    - Descrip_table4  = 2NF


### Methods



### Challenges:
- i had named all my columns descrip instead of descriptions  
- orignally named Descrip Pets_Descrip, so I had to change it   
  

### Screneshots of tables:
Pets_Ive_Had Table:  
![Pets_Ive_Had Table](Pets_Ive_Had_table1.png)  
Pets Table:  
![Pets Table](Pets_table2.png)  
Pet_Descrip:  
![Pet_Descrip Table](Pet_Descrip_table3.png)  
Descrip:  
![Descrip Table](Descrip_table4.png)  

Para hacer antes de que yo lo entrege:
1. process and rational
2. challenges
    - i had named all my columns descrip instead of descriptions and had orignally named Descrip Pets_Descrip, so I had to change it 
3. ~~cambiar el nombre de este documento de README.md a REPORT.md~~
4. ~~añadir las fotitos~~