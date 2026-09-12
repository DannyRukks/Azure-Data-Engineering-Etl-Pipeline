# 🚀 End-to-End Azure Data Engineering ETL Project

### 📌 Project Overview
This project demonstrates the design and implementation of an **end-to-end cloud data engineering pipeline on Microsoft Azure**, transforming raw data from an on-premises SQL Server environment into business-ready analytical data for reporting and visualization.

The project follows a **modern Medallion Architecture**, consisting of **Bronze, Silver, and Gold data layers.** Azure Data Factory is used for data ingestion, Azure Blob Storage serves as the cloud data lake, Azure Databricks performs data transformation and processing, Azure Synapse Analytics provides the analytical serving layer, and Power BI is used for business intelligence and reporting.

The solution demonstrates how an organization can move from traditional on-premises data storage to a scalable cloud-based data platform while maintaining a structured and efficient data processing workflow.

### 🏗️ Architecture
![Azure Data Engineering Architecture](Azure-data-pipeline/architecture/ETL_Architecture.jpg)

### Architecture Components
| Components	| Technology | Purpose |
|---------|---------|---------|
| Source System | On-Premises SQL Server | Stores raw operational data |
| Data Ingestion	| Azure Data Factory | Extracts data from SQL Server and loads it into Azure |
| Data Lake	|Azure Blob Storage | Stores Bronze, Silver and Gold datasets |
| Data Processing |	Azure Databricks | Cleans, transforms and prepares data |
| Analytical Layer	| Azure Synapse Analytics | Provides SQL-based access to curated Gold data |
| Visualization |	Power BI | Creates dashboards and business reports |
