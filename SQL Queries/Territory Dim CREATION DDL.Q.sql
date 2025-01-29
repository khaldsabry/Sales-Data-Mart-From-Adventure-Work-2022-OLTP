--DimTerritory: Stores Territory information

	CREATE TABLE [TerritoryDim] (
	Territory_Sk int primary key identity(1,1),
    [TerritoryID] int,
    [Name] nvarchar(50),
    [CountryRegionCode] nvarchar(3),
    [Group] nvarchar(50),
    [SalesYTD] money,
    [SalesLastYear] money,
    [ModifiedDate] datetime,
	 start_date datetime,
   end_date datetime,
   is_current int default 1)


   --#########################################################################


 -- *  Replacing Null and Orphan Data Handling steps by code:


-- I inserted -1 on keys columns and unkown value to other columns in the first row of Dimension
--TO replace null values by unkown in fact Sales if founded and make the data more clean:


SET IDENTITY_INSERT [TerritoryDim] ON;
insert into [TerritoryDim] ([Territory_Sk]
      ,[TerritoryID]
      ,[Name]
      ,[CountryRegionCode]
      ,[Group]
      ,[SalesYTD]
      ,[SalesLastYear]
      ,[ModifiedDate]
      ,[start_date]
      ,[end_date]
      ,[is_current])
  values (-1,-1, 'unknown' , 'NA' , 'unknown' ,0 , 0,'1900-01-01' , '1900-01-01',null,1  ) 
  SET IDENTITY_INSERT [TerritoryDim] OFF;