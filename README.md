# Pizzza_sales_report

This report provides an analysis of pizza sales data, including total revenue, average order value, total pizzas sold, total orders, average pizzas per order, hourly trend for total pizzas sold, weekly trend for total orders, percentage of sales by pizza category, percentage of sales by pizza size, total pizzas sold by pizza category, top 5 best sellers by revenue, total quantity, and total orders, and bottom 5 best sellers by revenue, total quantity, and total orders.

## SQL Queries

The following SQL queries can be used to retrieve the required data:

1. Total Revenue:
```sql
select cast(sum(total_price) as decimal(16,2)) as Total_revenue from US_sales.dbo.pizza_sales;
```

2. Average Order Value:
```sql
select cast(sum(total_price)/count(order_id) as decimal(16,2)) as avg_order_value from US_sales.dbo.pizza_sales;
```

3. Total Pizzas Sold:
```sql
select sum(quantity) as total_pizza_sold from US_sales.dbo.pizza_sales;
```

4. Total Orders:
```sql
select count(order_id)  as total_orders from US_sales.dbo.pizza_sales;
```

5. Average Pizzas Per Order:
```sql
select cast(sum(quantity)/count(distinct(order_id)) as decimal(16,2)) from US_sales.dbo.pizza_sales;
```

6. Hourly Trend for Total Pizzas Sold:
```sql
select DATEPART(hour,order_time) as order_hour , sum(quantity) as  tolal_pizza_Sld from US_sales.dbo.pizza_sales 
group by datepart(hour,order_time)
order by datepart(hour,order_time);
```

7. Weekly Trend for Total Orders:
```sql
select datepart(ISO_WEEK,order_date) as week_number, YEAR(order_date) as orderyear
,COUNT(DISTINCT order_id) as total_orders from US_sales.dbo.pizza_sales
 group by datepart(ISO_WEEK,order_date),YEAR(order_date)
 order by datepart(ISO_WEEK,order_date),YEAR(order_date);
```

8. Percentage of Sales by Pizza Category:
```sql
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from US_sales.dbo.pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM US_sales.dbo.pizza_sales
GROUP BY pizza_category;
```

9. Percentage of Sales by Pizza Size:
```sql
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from US_sales.dbo.pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM US_sales.dbo.pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;
```

10. Total Pizzas Sold by Pizza Category:
```sql
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM US_sales.dbo.pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;
```

11. Top 5 Best Sellers by Revenue, Total Quantity, and Total Orders:
```sql
select top 5 pizza_name , sum(total_price)as Total_revenue from US_sales.dbo.pizza_sales
group by pizza_name
order by Total_revenue desc

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM US_sales.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM US_sales.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC;
```

12. Bottom 5 Best Sellers by Revenue, Total Quantity, and Total Orders:
```sql
SELECT pizza_name, SUM(total_price) AS revenue, SUM(quantity) AS total_quantity, COUNT(*) AS total_orders
FROM US_sales.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY revenue, total_quantity, total_orders
LIMIT 5;
```

## Visualization

To visualize the data, you can use Tableau. Here are the recommended visualizations:

1. Stacked Bar Chart: Hourly Trend for Total Pizzas Sold
2. Line Chart: Weekly Trend for Total Orders
3. Pie Chart: Percentage of Sales by Pizza Category
4. Pie Chart: Percentage of Sales by Pizza Size
5. Funnel Chart: Total Pizzas Sold by Pizza Category
6. Bar Chart: Top 5 Best Sellers by Revenue, Total Quantity, and Total Orders
7. Bar Chart: Bottom 5 Best Sellers by Revenue, Total Quantity, and Total Orders

You can create these visualizations in Tableau by connecting to your database and using the SQL queries provided above as the data source.

Feel free to customize and expand upon this README file to suit your specific needs. Good luck with your pizza sales report!

Please note that the SQL queries provided are just examples and may need to be modified based on your specific database schema and table structure.
