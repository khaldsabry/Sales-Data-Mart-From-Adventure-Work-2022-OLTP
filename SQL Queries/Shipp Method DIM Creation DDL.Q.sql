 --DimShippingMethod: Stores ShippingMethod information

CREATE TABLE [shippingDim] (
   shpping_SK int primary key identity(1,1),
    [ShipMethodID] int,
    [Name] nvarchar(50),
    [ShipBase] money,
    [ShipRate] money,
    [ModifiedDate] datetime,
	start_date datetime,
   end_date datetime,
   is_current int default 1)


 --##########################################################


 -- *  Replacing Null and Orphan Data Handling steps by code:


-- I inserted -1 on keys columns and unkown value to other columns in the first row of Dimension
--TO replace null values by unkown in fact Sales if founded and make the data more clean:

SET IDENTITY_INSERT shippingDim ON;
insert into shippingDim ([shpping_SK]
      ,[ShipMethodID]
      ,[Name]
      ,[ShipBase]
      ,[ShipRate]
      ,[ModifiedDate]
      ,[start_date]
      ,[end_date]
      ,[is_current])
  values (-1,-1, 'unknown' ,  0 ,0 ,'1900-01-01' , '1900-01-01' , null,1  ) 
  SET IDENTITY_INSERT shippingDim OFF;