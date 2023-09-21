# Pizzza_sales_report

Pizza Sales Report
This report provides an analysis of pizza sales data, including total revenue, average order value, total pizzas sold, total orders, average pizzas per order, hourly trend for total pizzas sold, weekly trend for total orders, percentage of sales by pizza category, percentage of sales by pizza size, total pizzas sold by pizza category, top 5 best sellers by revenue, total quantity, and total orders, and bottom 5 best sellers by revenue, total quantity, and total orders.

SQL Queries
The following SQL queries can be used to retrieve the required data:

--select * from US_sales.dbo.pizza_sales

  1.Total Revenue:
      select cast(sum(total_price) as decimal(16,2)) as Total_revenue from US_sales.dbo.pizza_sales
      
  2.Average Order Value:
      select cast(sum(total_price)/count(order_id) as decimal(16,2)) as avg_order_value from US_sales.dbo.pizza_sales
      
  3.Total Pizzas Sold:
      select sum(quantity) as total_pizza_sold from US_sales.dbo.pizza_sales
      
  4.Total Orders:
      select count(order_id)  as total_orders from US_sales.dbo.pizza_sales

  5.Average Pizzas Per Order:
SELECT SUM(quantity) / COUNT(*) AS average_pizzas_per_order
FROM pizza_orders;

   6.Hourly Trend for Total Pizzas Sold:
SELECT HOUR(order_time) AS hour, SUM(quantity) AS total_pizzas_sold
FROM pizza_orders
GROUP BY HOUR(order_time)
ORDER BY HOUR(order_time);
Weekly Trend for Total Orders:
SELECT WEEK(order_date) AS week, COUNT(*) AS total_orders
FROM pizza_orders
GROUP BY WEEK(order_date)
ORDER BY WEEK(order_date);
Percentage of Sales by Pizza Category:
SELECT pizza_category, SUM(total_price) / (SELECT SUM(total_price) FROM pizza_orders) * 100 AS percentage_of_sales
FROM pizza_orders
GROUP BY pizza_category;
Percentage of Sales by Pizza Size:
SELECT pizza_size, SUM(total_price) / (SELECT SUM(total_price) FROM pizza_orders) * 100 AS percentage_of_sales
FROM pizza_orders
GROUP BY pizza_size;
Total Pizzas Sold by Pizza Category:
SELECT pizza_category, SUM(quantity) AS total_pizzas_sold
FROM pizza_orders
GROUP BY pizza_category;
Top 5 Best Sellers by Revenue, Total Quantity, and Total Orders:
SELECT pizza_name, SUM(total_price) AS revenue, SUM(quantity) AS total_quantity, COUNT(*) AS total_orders
FROM pizza_orders
GROUP BY pizza_name
ORDER BY revenue DESC, total_quantity DESC, total_orders DESC
LIMIT 5;
Bottom 5 Best Sellers by Revenue, Total Quantity, and Total Orders:
SELECT pizza_name, SUM(total_price) AS revenue, SUM(quantity) AS total_quantity, COUNT(*) AS total_orders
FROM pizza_orders
GROUP BY pizza_name
ORDER BY revenue, total_quantity, total_orders
LIMIT 5;
Visualization
To visualize the data, you can use Tableau. Here are the recommended visualizations:

Stacked Bar Chart: Hourly Trend for Total Pizzas Sold
Line Chart: Weekly Trend for Total Orders
Pie Chart: Percentage of Sales by Pizza Category
Pie Chart: Percentage of Sales by Pizza Size
Funnel Chart: Total Pizzas Sold by Pizza Category
Bar Chart: Top 5 Best Sellers by Revenue, Total Quantity, and Total Orders
Bar Chart: Bottom 5 Best Sellers by Revenue, Total Quantity, and Total Orders
You can create these visualizations in Tableau by connecting to your database and using the SQL queries provided above as the data source.

Feel free to customize and expand upon this README file to suit your specific needs. Good luck with your pizza sales report!

Please note that the SQL queries provided are just examples and may need to be modified based on your specific database schema and table structure.


Certainly! Here's a sample README file that you can use as a starting point for your pizza sales report:

# Pizza Sales Report

This report provides an analysis of pizza sales data, including total revenue, average order value, total pizzas sold, total orders, average pizzas per order, hourly trend for total pizzas sold, weekly trend for total orders, percentage of sales by pizza category, percentage of sales by pizza size, total pizzas sold by pizza category, top 5 best sellers by revenue, total quantity, and total orders, and bottom 5 best sellers by revenue, total quantity, and total orders.

## SQL Queries

The following SQL queries can be used to retrieve the required data:

1. Total Revenue:
```sql
SELECT SUM(total_price) AS total_revenue
FROM pizza_orders;
```

2. Average Order Value:
```sql
SELECT AVG(total_price) AS average_order_value
FROM pizza_orders;
```

3. Total Pizzas Sold:
```sql
SELECT SUM(quantity) AS total_pizzas_sold
FROM pizza_orders;
```

4. Total Orders:
```sql
SELECT COUNT(*) AS total_orders
FROM pizza_orders;
```

5. Average Pizzas Per Order:
```sql
SELECT SUM(quantity) / COUNT(*) AS average_pizzas_per_order
FROM pizza_orders;
```

6. Hourly Trend for Total Pizzas Sold:
```sql
SELECT HOUR(order_time) AS hour, SUM(quantity) AS total_pizzas_sold
FROM pizza_orders
GROUP BY HOUR(order_time)
ORDER BY HOUR(order_time);
```

7. Weekly Trend for Total Orders:
```sql
SELECT WEEK(order_date) AS week, COUNT(*) AS total_orders
FROM pizza_orders
GROUP BY WEEK(order_date)
ORDER BY WEEK(order_date);
```

8. Percentage of Sales by Pizza Category:
```sql
SELECT pizza_category, SUM(total_price) / (SELECT SUM(total_price) FROM pizza_orders) * 100 AS percentage_of_sales
FROM pizza_orders
GROUP BY pizza_category;
```

9. Percentage of Sales by Pizza Size:
```sql
SELECT pizza_size, SUM(total_price) / (SELECT SUM(total_price) FROM pizza_orders) * 100 AS percentage_of_sales
FROM pizza_orders
GROUP BY pizza_size;
```

10. Total Pizzas Sold by Pizza Category:
```sql
SELECT pizza_category, SUM(quantity) AS total_pizzas_sold
FROM pizza_orders
GROUP BY pizza_category;
```

11. Top 5 Best Sellers by Revenue, Total Quantity, and Total Orders:
```sql
SELECT pizza_name, SUM(total_price) AS revenue, SUM(quantity) AS total_quantity, COUNT(*) AS total_orders
FROM pizza_orders
GROUP BY pizza_name
ORDER BY revenue DESC, total_quantity DESC, total_orders DESC
LIMIT 5;
```

12. Bottom 5 Best Sellers by Revenue, Total Quantity, and Total Orders:
```sql
SELECT pizza_name, SUM(total_price) AS revenue, SUM(quantity) AS total_quantity, COUNT(*) AS total_orders
FROM pizza_orders
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
