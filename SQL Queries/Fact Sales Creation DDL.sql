 
 --DimFactSales: Stores Order header and details information and our important Measures

CREATE TABLE [FactSales] (
   factSales_Sk int primary key identity (1,1),
    [SalesOrderID] int,
    [SalesOrderDetailID] int,
    [OrderQty] smallint,
    [ProductID] int,
    [UnitPrice] money,
    [UnitPriceDiscount] money,
    [LineTotal] numeric(38,6),
    [OrderDate_] int,
    [DueDate] int,
    [ShipDate] int,
    [OnlineOrderFlag] bit,
    [CustomerID] int,
    [SalesPersonID] int,
    [TerritoryID] int,
    [ShipMethodID] int,
    [SubTotal] money,
    [TaxAmt] money,
    [Freight] money,
    [TotalDue] money,
    [ModifiedDate] datetime
)