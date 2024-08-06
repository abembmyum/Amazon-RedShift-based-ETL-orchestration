# 1. Introduction
In recent years, due to the exponential growth of data and growing demand for Data driven insights, interest in ETL (Extract, Transform, Load) have grown rapidly. ETL enables organizations to consolidate data from different sources, transform it into a structured format, and load it into a target database or data warehouse for analysis and reporting, a critical process in data integration. 

ETL, which stands for extract, transform and load, is a data integration process that combines data from multiple data sources into a single, consistent data store that is loaded into a data warehouse or other target system.

As the databases grew in popularity in the 1970s, ETL was introduced as a process for integrating and loading data for computation and analysis, eventually becoming the primary method to process data for data warehousing projects.

ETL provides the foundation for data analytics and machine learning workstreams. Through a series of business rules, ETL cleanses and organizes data in a way which addresses specific business intelligence needs, like monthly reporting, but it can also tackle more advanced analytics, which can improve back-end processes or end user experiences. ETL is often used
by an organization to:
 -  Extract data from legacy systems
 - Cleanse the data to improve data quality and establish consistency.
 - Load data into a target database.

## How ETL works:

The easiest way to understand how ETL works is to understand what happens in each step of the process.
### 1. Extract
     
During data extraction, raw data is copied or exported from source locations to a staging area. Data management teams can extract data from a variety of data sources, which can be structured or unstructured. Those sources include but are not limited to:
     -  SQL or NoSQL servers
     -  CRM and ERP systems
     -  Flat files
     -  Email
     -  Web pages
### 2. Transform
  
In the staging area, the raw data undergoes data processing. Here, the data is transformed and consolidated for its intended analytical use case. This phase can involve the following tasks:
     - Filtering, cleansing, de-duplicating, validating, and authenticating the data.
     - Performing calculations, translations, or summarizations based on the raw data. This can include changing row and 
       column headers for consistency, converting currencies or other units of measurement, editing text strings, and more.
     - Conducting audits to ensure data quality and compliance.
     - Removing, encrypting, or protecting data governed by industry or governmental
       regulators.
    - Formatting the data into tables or joined tables to match the schema of the target data
      warehouse.
### iii. Load
In this last step, the transformed data is moved from the staging area into a target data warehouse. Typically, this involves an initial loading of all data, followed by periodic loading of incremental data changes and, less often, full refreshes to erase and replace data in the warehouse. For most organizations that use ETL, the process is automated, well-defined, continuous and batch driven. Typically, ETL takes place during off-hours when traffic on the source systems and the data warehouse is at its lowest.

## Why is ETL important?
Organizations today have both structured and unstructured data from various sources including:
 Customer data from online payment and customer relationship management (CRM)
systems
 Inventory and operations data from vendor systems
 Sensor data from Internet of Things (IoT) devices
 Marketing data from social media and customer feedback
 Employee data from internal human resources systems
By applying the process of ETL, individual raw datasets can be prepared in a format and
structure that is more consumable for analytics purposes, resulting in more meaningful insights.
For example, online retailers can analyze data from points of sale to forecast demand and
manage inventory. Marketing teams can integrate CRM data with customer feedback on social
media to study consumer behavior.
Amazon Redshift is a fully managed, petabyte-scale data warehouse service in the cloud that
offers fast query performance using the same SQL-based tools and business intelligence
applications that you use today. Many customers also like to use Amazon Redshift as an extract,
transform, and load (ETL) engine to use existing SQL developer skillsets, to quickly migrate
pre-existing SQL-based ETL scripts, and—because Amazon Redshift is fully ACIDcompliant—
as an efficient mechanism to merge change data from source data systems.
This project uses AWS Step Functions and AWS Glue Python Shell to orchestrate tasks for
those Amazon Redshift-based ETL workflows in a completely serverless fashion. AWS Glue
Python Shell is a Python runtime environment for running small to medium-sized ETL tasks,
such as submitting SQL queries and waiting for a response. Step Functions coordinates
multiple AWS services into workflows so you can easily run and monitor a series of ETL tasks.
