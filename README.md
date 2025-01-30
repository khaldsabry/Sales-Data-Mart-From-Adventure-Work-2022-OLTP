# Sales Data Mart From Adventure Work 2022 OLTP

# Project Overview
In this project, I transformed the AdventureWorks2022 dataset from its original OLTP format into a structured data mart designed for analytical purposes. By reorganizing and optimizing the data, I created a solution that enables efficient analysis and visualization of business performance metrics.The project highlights my ability to bridge the gap between raw transactional data and meaningful business intelligence.

# Contents
 ### 1- Project Stages.
###  2- OLTP Database Overview.
###  3- Data Mart Modeling.
###  4- Data Mart ETL Process Using SSIS.
###  5- Replacing Null and Orphan Data Handling.
###  6- Fact Table and Incremental Load of Data Loading.
###  7- Key Visualizations Using PowerBI.

# (1/7) Project Stages

#### 1. Data Source Selection:
The data here is extracted from Microsoft's AdventureWorks2022 OLTP dataset. This dataset represents a virtual bike company with many departments like production, HR, and sales. The source file is found in the repo.

#### 2. Creation and Dimensional Modeling: 
The Data Mart After determining which process I would create the data mart for (Sales), I looked at the level of granularity of the data. Since AdventureWorks is a retail company, each transaction could mean a story. So the level of granularity of my fact table will be transactional. Also, I discovered which dimensions could describe the selling process, and I found that Products, Customers, Territories, and Date are helpful for such a process.

#### 3. ETL Process:
In this stage, multiple tables are joined together to form the final dimensional model of the data mart (These will be shown in the next section).

#### 4. Data Cleansing and Preprocessing:
The usage of many joins of tables results in many NULL values. Although these NULL values could be associated with other helpful columns that we can extract insights from, dealing with NULL values is mandatory for more efficiency and better data management.

#### 5. Populating the Fact Table and Relationships Creation:
In the final stage of the project comes the fact table which carries all the measures that will be the center of our analysis. In this stage, all records that represent a transaction made by a customer are populated to have a holistic view of the sales. Finally, we establish the relationships with the dimensions.

#### 6. The Analysis and Reporting Phase:
Focused on exploring the data in the data mart and generating actionable insights for the Sales data mart. This phase involved the creation of interactive reports and dashboards using Power BI, which allowed business users to explore the data and gain valuable insights.

# (2/7) OLTP Database Overview

We have to look at the shape and structure of the data we are working with to be able to know what attributes and measures we will need and how the project will start. As mentioned in the Project Stages section, in this project I am trying to model the sales process. 
So let's start by looking at the sales details from AdventureWorks2022

![Sales_Order_ERD](https://github.com/user-attachments/assets/e26959d4-ce56-418b-986c-4681c23c563b)

AdventureWorks2022 have some important dimensions that could describe the Sales process like:

1. Products

  ![Products_ERD](https://github.com/user-attachments/assets/69cb6d74-3636-4bda-b778-9c407393c678)

2. Customers

  ![Customers_ERD](https://github.com/user-attachments/assets/1090c414-b1f8-437b-8b73-d73b77e9f25a)

3. Territory

   ![Territory_ERD](https://github.com/user-attachments/assets/d0a5c3e3-de58-4eb9-95e3-59124e939ea2)

4. Sales Person
5. shipping method


# (3/7) Data Mart Modeling

The Sales data Mart, was designed using a Star schema approach. I have chose to model the data mart as a star schema for the efficiency, Simplicity, Analytical Efficiency and fast retrieval of data to meet customer needs.The schema consists of:

Fact Tables: Central tables that store quantitative data.

Dimension Tables: Surrounding tables that store descriptive attributes (e.g., customer, Product, Territory, Shipping Method, Sales Person). 
A date dimension was added to track historical changes and enable time-based analysis.

![Star Schema](https://github.com/user-attachments/assets/3f8292bd-7bed-4ee7-9653-2a73f48bcc62)


# (4/7) Data Mart ETL Process Using SSIS

The SSIS (SQL Server Integration Services) packages used in the Sales Data mart project to extract, transform, and load (ETL) data from the source database into the data mart.  
 
My solution is composed of 5 Packages (4 for the normal ETL process for each dimension and 1 for the incremental load of the fact table ).

![SSIS Packegs](https://github.com/user-attachments/assets/4fdb758f-5f9a-4416-8c2c-55a4f57f627f)


#### Dim Customer
I have used the SCD (Slowly Changing Dimension) Package to capture the change if done to any value of any dimension.

![Customer Dim Initial Load](https://github.com/user-attachments/assets/253d252c-e26f-43fe-8f05-e7167eed5cb5)



#### Dim Product

By the same concept as the Dim Customer, I have joined multiple tables to reach the Products' dimension. Here is the full initial load of the dimensions table.

![Product Dim Initial Load](https://github.com/user-attachments/assets/f61b830b-0e66-448d-b5ed-51e39ee06890)

#### Dim Sales Man

![Sales Person Dim Initial Load](https://github.com/user-attachments/assets/10ec9f30-7c9d-481c-bb97-ab096cdb2fbd)

#### Dim Territory

![Territory Dim Initial Load](https://github.com/user-attachments/assets/4456c53a-e77e-4896-a901-70285f20b0f2)


#### Dim Shipping Method

![Shipping Dim Initial Load](https://github.com/user-attachments/assets/f3d8b8ca-c61d-4017-8ee0-a4ab0f4531a4)


# (5/7) Replacing Null and Orphan Data Handling
Due to multiple joins from the dimensions and fact table, you will notice NULL values a lot. So I have added in each dimension (except the date dimension because it is not allowed to have a NULL date) an observation with the -1 Surrogate key. This observation will be referenced every time a null value occurs in the fact table. Now we can handle the NULL values by grouping them into one observation and have some insights from data just being NULL!. And there is a photo of the observation row

![Orphan Handlind](https://github.com/user-attachments/assets/2476cf67-5a54-4cd5-a24b-265161b5c748)

# (6/7) Fact Table and Incremental Load of Data

## Firstly Incremental loading of data
I have created a Log control table to record the last time an ETL process was done. This Log table helps in querying the data that is only AFTER the last ETL process. 

I used this Task flow to Handle it

![Task Flow Incremental Load](https://github.com/user-attachments/assets/72021aa9-b41c-43dd-95bd-81a090c84deb)

## Then i Used this Packege to Load data into my fact sales table.

![Fact Sales Full load](https://github.com/user-attachments/assets/b2c994e3-2f38-4e22-8adc-ed4027d7bd8a)


There is the fact sales table after loadin data

![Fact Sales After Load](https://github.com/user-attachments/assets/64458a55-c2b9-4d73-a898-691dd298d410)






# (7/7) Key Visualizations and Analysis Using PowerBI

The Power BI dashboard provides actionable insights into the  sales data mart business operations. It is divided into thre pages, each focusing on a specific aspect of the business: Sales Report, Sales Persons Performance, Sales by Territory and last page contain a drill through which give a specific insight about sales person.


To analyze the data and derive meaningful insights, I created several measures using DAX.

![Measures](https://github.com/user-attachments/assets/45d65fc0-8708-4b1d-8495-0be0b9f8c735)


## Sales Report

![Sales](https://github.com/user-attachments/assets/2c815b2b-2a47-4edd-9cfc-74a384cab004)


## Charts and Insights

Total Due, NO. Orders, Total Tax, Total Qnty of orders, Total Freight (KPI Cards)

Top 10 subcategory by Total Due (Funnel Chart)

Growth Over year % (Line Chart)

Most Ordered Color (Bar Chart)

Total due and total tax by order (Correlation Analysis (scatter chart))


## Sales Person Perfermance and Territory

![Sales Person  And territory](https://github.com/user-attachments/assets/c1db5111-3bf3-433e-9421-8a58dc2054ed)

# Charts and Insights

Growth Over year %, Last Year Sales, Last month sales (KPI Cards)

Top  10 best sales person Performance by No. Orders and total sales (Line and stacked column chart)

Growth over territory and sales person in every territory ( Decomposition tree)

Filled map to show total sales over group and territory


## Drill Through

Used to show more details about the top 10 best sales person 


![Drill through](https://github.com/user-attachments/assets/ac7537ec-a7e9-4324-a7a3-83e49a5dcc10)



# conclusion

I have used technologies like SSIS and SSMS to handle the data. I also have used some of the intelligence tools like orphan handling and data warehousing standards to build the data mart which is ready for analysis and insights. Then i used Power BI dashboard to provides actionable insights into the  sales data mart business operations. 













   



