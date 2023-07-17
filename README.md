# Products-KPI-Analysis
DataPath Module1 Final Project: Products KPI Analysis

DataPath — Module 1: Data Engineering Final Project

Technologies Used:
Google Cloud (Hosting SQL Database), MySQL Workbench (SQL Editor connecting to GC DB), MongoDB Atlas (Hosting NoSQL Database — Data imported from Excel CSV file).

Project Requirements:
* Create a Table that must have 3 embedded tables.
* Create Denormalized Board/Boards (SQL)
* Use the Table/Tables with a Stored Procedure to extract data of interest (KPI)
* Download as CSV and register the Table/Tables in MongoDB Atlas(Data Types)
* Create a query for Aggregation indicators, AND comparison operators | OR (KPI)

Published Work: https://medium.com/@cacocagarciap/products-kpi-analysis-f9c54366d107

Explanation:

For this final project, I wanted to make a case study about the Products that have been sold. Specifically, I wanted to know if there were any products who had 50 or more units ordered in a single Order, and if the Total Cost of those unit of the corresponding Order was over $7,500.

Please note that the Database for this first section is hosted on a Google Cloud SQL Instance, and MySQL Workbench was used to connect to the instance for Query Editing.

To obtain this information, I created a Stored Procedure as shown in IMG1. In IMG1 we a Stored Procedure that creates a Table from the resulting Query. The Query itself is composed of the Customer Table being Joined with the Orders, OrderDetails, and ProductDetails Table. Additionally, we see that the Stored Procedure passes along 2 Parameters: qord and ttc. Qord is the parameter that determines the filter for the products units per order, or in other words the “quantityOrdered”. The Ttc parameter determines the filter for the calculated “TotalCost” (quantityOrdered * priceEach) of the products that where ordered.

For my specifc anlysis, my Qord value is 50 and my Ttc value is $7,500. This is shown on the Call Procedure (IMG2).

The result of the Stored Procedure was a table called ccoca_productsKPI that contains 22 records. Its records are Ordered By TotalCost in DESC order, to show the list from highest to lowest TotalCost.

I later than exported this table to a CSV file and Import it to my DB Cluster created in MongoDB (IMG3). I called the imported Collection: “finalproject”. Additionally, the same DB that was hosted on GC was imported to my MongoDB Cluster since the Customers Table was required for the project.

Once having the data imported (finalproject collection), I wanted to find out if there were any documents that had a “Ford” product and that its price was greater than or equal to 162, OR if there were any documents that had a “Mercedes” product and that its price was greater than or equal to 168 (IMG4).

According to my data, only two documents met the criteria, and they turned out to be Ford documents. There were no Mercedes documents that met the criteria (IMG5)

Lastly, using the $lookup aggregate function, I Joined my “finalproject” collection with the “Customers” collections, to obtain the Document of the Customer that’s related to each Document of my finalproject collection (IMG6).

KPI Relevance:

It’s crucial for businesses to keep track which products are being ordered the most, and how much are Customers paying for that product.

Business Intelligence
Data Analysis
Mongodb
Google Cloud Platfo
