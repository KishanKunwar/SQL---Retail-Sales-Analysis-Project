SQL — Retail Sales Analysis Project
🧠 Objective
Analyze retail sales data to uncover insights, clean messy records, and solve practical business questions using SQL. This project demonstrates foundational SQL skills essential for aspiring data analysts.

🗃️ Dataset Overview
The dataset contains detailed information on retail transactions with the following columns:

transactions_id: Unique identifier for each transaction

sale_date: Date of the transaction

sale_time: Time the sale occurred

customer_id: Unique identifier for each customer

gender: Gender of the customer

age: Age of the customer

category: Product category (e.g., Clothing, Beauty)

quantity: Number of items sold

price_per_unit: Price per individual unit

cogs: Cost of goods sold

total_sale: Total sale amount per transaction

🔍 Data Exploration & Cleaning
✅ Record Checks
Counted total transactions in the dataset

Identified the number of unique customers

Listed all unique product categories

🧹 Null Value Handling
Identified and removed records with missing values in essential fields including sale date, customer ID, category, and price details

Ensured the cleaned dataset is complete for accurate analysis

📊 Business Analysis
The project addresses the following real-world business questions:

Daily Sales: Retrieved all transactions made on a specific date

Category Performance: Filtered transactions where customers purchased more than 4 items in the "Clothing" category during November 2022

Sales by Category: Calculated the total and number of sales for each product category

Customer Demographics: Found the average age of customers purchasing "Beauty" products

High-Value Transactions: Identified all sales where the total value exceeded $1,000

Gender-Based Transactions: Analyzed the number of transactions by gender within each category

Monthly Trends: Determined the highest average sales month for each year using ranking techniques

Top Customers: Ranked the top 5 customers by their total spending

Unique Customer Count: Measured the number of unique customers per product category

Sales by Shift: Grouped sales into Morning, Afternoon, and Evening based on sale time to analyze customer behavior across shifts

📈 Key Findings
Customer Demographics: A broad age range of customers shop across various categories, with a fairly even gender distribution

Sales Trends: There are clear monthly peaks indicating seasonal demand patterns

High-Value Purchases: Several sales surpass the $1,000 mark, pointing to premium transactions

Top-Spending Customers: A small subset of customers contributes to a significant share of revenue

Category Insights: Clothing and Beauty emerged as top-selling product categories

Time-Based Insights: Most transactions occurred during the afternoon shift

📄 Reports Generated
Sales Summary: Overview of total sales, customer distribution, and category performance

Trend Analysis: Identified peak sales months and shifts

Customer Insights: Recognized top buyers and tracked unique customers per category

✅ Conclusion
This project provides a comprehensive walkthrough of data analysis using SQL, covering database setup, cleaning, EDA, and actionable business insights. It is especially useful for beginners aiming to build a strong foundation in SQL for data analytics.

👨‍💻 Author
Kishan Kunwar
Aspiring Data Analyst passionate about solving real-world problems through data.
