# SQL---Retail-Sales-Analysis-Project

🧠 Objective
Analyze retail sales data to uncover insights, clean messy records, and solve practical business questions using SQL.

🗃️ Dataset Overview
The dataset includes the following fields:

transactions_id: Unique ID of each sale

sale_date: Date of the transaction

sale_time: Time of sale

customer_id: Unique customer ID

gender: Gender of the customer

age: Age of the customer

category: Product category (e.g., Clothing, Beauty)

quantity: Quantity sold

price_per_unit: Unit price

cogs: Cost of goods sold

total_sale: Total amount of the sale


🔎 Data Exploration & Cleaning


🧮 Record and Category Checks

SELECT COUNT(*) FROM retail_sales;
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;
SELECT DISTINCT category FROM retail_sales;

🧹 Null Value Removal

SELECT * FROM retail_sales
WHERE sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
      gender IS NULL OR age IS NULL OR category IS NULL OR 
      quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

DELETE FROM retail_sales
WHERE sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
      gender IS NULL OR age IS NULL OR category IS NULL OR 
      quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

      
📊 Business Analysis Queries


1. Sales on a Specific Date

SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05';


2. Clothing Sales with Quantity ≥ 4 (Nov 2022)

SELECT * FROM retail_sales
WHERE category = 'Clothing'
  AND TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
  AND quantity >= 4;

  
3. Total Sales by Category
SELECT category, SUM(total_sale) AS net_sale, COUNT(*) AS total_orders
FROM retail_sales
GROUP BY category;


5. Average Age (Beauty Category)
SELECT ROUND(AVG(age), 2) AS avg_age
FROM retail_sales
WHERE category = 'Beauty';


7. High-Value Transactions (> $1000)
SELECT * FROM retail_sales
WHERE total_sale > 1000;


9. Transactions by Gender & Category

SELECT category, gender, COUNT(*) AS total_trans
FROM retail_sales
GROUP BY category, gender
ORDER BY category;


10. Best-Selling Month Each Year

SELECT year, month, avg_sale
FROM (
  SELECT 
    EXTRACT(YEAR FROM sale_date) AS year,
    EXTRACT(MONTH FROM sale_date) AS month,
    AVG(total_sale) AS avg_sale,
    RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) 
                ORDER BY AVG(total_sale) DESC) AS rank
  FROM retail_sales
  GROUP BY 1, 2
) t
WHERE rank = 1;


11. Top 5 Customers by Total Sales

SELECT customer_id, SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;


12. Unique Customers per Category

SELECT category, COUNT(DISTINCT customer_id) AS cnt_unique_cs
FROM retail_sales
GROUP BY category;


13. Shift-Based Order Count
WITH hourly_sale AS (
  SELECT *,
    CASE
      WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
      WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
      ELSE 'Evening'
    END AS shift
  FROM retail_sales
)
SELECT shift, COUNT(*) AS total_orders
FROM hourly_sale
GROUP BY shift;



📈 Key Findings
Customer Demographics: Customers span a wide age range, and the gender split is fairly balanced.

Sales Trends: Clear monthly patterns reveal seasonal peaks.

Premium Transactions: Several transactions exceeded $1,000 in value.

Top Customers: A small group of customers account for a large portion of revenue.

Popular Categories: Clothing and Beauty emerged as high-performing categories.

Peak Hours: Most sales occur in the afternoon shift.

📄 Reports
Sales Summary: Total revenue, top-performing categories, and high-volume customers.

Trend Analysis: Seasonal trends and shift-based behavior.

Customer Insights: Repeat buyers, demographic trends, and loyalty opportunities.

✅ Conclusion
This beginner-friendly SQL project offers hands-on experience in:

Database creation

Data cleaning

Exploratory analysis

Business decision-making through queries

It’s ideal for data analysts seeking to strengthen their SQL and problem-solving skills in a retail context.

👨‍💻 Author
Kishan Kunwar
