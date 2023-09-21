select * from US_sales.dbo.pizza_sales
order by quantity desc


--total revenue
select cast(sum(total_price) as decimal(16,2)) as Total_revenue from US_sales.dbo.pizza_sales

--average order value

select cast(sum(total_price)/count(order_id) as decimal(16,2)) as avg_order_value from US_sales.dbo.pizza_sales

---total pizzas sold

select sum(quantity) as total_pizza_sold from US_sales.dbo.pizza_sales

--total orders
select count(order_id)  as total_orders from US_sales.dbo.pizza_sales


-- avg pizza per order
select cast(sum(quantity)/count(distinct(order_id)) as decimal(16,2)) from US_sales.dbo.pizza_sales


---Hourly trend

select DATEPART(hour,order_time) as order_hour , sum(quantity) as  tolal_pizza_Sld from US_sales.dbo.pizza_sales 
group by datepart(hour,order_time)
order by datepart(hour,order_time)

---weeklytrend
select datepart(ISO_WEEK,order_date) as week_number, YEAR(order_date) as orderyear
,COUNT(DISTINCT order_id) as total_orders from US_sales.dbo.pizza_sales
 group by datepart(ISO_WEEK,order_date),YEAR(order_date)
 order by datepart(ISO_WEEK,order_date),YEAR(order_date)
 

 select * from US_sales.dbo.pizza_sales
 ----% sales by category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from US_sales.dbo.pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM US_sales.dbo.pizza_sales
GROUP BY pizza_category

  -----% sales per pizza size
  SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from US_sales.dbo.pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM US_sales.dbo.pizza_sales
GROUP BY pizza_category

---sales per pizza size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from US_sales.dbo.pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM US_sales.dbo.pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size

----sold by catogry
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM US_sales.dbo.pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC


--- top 5
select top 5 pizza_name , sum(total_price)as Total_revenue from US_sales.dbo.pizza_sales
group by pizza_name
order by Total_revenue desc


SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM US_sales.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC


--top 5 pizza by total orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM US_sales.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM US_sales.dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC

