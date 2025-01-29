 --2-DimCustomer: Stores customer information

CREATE TABLE [CustomerDim] (
   customer_Sk int primary key identity (1,1),
    [CustomerID] int,
    [FirstName] nvarchar(50),
    [LastName] nvarchar(50),
    [AddressLine1] nvarchar(60),
    [City] nvarchar(30),
    [StateProvinceName] nvarchar(50),
    [CountryRegionCode] nvarchar(3),
	[ModifiedDate] datetime,
    start_date datetime,
   end_date datetime,
   is_current int default 1)


   --##########################################################

   -- *  Replacing Null and Orphan Data Handling steps by code:


-- I inserted -1 on keys columns and unkown value to other columns in the first row of Dimension
--TO replace null values by unkown in fact Sales if founded and make the data more clean:



--- customer Dim Orphan Handling

set identity_insert customerdim ON
insert into CustomerDim(customer_Sk ,
    [CustomerID] ,
    [FirstName] ,
    [LastName] ,
    [AddressLine1] ,
    [City] ,
    [StateProvinceName],
    [CountryRegionCode] ,
	[ModifiedDate] ,
    start_date ,
   end_date ,
   is_current  )
values (-1,-1,'Unkown','Unkown','Unkown','Unkown','Unkown','NA','1-1-1911','1-1-1911',NULL,1)
set identity_insert customerdim OFF;