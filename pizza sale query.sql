select*from pizza_sales

select SUM(total_price) AS Total_Revenue from pizza_sales

select SUM(total_price) / COUNT(DISTINCT order_id) as AVG_ORDER_VALUE from pizza_sales

select SUM(quantity) as Total_pizza_sold from pizza_sales

select COUNT(DISTINCT order_id) AS Total_order from pizza_sales

select SUM(quantity)/COUNT(DISTINCT order_id) from pizza_sales

select CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) /
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))  AS AVG_Pizzas_Per_order from pizza_sales

SELECT DATENAME(DW,order_date) as order_day, COUNT(DISTINCT order_id) AS Total_orders from pizza_sales
GROUP BY DATENAME(DW,order_date) 

SELECT DATENAME(MONTH , order_date) as MONTH_NAME, COUNT(DISTINCT order_id)  as Total_order from pizza_sales
GROUP BY DATENAME(MONTH, order_date)  ORDER BY Total_order  DESC

select pizza_category, sum(total_price) as Total_sals, SUM(total_price) * 100 / (select sum(total_price) from pizza_sales WHERE MONTH(order_date) = 1 )  AS PCT from pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_category

select pizza_size, sum(total_price) as Total_sals, SUM(total_price) * 100 / (select sum(total_price) from pizza_sales WHERE MONTH(order_date) = 1 )  AS PCT from pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_size 
ORDER BY PCT DESC	

SELECT Top 5 pizza_name, sum(total_price)  AS Total_Revenue from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC 

SELECT Top 5 pizza_name , sum(quantity) as Total_orders from pizza_sales
GROUP BY pizza_name 
ORDER  BY Total_orders
