-- Pizza Sales Analysis | MySQL 8+
-- Original questions preserved; queries adjusted to match uploaded CSV headers.
-- Q1 Total orders
SELECT COUNT(*) AS total_orders FROM orders;
-- Q2 Total revenue
SELECT ROUND(SUM(od.quantity*p.price),2) AS total_revenue FROM order_details od JOIN pizzas p ON od.pizza_id=p.pizza_id;
-- Q3 Highest-priced pizza
SELECT pt.name,p.size,p.price FROM pizza_types pt JOIN pizzas p ON pt.pizza_type_id=p.pizza_type_id ORDER BY p.price DESC LIMIT 1;
-- Q4 Most popular size by units sold
SELECT p.size,COUNT(*) AS detail_rows,SUM(od.quantity) AS units_sold FROM order_details od JOIN pizzas p ON od.pizza_id=p.pizza_id GROUP BY p.size ORDER BY units_sold DESC;
-- Q5 Top five pizza types by quantity
SELECT pt.name,SUM(od.quantity) AS units_sold FROM order_details od JOIN pizzas p ON od.pizza_id=p.pizza_id JOIN pizza_types pt ON p.pizza_type_id=pt.pizza_type_id GROUP BY pt.name ORDER BY units_sold DESC LIMIT 5;
-- Q6 Category quantity
SELECT pt.category,SUM(od.quantity) AS units_sold FROM order_details od JOIN pizzas p ON od.pizza_id=p.pizza_id JOIN pizza_types pt ON p.pizza_type_id=pt.pizza_type_id GROUP BY pt.category ORDER BY units_sold DESC;
-- Q7 Hourly order distribution
SELECT HOUR(`time`) AS order_hour,COUNT(*) AS total_orders FROM orders GROUP BY HOUR(`time`) ORDER BY order_hour;
-- Q8 Category-wise pizza type distribution
SELECT category,COUNT(*) AS pizza_types FROM pizza_types GROUP BY category ORDER BY pizza_types DESC;
-- Q9 Average daily pizza quantity
WITH daily_sales AS (SELECT o.`date` AS order_date,SUM(od.quantity) AS units_sold FROM orders o JOIN order_details od ON o.order_id=od.order_id GROUP BY o.`date`) SELECT ROUND(AVG(units_sold),2) AS avg_daily_pizzas FROM daily_sales;
-- Q10 Top three pizza types by revenue
SELECT pt.name,ROUND(SUM(od.quantity*p.price),2) AS revenue FROM order_details od JOIN pizzas p ON od.pizza_id=p.pizza_id JOIN pizza_types pt ON p.pizza_type_id=pt.pizza_type_id GROUP BY pt.name ORDER BY revenue DESC LIMIT 3;
-- Q11 Pizza type percentage of total revenue
WITH type_sales AS (SELECT pt.name,SUM(od.quantity*p.price) AS revenue FROM order_details od JOIN pizzas p ON od.pizza_id=p.pizza_id JOIN pizza_types pt ON p.pizza_type_id=pt.pizza_type_id GROUP BY pt.name) SELECT name,ROUND(revenue,2) AS revenue,ROUND(100*revenue/SUM(revenue) OVER(),2) AS revenue_share_pct FROM type_sales ORDER BY revenue DESC;
-- Q12 Cumulative revenue by date
WITH daily_revenue AS (SELECT o.`date` AS order_date,SUM(od.quantity*p.price) AS revenue FROM orders o JOIN order_details od ON o.order_id=od.order_id JOIN pizzas p ON od.pizza_id=p.pizza_id GROUP BY o.`date`) SELECT order_date,ROUND(revenue,2) AS daily_revenue,ROUND(SUM(revenue) OVER(ORDER BY order_date),2) AS cumulative_revenue FROM daily_revenue ORDER BY order_date;
-- Q13 Top three pizza types by revenue in each category
WITH ranked AS (SELECT pt.category,pt.name,ROUND(SUM(od.quantity*p.price),2) AS revenue,DENSE_RANK() OVER(PARTITION BY pt.category ORDER BY SUM(od.quantity*p.price) DESC) AS ranking FROM order_details od JOIN pizzas p ON od.pizza_id=p.pizza_id JOIN pizza_types pt ON p.pizza_type_id=pt.pizza_type_id GROUP BY pt.category,pt.name) SELECT * FROM ranked WHERE ranking<=3 ORDER BY category,ranking;