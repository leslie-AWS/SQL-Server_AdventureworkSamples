-- Name- L U.,CCI Assignment-2, Problem 1, 8/23/2022
USE AdventureWorks2012;
--A,
/*The average commission percent for the SalesPerson table.*/
SELECT Avg([CommissionPct]) AS avg_price
FROM [Sales].[SalesPerson]
--B, a count of all Male Employees
SELECT Count([Gender]) AS Total_Male_Employees
FROM [HumanResources].[Employee];
--C,The highest List Price of any Product
SELECT Max([ListPrice]) AS Max_price
FROM [Production].[Product];
--D, The length of all Descriptions in the ProductDescription table
SELECT[Description],Len([Description]) AS Description_Length
FROM [Production].[ProductDescription];
--E,The Currency Code and the first 3 letters of the Currency Name as 'AB
SELECT [CountryRegionCode][CurrencyCode]
FROM [Sales].[CountryRegionCurrency]
WHERE [CurrencyCode] LIKE 'AB%' 
--checkout
Select *
FROM [Sales].[CountryRegionCurrency]
--F,List the Title, Gender, and Lowest Login Id for each group of Employees grouped by the following titles: “Buyer', 'Recruiter' or 'Stocker'.
SELECT MIN([LoginID]) AS Min_LoginId,[JobTitle],[Gender]
FROM [HumanResources].[Employee]
WHERE [JobTitle] IN ('Buyer', 'Recruiter', 'Stocker')
Group by [JobTitle],[Gender]
/*G,List Product Sub Category IDs from the Product table; include only those subcategories that occur more than 20 times. 
In addition to the ID also returns the first product name in alphabetical order and the highest price for products in this subcategory.*/ 
Select  [ProductSubcategoryID],[Name],MAx([ListPrice]) AS Max_Price
FROM [Production].[Product]
WHERE [ProductSubcategoryID] in (Select [ProductSubcategoryID]
                               FROM [Production].[Product]
							   Group by [ProductSubcategoryID]
							   Having Count([ProductSubcategoryID]) > 20)
Group by [ProductSubcategoryID],[Name]
ORDER BY [Name] ASC;
/*H,Provide a list of Employee Titles and Genders from the Employee table. For each title, include the average vacation hours for all employees of each gender. 
Also provide an additional subtotal for each title that includes the average vacation hours for all employees of that title.*/ 
SELECT [JobTitle],[Gender],AVg([VacationHours]) AS Avg_VacationHours
FROM [HumanResources].[Employee]
Group by [JobTitle],[Gender]
--I,
/*Schema(s) involved: Sales 
Question: Display Description and MaxQty fields from the SpecialOffer table.
 Some of the MaxQty values are NULL,in this case display the value 0.00 instead.*/
SELECT [Description], ISNULL([MaxQty] ,0.00)AS Result
FROM [Sales].[SpecialOffer]
--J,
/*Schema(s) involved: Production
 Question: Display the Name and Color of the Product with the maximum weight.*/
SELECT [Name],[Color] 
FROM [Production].[Product]
WHERE [Weight] = (SELECT MAX([Weight]) FROM [Production].[Product]);
--k,
/*Concept: Count() Schema(s) involved: Sales
 Question: Display the number of records in the [SalesPerson] table*/
SELECT Count([BusinessEntityID]) AS 'Number Of Records'
fROM [Sales].[SalesPerson];

  --L,
 /*Schema(s) involved: Person,HumanResources,Sales 
Question: Describe this query*/
 SELECT DISTINCT c.LastName, c.FirstName 
 FROM [Person].[Person]c INNER JOIN HumanResources.Employee e 
 ON e.BusinessEntityID = c.BusinessEntityID
 WHERE 5000.00 IN ( SELECT Bonus FROM Sales.SalesPerson sp WHERE e.BusinessEntityID = sp.BusinessEntityID ) ;
 -- This Query List FirstName and LastName From [Person].[Person]c, HumanResources.Employee e Tables using Inner Join Relationship(PK,FK)
 -- ON e.BusinessEntityID is equal to c.BusinessEntityID and IN Bonus column from Sales.SalesPerson Where e.BusinessEntityID is equal sp.BusinessEntityID
 --M,
  /*Schema(s) involved: [HumanResources] 
Question: Remove all shifts from [HumanResources].Shift except for Day,Evening,Night if they exist.*/
DELETE From [HumanResources].[Shift]
WHERE [Name]NOT IN ('DAY', 'Evening','SHIFT');
--From [HumanResources].[Shift];
--N,
  /*Using the same pattern of the values and data types in each column, add 2 rows of data into the person.address table.*/
  Insert into [Person].[Address]([AddressID],[AddressLine1],[AddressLine2],[City],[StateProvinceID],[PostalCode],[SpatialLocation],[rowguid],[ModifiedDate])
  Values (32522,'435poplar',Null,'silver',12,6768,0xE6100000010C25D3857725B4064078E594BD94A95EC0,'CB330A15-9F94-418B-B03A-EF77A9748C8C','2014-06-29 00:00:00.000'),
         (32523,'095Runr',Null,'spring',12,6768,0xE6100000010C25D3857725B4064078E594BD94A95EC0,'CB330A15-9F94-418B-B03A-EF77A9748C8C','2014-06-29 00:00:00.000')
--SET IDENTITY_INSERT ON
--O,
  /*Write a query that will change the current ListPrice value of the product whose ProductID is 680 in to 599.99 in the production.product table.*/
  UPDATE  [Production].[Product]
  SET 
     [ListPrice] =599.99
  WHERE 
        [ProductID] = 680;

 


	
Select *
FROM [Production].[Product]
