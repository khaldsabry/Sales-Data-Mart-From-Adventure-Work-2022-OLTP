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
   



