-- 1- DimProduct: Stores product information

CREATE TABLE [ProductDim] (
	product_SK int primary key identity (1,1),							
    [ProductID] int,													
    [ProductName] nvarchar(50),											
    [ProductNumber] nvarchar(25),										
    [ProductColor] nvarchar(15),										
    [StandardCost] money,												
    [ListPrice] money,													
    [ProductSize] nvarchar(5),											
    [ProductWeight] numeric(8,2),
    [SubcategoryName] nvarchar(50),
    [CategoryName] nvarchar(50),
    [ProductModelName] nvarchar(50),
    [ModifiedDate] datetime,
    start_date datetime,
    end_date datetime,
	is_current int default 1)


--#####################################################################

--*  Replacing Null and Orphan Data Handling steps by code:


-- I inserted -1 on keys columns and unkown value to other columns in the first row of Dimension
--TO replace null values by unkown in fact Sales if founded and make the data more clean:


--2- Product Dim Orphan Handling
set identity_insert ProductDim ON
insert into ProductDim([product_SK]
      ,[ProductID]
      ,[ProductName]
      ,[ProductNumber]
      ,[ProductColor]
      ,[StandardCost]
      ,[ListPrice]
      ,[ProductSize]
      ,[ProductWeight]
      ,[SubcategoryName]
      ,[CategoryName]
      ,[ProductModelName]
      ,[ModifiedDate]
      ,[start_date]
      ,[end_date]
      ,[is_current])
 values (-1,-1,'Unkown','Unkown','Unkown',0,0,'NA',0,'Unkown','Unkown','Unkown','1-1-1911','1-1-1911',NULL,1)
set identity_insert ProductDim OFF