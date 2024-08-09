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
 - Customer data from online payment and customer relationship management (CRM)
   systems
 - Inventory and operations data from vendor systems
 - Sensor data from Internet of Things (IoT) devices
 - Marketing data from social media and customer feedback
 - Employee data from internal human resources systems
By applying the process of ETL, individual raw datasets can be prepared in a format and structure that is more consumable for analytics purposes, resulting in more meaningful insights. For example, online retailers can analyze data from points of sale to forecast demand and manage inventory. Marketing teams can integrate CRM data with customer feedback on social media to study consumer behavior.

Amazon Redshift is a fully managed, petabyte-scale data warehouse service in the cloud thatoffers fast query performance using the same SQL-based tools and business intelligenceapplications that you use today. Many customers also like to use Amazon Redshift as an extract,transform, and load (ETL) engine to use existing SQL developer skillsets, to quickly migratepre-existing SQL-based ETL scripts, and—because Amazon Redshift is fully ACIDcompliant—as an efficient mechanism to merge change data from source data systems. This project uses AWS Step Functions and AWS Glue Python Shell to orchestrate tasks for those Amazon Redshift-based ETL workflows in a completely serverless fashion. AWS Glue Python Shell is a Python runtime environment for running small to medium-sized ETL tasks, such as submitting SQL queries and waiting for a response. Step Functions coordinates multiple AWS services into workflows so you can easily run and monitor a series of ETL tasks.

This project uses AWS Step Functions and AWS Glue Python Shell to orchestrate tasks for those Amazon Redshift-based ETL workflows in a completely serverless fashion. AWS Glue Python Shell is a Python runtime environment for running small to medium-sized ETL tasks, such as submitting SQL queries and waiting for a response. Step Functions coordinates multiple AWS services into workflows so you can easily run and monitor a series of ETL tasks. Both AWS Glue Python Shell and Step Functions are serverless, which allows to automatically run and scale them in response to events you define, rather than requiring you to provision, scale, and manage servers.

While many traditional SQL-based workflows use internal database constructs like triggers and stored procedures, separating workflow orchestration, task, and compute engine components into standalone services allows you to develop, optimize, and even reuse each component independently. So, this project uses Amazon Redshift as an example, the aim is to more generally show how to orchestrate any SQL-based ETL.

# 2. Problem statement

In the dynamic and complex realm of urban transportation data analysis, the New York City (NYC) transportation dataset, which includes an extensive array of information about taxi trips, ride-sharing data, and other transportation metrics, presents a unique set of challenges and opportunities. The primary challenge lies in the efficient management and processing of this vast and intricate dataset to extract actionable insights into urban mobility, traffic patterns, and passenger behavior.

The development of an effective Extract, Transform, Load (ETL) pipeline is crucial for handling the complexities and scale of the NYC dataset. The goal of this project is to design and implement a robust, scalable, and reliable ETL process that leverages state-of-the-art cloud computing and data warehousing technologies.

Key components of the proposed solution include:

 -	Amazon Redshift: Utilized as the central data warehousing solution, Amazon Redshift will provide the storage and query capabilities needed to handle large-scale datasets efficiently. Its columnar storage and massively parallel processing (MPP) architecture make it particularly suited for aggregating and analyzing large volumes of data.

 -	AWS Step Functions: To orchestrate the ETL workflow, AWS Step Functions will be employed. This service will enable seamless coordination of the various ETL tasks, ensuring they are executed in an orderly, reliable, and efficient manner. Step Functions’ ability to handle complex workflows makes it ideal for managing the dependencies and contingencies inherent in the ETL process.

 -	AWS Glue: This fully managed, serverless data integration service will be used for the data transformation part of the ETL process. AWS Glue will simplify the task of preparing and transforming the data for analysis, handling tasks such as data cleansing, normalization, and deduplication.

 -	QuickSight: For data visualization and business intelligence, QuickSight will be utilized. This tool will enable stakeholders to interact with the processed data through intuitive interfaces, creating dashboards and reports that provide insights into trends, patterns, and anomalies within the urban transportation domain.

The implementation of this ETL pipeline must prioritize high availability, scalability, and flexibility to adapt to the ever-changing nature of the NYC transportation dataset. The final solution should not only handle the current data volume and complexity but also be scalable to accommodate future growth in data size and additional data sources. This approach will provide a comprehensive and nuanced understanding of New York City’s transportation landscape, aiding in effective urban planning and policy-making.

# 3. Scenario 

This ETL workflow utilizes the 'TLC Trip Record Data' dataset and encompasses two primary tasks, forming a streamlined ETL process:
  - Task 1: Transfer a copy of the dataset, specifically focusing on yellow taxi trips, from its original Amazon S3 location to a designated table in Amazon Redshift.
  - Task 2: Generate and export a series of output files to a different Amazon S3 location. These files will specifically highlight key metrics and patterns from the yellow taxi trip data, such as peak travel times, most frequented routes, and average fares, categorized by various dimensions like time, location, and trip characteristics. This detailed output will empower the analytics team to derive valuable insights into urban mobility and taxi service efficiency.

This dataset is publicly available via an Amazon Simple Storage Service (Amazon S3) bucket from Registry of Open Data on AWS.

# 4. Dataset

The New York City Taxi and Limousine Commission (NYC TLC) Yellow Trips dataset is a comprehensive collection of data that pertains to yellow taxi trips in New York City. This dataset is particularly valuable for a variety of analyses, including urban planning, transportation studies, and economic research.

# 5. Approach

The steps in this process are as follows:
 - The state machine launches a series of runs of an AWS Glue Python Shell job with parameters for retrieving database connection information from AWS Secrets Manager and an .sql file from S3.
 - Each run of the AWS Glue Python Shell job uses the database connection information to connect to the Amazon Redshift cluster and submit the queries contained in the .sql file.
    - Task 1: The cluster utilizes Amazon Redshift Spectrum to read data from S3 and load it into an Amazon Redshift table. Amazon Redshift Spectrum is commonly used as a means for loading data to Amazon Redshift.
    - Task 2: The cluster executes an aggregation query and exports the results to another Amazon S3 location via UNLOAD.
 - The state machine may send a notification to an Amazon Simple Notification Service (SNS) topic in the case of pipeline failure.
 - Users can query the data from the cluster and/or retrieve report output files directly from S3 or use QuickSight for visualization and business intelligence.

  ![image](https://github.com/user-attachments/assets/0c0edcd6-b9e3-4346-9b48-513e309fa6ab)

  Fig. 1. Solutions architecture from end to end

# 6. Services Used

The following tools and services are used:
 - Language: Python3, SQL.
 - Services: Amazon Redshift, AWS Glue, AWS Step Function, VPC, S3, Secrets Manager, QuickSight, SNS.
 - Libraries: boto3, sys.

## i. AWS redshift: A Scalable Data Warehouse

![image](https://github.com/user-attachments/assets/656ea9c2-a2c5-4fbd-ab72-a8a52148b8a9)

Amazon Redshift is a powerful cloud-based data warehouse solution offered by AWS. It's designed to handle massive amounts of data efficiently and quickly, making it ideal for complex data analysis and business intelligence.

Leveraging a columnar storage architecture, Redshift excels at rapid query processing and data compression. Its ability to scale seamlessly from small to petabyte-sized data warehouses makes it adaptable to evolving business needs.

As a fully managed service, AWS handles the underlying infrastructure, allowing users to focus on data analysis. Redshift integrates seamlessly with other AWS services and popular BI tools, streamlining data workflows. Robust security features, including encryption and access controls, safeguard sensitive data.

Key strengths of Redshift include:

 - Scalability: It can handle data sizes from small to petabytes, growing with your business needs.
 - Speed: Its columnar storage and parallel processing architecture enable lightning-fast query performance.
 - Cost-efficiency: Pay only for the resources you use, with no upfront costs or long-term commitments.
 - Flexibility: Works with various data types and integrates seamlessly with other AWS services.
 - Security: Robust security features protect your sensitive data.
 - Ease of use: A fully managed service that handles infrastructure, allowing you to focus on data analysis.
   
In essence, Redshift simplifies the process of storing, processing, and analyzing vast datasets, providing valuable insights to drive business decisions.

## ii. AWS Glue: A Serverless ETL Service
![image](https://github.com/user-attachments/assets/1eec9d63-2d36-4739-a291-b8268e2a6c21) 

AWS Glue is a cloud-based service designed to streamline the process of extracting, transforming, and loading (ETL) data. By automating infrastructure management and providing a centralized data catalog, Glue simplifies data preparation for analytics.

As a serverless offering, Glue automatically scales resources to handle varying workloads, eliminating the need for manual infrastructure provisioning. It supports a wide range of data sources and targets, enabling seamless data movement across different systems.

Glue's intuitive visual interface and powerful APIs accommodate both technical and non-technical users. Additionally, its integration with other AWS services enhances data processing capabilities and workflow automation.

Key features of AWS Glue include:

 - Automated ETL: Handles data extraction, transformation, and loading with minimal manual intervention.
 - Scalability: Adjusts resources dynamically to match workload demands.
 - Centralized Metadata: Stores information about data sources, transformations, and targets in a single repository.
 - Data Source Flexibility: Connects to various data sources and targets.
 - Transformation Capabilities: Offers built-in and custom transformations for data manipulation.
 - Data Quality: Ensures data integrity through validation checks.
 - User-Friendly Interface: Provides a visual tool for ETL job creation and management.
 - Programmatic Control: Allows for ETL job automation through APIs.
 - Integration: Works seamlessly with other AWS services for enhanced functionality.

## iii. AWS Stepfunctions: Orchestrating Complex Workflows

![image](https://github.com/user-attachments/assets/2c825ffa-417d-4097-9470-e2c5c4027b91)

AWS Step Functions is a cloud-based service for managing complex workflows across distributed applications and microservices. It simplifies the process by providing a visual interface to design and monitor workflows without the need for managing underlying infrastructure.

Step Functions defines workflows as a sequence of steps (or states) using Amazon State Language (ASL). Each step can trigger various AWS services, Lambda functions, or external systems. The workflow progresses based on the outcomes of previous steps.

Key features of AWS Step Functions include:

 - Visual workflow design: Easily create and modify workflows using a graphical interface.
 - Serverless architecture: Automatically manages infrastructure for workflow execution.
 - Built-in error handling: Defines custom responses to workflow errors.
 - Multiple workflow management: Handles various concurrent workflows efficiently.
 - Broad integration: Connects with numerous AWS services and external systems.
 - Parallel processing: Executes multiple workflow branches simultaneously.
 - Automatic retries: Resubmits failed tasks based on defined retry policies.
   
## iv. AWS S3: Scalable and Durable Object Storage

![image](https://github.com/user-attachments/assets/08f91dd4-e2f0-4ee2-b752-43068ce5c822)

Amazon S3 is a highly scalable and durable cloud storage service for storing and protecting various data types. It offers industry-leading performance and security, making it suitable for a wide range of use cases, from websites and mobile applications to big data analytics and archiving.

Key features of Amazon S3 include:

 - High durability and availability: Stores data redundantly across multiple regions.
 - Robust security: Provides encryption, access controls, and auditing capabilities.
 - Scalability: Handles massive amounts of data with ease.
 - High performance: Delivers fast data access.
 - Data lifecycle management: Optimizes storage costs through automated tiering.
 - Extensive integration: Works seamlessly with other AWS services and third-party tools.

## v. AWS VPC: Creating Isolated Network Environments

![image](https://github.com/user-attachments/assets/53c92063-e974-4863-a8a8-44c1c872c637)


Amazon Virtual Private Cloud (VPC) allows you to create isolated network environments within the AWS cloud. You have full control over your virtual network, including IP address ranges, subnets, and network gateways.

Key features of Amazon VPC include:

 - Network isolation: Separates resources within a dedicated network environment.
 - Enhanced security: Provides security groups and network access control lists for protection.
 - Customization: Define network settings to match specific requirements.
 - Connectivity: Connect to your on-premises network through VPN or Direct Connect.
 - Scalability: Easily expand or reduce network resources as needed.
 - Integration: Works seamlessly with other AWS services.
 - Network visibility: Monitor network traffic with VPC Flow Logs.

## vi. AWS Secrets Manager: Secure Secret Management

 ![image](https://github.com/user-attachments/assets/a5fb8f01-8778-461e-ae1d-ecc020db72a6)

<div style="text-align: center;">
 ![image](https://github.com/user-attachments/assets/a5fb8f01-8778-461e-ae1d-ecc020db72a6)
</div>

AWS Secrets Manager simplifies the management and protection of sensitive information like database credentials, API keys, and other secrets. It automates secret rotation and provides centralized control over secret access.

Key features of AWS Secrets Manager include:

 - Automated secret rotation: Reduces security risks by regularly updating secrets.
 - Centralized management: Stores and manages secrets in a secure location.
 - Access control: Restricts access to secrets using IAM policies.
 - Auditing and monitoring: Tracks secret changes and access attempts.
 - Encryption: Protects secrets with strong encryption using AWS KMS.

## vii. AWS SNS: Reliable Pub/Sub Messaging

![image](https://github.com/user-attachments/assets/94f74a16-d0c7-4b25-9999-42fcd7c1e0bf)


Amazon Simple Notification Service (SNS) is a fully managed pub/sub messaging service for decoupling distributed systems and applications. It enables you to send messages or notifications to various subscribers, including other AWS services and external endpoints.

Key features of AWS SNS include:

 - Flexible subscriptions: Supports multiple subscriber types (e.g., email, HTTP, SQS, Lambda).
 - High durability and availability: Ensures reliable message delivery.
 - Scalability: Handles large message volumes efficiently.
 - Message filtering: Allows subscribers to receive specific message types.
 - Security: Protects messages with IAM-based access controls.
 - Integration: Works seamlessly with other AWS services.

## viii. AWS QuickSight: Business Intelligence and Data Visualization

![image](https://github.com/user-attachments/assets/2ca4ecf9-d06c-4062-bcdb-be1ffb8889cb)

Amazon QuickSight is a cloud-based business intelligence service for creating interactive dashboards, visualizations, and performing data analysis. It simplifies data exploration and insights generation.

Key features of Amazon QuickSight include:

 - Easy data visualization: Creates various chart types with a user-friendly interface.
 - Multiple data source support: Connects to various data sources, including AWS services and external databases.
 - Interactive dashboards: Builds dynamic dashboards for data exploration.
 - AWS service integration: Works seamlessly with other AWS services for data processing and analysis.
 - Machine learning insights: Provides automated insights based on data patterns.
 - Advanced analytics: Supports forecasting, trend analysis, and anomaly detection.
 - Customization: Allows users to tailor dashboards and visualizations.


# 7. Prerequisites

 - Create an AWS account 
 - Download the dataset.

Ways to Interact with AWS: 

AWS offers multiple methods to interact with its services:

 - AWS Management Console: A web-based graphical interface for managing AWS resources. Ideal for beginners and those who prefer a visual approach.
 - AWS Command Line Interface (CLI): A command-line tool for controlling AWS services. Suitable for scripting, automation, and users comfortable with terminal environments.
 - AWS Cloud Development Kit (CDK): An infrastructure-as-code (IaC) framework for defining and provisioning AWS resources using familiar programming languages.
 - AWS Software Development Kits (SDKs): Libraries for integrating AWS services into your applications. Used for programmatic access and building custom solutions.

# 8. Setup

First, choose a region near to the S3 bucktes if you are using a public S3 or choose a nearest region.

## 8.1 Create VPC

 i.	Navigate to services > Networking and Content Delivery > VPC.

# 10. Conclusion

In summary, the project effectively orchestrated ETL workflows for Amazon Redshift using AWS Step Functions and AWS Glue. 

Key highlights include:
 - Efficient Data Transformation: AWS Glue streamlined data extraction and transformation tasks, enhancing efficiency and data quality.
 - Workflow Orchestration: AWS Step Functions provided a seamless orchestration of Glue jobs, ensuring a reliable and scalable ETL workflow.
 - Redshift Data Warehousing: Leveraging Amazon Redshift as a scalable data warehouse for analytics, offering optimized query performance.
 - S3 for Staging: Amazon S3 served as a versatile staging area for raw and processed data, ensuring data consistency and integrity.
 - QuickSight Visualization: Integration with QuickSight enabled the visualization and analysis of Redshift data, creating insightful dashboards.
   
This project illustrates the power of AWS services in handling large-scale ETL tasks, providing a foundation for scalable and resilient data processing workflows.


# 11. References
 1.	"New York City Taxi and Limousine Commission (TLC) Trip Record Data," Registry of Open Data on AWS. [Online]. Available: https://registry.opendata.aws/nyc-tlc-trip-records-pds. 
 2.	"Orchestrate Amazon Redshift-based ETL Workflows with AWS Step Functions and AWS Glue," Amazon Web Services, Inc. [Online]. Available: https://aws.amazon.com/blogs/big-data/orchestrate-amazon-redshift-based-etl-workflows-with-aws-step-functions-and-aws-glue/. 
 3.	"AWS Glue Developer Guide," Amazon Web Services, Inc. [Online]. Available: https://docs.aws.amazon.com/glue/latest/dg/add-job-python.html. 
 4.	"Identity and Access Management (IAM) User Guide," Amazon Web Services, Inc. [Online]. Available: https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html. 
 5.	"Getting Started with Amazon Redshift Spectrum," Amazon Web Services, Inc. [Online]. Available: https://docs.aws.amazon.com/redshift/latest/dg/c-getting-started-using-spectrum.html. 
 6.	"Creating Python Libraries in an Egg Format," AWS Glue Developer Guide, Amazon Web Services, [Online]. Available: https://docs.aws.amazon.com/glue/latest/dg/add-job-python.html#create-python-egg-library. 
 7.	"Creating External Schemas for Amazon Redshift Spectrum," Amazon Redshift Database Developer Guide, Amazon Web Services, [Online]. Available: https://docs.aws.amazon.com/redshift/latest/dg/c-spectrum-external-schemas.html. 
 8.	"Defining External Tables in Amazon Redshift Spectrum," Amazon Redshift Database Developer Guide, Amazon Web Services, [Online]. Available: https://docs.aws.amazon.com/redshift/latest/dg/c-spectrum-external-tables.html. 
 9.	"ALTER TABLE for External Tables," Amazon Redshift Database Developer Guide, Amazon Web Services, [Online]. Available: https://docs.aws.amazon.com/redshift/latest/dg/r_ALTER_TABLE_external-table.html. 
 10.	"Creating Tables," Amazon Redshift Database Developer Guide, Amazon Web Services, [Online]. Available: https://docs.aws.amazon.com/redshift/latest/dg/t_Creating_tables.html. 
 11.	"Creating an Activity State Machine," AWS Step Functions Developer Guide, Amazon Web Services, [Online]. Available: https://docs.aws.amazon.com/step-functions/latest/dg/tutorial-creating-activity-state-machine.html.
 12.	Amazon Web Services, Inc., "Creating a VPC," Amazon Virtual Private Cloud User Guide, [Online]. Available: https://docs.aws.amazon.com/vpc/latest/userguide/create-vpc.html.









