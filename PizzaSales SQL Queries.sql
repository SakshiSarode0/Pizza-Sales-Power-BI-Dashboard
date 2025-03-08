Select * from pizza_sales

----KPIs

---Total_Revenue
Select sum(total_price) as Total_Revenue
From Pizza_sales

----Avg_Order_Value

SELECT SUM(Total_Price)/COUNT(distinct order_id) as Avg_Order_Value
FROM pizza_sales

----Total_Pizzas_Sold
SELECT sum(quantity) as Total_Pizzas_Sold
FROM pizza_sales

---Total_Orders

Select COUNT(DISTINCT order_id) AS Total_Orders
from pizza_sales

----Avg_Pizza_per_Order
SELECT CAST(CAST(sum(quantity) AS DECIMAL(10,2))/CAST(COUNT(DISTINCT order_id)  AS DECIMAL(10,2)) AS decimal(10,2)) as Avg_Pizza_per_Order
FROM pizza_sales


--Daily Trend for Total Orders

SELECT DATENAME(DW,order_date) AS WEEKDAY, COUNT(DISTINCT order_id) as Total_Orders
FROM pizza_sales
GROUP BY DATENAME(DW,order_date)

--Monthly Trend
SELECT DATENAME(MONTH,order_date) AS Months, COUNT(DISTINCT order_id) as Total_Orders
FROM pizza_sales
GROUP BY DATENAME(MONTH,order_date)
ORDER BY COUNT(DISTINCT order_id) DESC


----% OF CATEGORY SALES

SELECT pizza_category, CAST((SUM(TOTAL_PRICE) * 100/ (SELECT SUM(TOTAL_PRICE) FROM pizza_sales)) AS DECIMAL(10,2)) AS Percentage_of_Total_Sales
FROM pizza_sales
GROUP BY pizza_category

----% OF sales by Pizza Size
SELECT pizza_size, CAST((SUM(TOTAL_PRICE) * 100/ (SELECT SUM(TOTAL_PRICE) FROM pizza_sales)) AS DECIMAL(10,2)) AS Percentage_of_Total_Sales
FROM pizza_sales
GROUP BY pizza_size
order by Percentage_of_Total_Sales desc

----Top 5 & Bottom 5 best seller by total pizza sold
---TOP 5 BY REVENUE
SELECT TOP 5 pizza_name, SUM(total_price) as Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

--BOTTOM 5 BY REVENUE

SELECT TOP 5 pizza_name, SUM(total_price) as Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

---TOP 5 BY QUANTITY
SELECT TOP 5 pizza_name, SUM(quantity) as Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Quantity DESC


--BOTTOM 5 BY QUANTITY

SELECT TOP 5 pizza_name, SUM(quantity) as Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Quantity asc

---TOP 5 BY orders
SELECT TOP 5 pizza_name, count(distinct order_id) as total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders DESC

--BOTTOM 5 BY Orders
SELECT TOP 5 pizza_name, count(distinct order_id) as total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders asc

