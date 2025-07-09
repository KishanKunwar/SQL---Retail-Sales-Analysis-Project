-- SQL - Retail Sales Analysis Project

create table  retail_sales 
(
	transactions_id	 int,
	sale_date date,
	sale_time time,
	customer_id	int,
	gender varchar(15),
	age int,
	category varchar(15),
	quantiy	 int,
	price_per_unit float,
	cogs float,
	total_sale float
);

select * from retail_sales
limit 10;


-- Rename column name 
alter table retail_sales 
rename column quantiy to quantity;

-- it will show how many datas is there in table
-- to conform it, you can open excel folder and check if its match or not


-- shows how many data are there in the table
select count(*) from retail_sales;



-- Now checking if there is any null value in transactions_id

select *
from retail_sales
where transactions_id is null;

select *
from retail_sales
where sale_date is null;

select *
from retail_sales
where sale_time is null;

select *
from retail_sales
where 
	transactions_id is null
	or 
	sale_date is null
	or 
	sale_time is null
	or 
	gender is null
	or
	category is null 
	or
	quantity is null
	or 
	cogs is null
	or 
	total_sale is null
;

-- delete this rows as a lot of data in each row is null

delete from retail_sales 
where
	transactions_id is null
	or 
	sale_date is null
	or 
	sale_time is null
	or 
	gender is null
	or
	category is null 
	or
	quantity is null
	or 
	cogs is null
	or 
	total_sale is null
;

-- check if these 3 rows are deleted

select count(*) from retail_sales;
-- show 1997 (before 2000)

-- Data Explorations

-- How many sales we have

select count(transactions_id) as total_sales from retail_sales;


-- how many customers we have
select count(distinct customer_id) from retail_sales;

-- how many categories we have
select count(distinct category) from retail_sales;

-- and which are these categories
select distinct category from retail_sales;

-- Data Analysts & Business Key Problems and Answers

-- Q.1  Write a SQL query to retrieve all columns for sales made on '2022-11-05'

select * from retail_sales
where 
sale_date =  '2022-11-05' ;


-- Q.2 Write a SQL query to retrieve all transactions where the category 
-- is 'Clothing' and the quantit  sold is >= 4 in the month of Nov-2022:

select * from retail_sales
where
category = 'Clothing'
and quantity >= 4
and sale_date between '2022-11-01' and '2022-11-30';
-- here date is not in text so could not use 
-- or you can change to char for instance and do it 
-- TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'

-- Q.3  Write a SQL query to calculate the total sales (total_sale) for each category.:

select category, sum(total_sale) from retail_sales
group by category;


-- Q.4 Write a SQL query to find the average age of customers who purchased
--  items from the 'Beauty' category.:

select round(avg(age), 2) from retail_sales
where category = 'Beauty'


-- Q.5 Write a SQL query to find all transactions 
-- where the total_sale is greater than 1000.:

select * from retail_sales
where total_sale > 1000;


-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) 
-- made by each gender in each category.:

select gender, category, sum(transactions_id) from retail_sales
group by gender, category ;



-- Q.7 Write a SQL query to calculate the average sale for each month.
--  Find out best selling month in each year:

select
extract (year from sale_date) as sale_year,
extract (month from sale_date) as sale_month,
avg(total_sale) as avg_month_sale
from retail_sales
group by sale_year, sale_month
order by sale_year, sale_month;

-- so the above will give you each month of each year, their average monthly sales
-- but to get the best selling month in each year

select 
*
from 
(
select
	extract (year from sale_date) as sale_year,
	extract (month from sale_date) as sale_month,
	avg(total_sale) as avg_month_sale,
	rank() over(partition by extract( year from sale_date)
	order by avg(total_sale) desc) as rank
	
from retail_sales
group by sale_year, sale_month
) as ranked_sales
where rank = 1;



-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales

select customer_id, sum(total_sale) as ts from retail_sales
group by customer_id 
order by ts desc
limit 5;


-- Q.9 Write a SQL query to find the number of unique customers who
--  purchased items from each category.:

select category, count(distinct (customer_id))
from retail_sales
group by category


-- Q.10 Write a SQL query to create each shift and number of orders 
-- (Example Morning <12, Afternoon Between 12 & 17, Evening >17):


select 
count(*) as number_of_order, 
case	
	when extract(hour from sale_time ) < 12 then 'Morning'
	when extract(hour from sale_time )  between 12 and 17 then 'Afternoon'
	else 'Evening'
end as shift
from retail_sales
group by shift;

-- in cte

with sale_shifts
as
(
select *,
case 
	when extract(hour from sale_time ) < 12 then 'Morning'
	when extract(hour from sale_time )  between 12 and 17 then 'Afternoon'
	else 'Evening'
end as shift
from retail_sales
)

select shift, count(*) from sale_shifts
group by shift;


-- End of the Projects


 




