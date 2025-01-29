 -- I used also Incremental load Technic to limit the amount of insertition data to fact table every time i make ETL
  -- This Technic work on loading data from the last time of ETL. 
  --How i manage it? i made a log table to record the last date of  ETL using Variable on SSIS and make it easy to load data from last ETL witout any dublication


  --creation of log table (Metadata)


  create table MetaData 
(ID int, Name varchar(20), date datetime) 

insert into MetaData values (1, 'FactTable', '1-1-1900')   --- i inserted old date to load all data on the first ETL process