create database Luxury_house_data;
SELECT * FROM Luxury_house_data.luxury_housing_table;
SELECT
    SUM(CASE WHEN Property_ID IS NULL THEN 1 ELSE 0 END) AS Property_ID_Null,
    SUM(CASE WHEN Micro_Market IS NULL THEN 1 ELSE 0 END) AS Micro_Market_Null,
    SUM(CASE WHEN Project_Name IS NULL THEN 1 ELSE 0 END) AS Project_Name_Null,
    SUM(CASE WHEN Developer_Name IS NULL THEN 1 ELSE 0 END) AS Developer_Name_Null,
    SUM(CASE WHEN Unit_Size_Sqft IS NULL THEN 1 ELSE 0 END) AS Unit_Size_Sqft_Null,
    SUM(CASE WHEN Configuration IS NULL THEN 1 ELSE 0 END) AS Configuration_Null,
    SUM(CASE WHEN Ticket_Price_Cr IS NULL THEN 1 ELSE 0 END) AS Ticket_Price_Cr_Null,
    SUM(CASE WHEN Transaction_Type IS NULL THEN 1 ELSE 0 END) AS Transaction_Type_Null,
    SUM(CASE WHEN Buyer_Type IS NULL THEN 1 ELSE 0 END) AS Buyer_Type_Null,
    SUM(CASE WHEN Purchase_Quarter IS NULL THEN 1 ELSE 0 END) AS Purchase_Quarter_Null,
    SUM(CASE WHEN Amenity_Score IS NULL THEN 1 ELSE 0 END) AS Amenity_Score_Null,
    SUM(CASE WHEN Connectivity_Score IS NULL THEN 1 ELSE 0 END) AS Connectivity_Score_Null
FROM luxury_housing_table;

SELECT * FROM Luxury_house_data.luxury_housing_table;
DESCRIBE luxury_housing_table;

select * from luxury_housing_table limit 10;

#properities(count by buyer type)
SELECT Buyer_Type, COUNT(*) AS Total_Buyers
FROM luxury_housing_table
GROUP BY Buyer_Type;

#properities(above 2000sqft)
SELECT Property_ID, Project_Name, Unit_Size_Sqft, Configuration, Transaction_Type, Buyer_Type
FROM luxury_housing_table
WHERE Unit_Size_Sqft > 2000
LIMIT 10;

#properities(ready to move)
SELECT Property_ID, Project_Name, Developer_Name, Possession_Status, Sales_Channel
FROM luxury_housing_table
WHERE Possession_Status = 'Ready to Move'
LIMIT 10;

#properities(NRI buyers)
SELECT Property_ID, Project_Name, Buyer_Type, NRI_Buyer, Purchase_Quarter, Transaction_Type
FROM luxury_housing_table
WHERE NRI_Buyer = 'Yes'
LIMIT 10;

#properities(connectivity and amentity score)
SELECT Property_ID, Project_Name, Connectivity_Score, Amenity_Score, Locality_Infra_Score, Micro_Market
FROM luxury_housing_table
WHERE Connectivity_Score > 8 AND Amenity_Score > 8
LIMIT 10;