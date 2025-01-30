# Sales Data Mart From Adventure Work 2022 OLTP

# Project Overview
In this project, I transformed the AdventureWorks2022 dataset from its original OLTP format into a structured data mart designed for analytical purposes. By reorganizing and optimizing the data, I created a solution that enables efficient analysis and visualization of business performance metrics.The project highlights my ability to bridge the gap between raw transactional data and meaningful business intelligence.

# Contents
 ### 1- Project Stages.
###  2- OLTP Database Overview.
###  3- Data Mart Modeling.
###  4- Data Mart ETL Process Using SSIS.
###  5- Replacing Null and Orphan Data Handling.
###  6- Fact Table Loading.
###  7- Incremental Loading of Data.
###  8- Key Visualizations Using PowerBI.

# (1/8) Project Stages

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

# (2/8) OLTP Database Overview

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


# (3/8) Data Mart Modeling

The Sales data Mart, was designed using a Star schema approach. I have chose to model the data mart as a star schema for the efficiency, Simplicity, Analytical Efficiency and fast retrieval of data to meet customer needs.The schema consists of:

Fact Tables: Central tables that store quantitative data.

Dimension Tables: Surrounding tables that store descriptive attributes (e.g., customer, Product, Territory, Shipping Method, Sales Person). 
A date dimension was added to track historical changes and enable time-based analysis.

![Star Schema](https://github.com/user-attachments/assets/3f8292bd-7bed-4ee7-9653-2a73f48bcc62)


# (4/8) Data Mart ETL Process Using SSIS

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








   



