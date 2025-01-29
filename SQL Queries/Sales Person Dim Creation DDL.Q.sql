--DimSalesPerson: Stores Sales Person information


CREATE TABLE [dbo].[SalesManDim](
	[salesMan_Sk] [int] IDENTITY(1,1) NOT NULL,
	[BusinessEntityID] [int] NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[JobTitle] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](25) NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[AddressLine1] [nvarchar](60) NULL,
	[City] [nvarchar](30) NULL,
	[StateProvinceName] [nvarchar](50) NULL,
	[CountryRegionName] [nvarchar](50) NULL,
	[TerritoryName] [nvarchar](50) NULL,
	[TerritoryGroup] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[is_current] [int] default 1)

--####################################################################

-- I inserted -1 on keys columns and unkown value to other columns in the first row of Dimension
--TO replace null values by unkown in fact Sales if founded and make the data more clean:

-- SalesMan Dim Orphan Handling

set identity_insert SalesManDim ON
insert into SalesManDim([salesMan_Sk]
      ,[BusinessEntityID]
      ,[FirstName]
      ,[LastName]
      ,[JobTitle]
      ,[PhoneNumber]
      ,[EmailAddress]
      ,[AddressLine1]
      ,[City]
      ,[StateProvinceName]
      ,[CountryRegionName]
      ,[TerritoryName]
      ,[TerritoryGroup]
      ,[ModifiedDate]
      ,[start_date]
      ,[end_date]
      ,[is_current])
 values (-1,-1,'Unkown','Unkown','Unkown','Unkown','Unkown','Unkown','Unkown','Unkown','Unkown','Unkown','Unkown','1-1-1911','1-1-1911',NULL,1)
set identity_insert SalesManDim OFF