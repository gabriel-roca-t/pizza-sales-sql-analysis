
/*
=========================================================
Pizza Sales SQL Analysis
Author: Gabriel Roca
Database: PostgreSQL
Description: This file contains SQL queries answering 
key business questions related to the pizza sales 
performance of a pizza restaurant.
=========================================================

Table of Contents:
Q1 - Busiest days of the week
Q2 - Busiest hours of the day
Q3 - Seating occupation per hour
Q4 - Best and worst-selling pizzas
Q5 - Most popular pizza categories
Q6 - Most popular pizza sizes
Q7 - Average number of pizzas per order
Q8 - Average order value
Q9 - Pizzas commonly bought together
Q10 - Highest revenue pizza combinations
=========================================================
*/


-- Q1: What are the busiest days of the week?
-- Shows which days have the highest total pizza sales.

SELECT 
    TO_CHAR(o.date::DATE, 'Day') AS week_day,
    SUM(quantity) AS pizzas_sold
FROM order_details od 
LEFT JOIN orders o 
    ON od.order_id = o.order_id
GROUP BY week_day
ORDER BY pizzas_sold DESC;


-- Q2: What are the busiest hours of the day?
-- Shows the average pizzas sold during each hour of the day.

SELECT 
    hour_of_day,
    AVG(pizzas_sold) AS avg_pizzas
FROM (
    SELECT 
        o.date, 
        EXTRACT(HOUR FROM o.time::TIME) AS hour_of_day,
        SUM(od.quantity) AS pizzas_sold
    FROM order_details od 
    LEFT JOIN orders o 
        ON od.order_id = o.order_id
    GROUP BY o.date, EXTRACT(HOUR FROM o.time::TIME)
) t
GROUP BY hour_of_day
ORDER BY avg_pizzas DESC;


-- Q3: Seating occupation per hour 
-- Assumes 10 tables with 4 seats each (40 seats total).
-- One order = one table occupied.

WITH hourly_per_day AS (
    SELECT
        o.date,
        EXTRACT(HOUR FROM o.time::TIME) AS hour_of_day,
        COUNT(DISTINCT o.order_id) AS tables_occupied
    FROM orders o
    GROUP BY o.date, EXTRACT(HOUR FROM o.time::TIME)
)
SELECT
    hour_of_day,
    ROUND(AVG(tables_occupied), 2) AS avg_tables_occupied,
    ROUND((AVG(tables_occupied) / 10) * 100, 2) AS table_occupation_pct,
    ROUND((AVG(tables_occupied) * 4 / 40) * 100, 2) AS seat_occupation_pct
FROM hourly_per_day
GROUP BY hour_of_day
ORDER BY avg_tables_occupied desc;


-- Q4: Which pizzas are the best and worst sellers?
-- Displays total quantity sold per pizza type.

SELECT 
    pt.name AS pizza_name, 
    SUM(od.quantity) AS pizzas_sold
FROM order_details od 
LEFT JOIN pizzas p
    ON od.pizza_id = p.pizza_id
LEFT JOIN pizza_types pt 
    ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY pizzas_sold DESC;


-- Q5: What is the most popular pizza category?
-- Helps understand which type of pizza sells most.

SELECT 
    pt.category AS pizza_category,
    SUM(od.quantity) AS pizzas_sold
FROM order_details od
LEFT JOIN pizzas p 
    ON od.pizza_id = p.pizza_id 
LEFT JOIN pizza_types pt 
    ON pt.pizza_type_id = p.pizza_type_id
GROUP BY pizza_category
ORDER BY pizzas_sold DESC;


-- Q6: What is the most popular pizza size?
-- Shows which pizza size has the highest sales volume.

SELECT 
    p.size AS pizza_size,
    SUM(quantity) AS times_sold
FROM order_details od
LEFT JOIN pizzas p 
    ON od.pizza_id = p.pizza_id 
GROUP BY p.size
ORDER BY times_sold DESC;


-- Q7: What is the average number of pizzas per order?
-- Calculates the true average pizzas sold per order.

SELECT ROUND(AVG(pizza_count), 2) AS avg_pizza_per_order
FROM (
    SELECT od.order_id, SUM(quantity) AS pizza_count
    FROM order_details od
    GROUP BY od.order_id
) aux_table;


-- Q8: What is the average order value?
-- Calculates the average amount spent per pizza.

SELECT ROUND(AVG(price_per_pizza_type)::numeric, 2) AS avg_order_value
FROM (
    SELECT od.order_id, od.quantity * p.price AS price_per_pizza_type
    FROM order_details od 
    LEFT JOIN pizzas p 
        ON od.pizza_id = p.pizza_id
) aux_table;


-- Q9: Which pizzas are commonly bought together?
-- Finds pairs of pizzas frequently sold in the same order.
-- Uses < to avoid duplicate pairs like (A,B) and (B,A).

SELECT 
    pt.name AS pizza_1,
    pt2.name AS pizza_2,
    SUM(LEAST(od.quantity, od2.quantity)) AS times_sold_together
FROM order_details od
JOIN order_details od2
    ON od.order_id = od2.order_id
   AND od.pizza_id < od2.pizza_id
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizzas p2 ON od2.pizza_id = p2.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
JOIN pizza_types pt2 ON p2.pizza_type_id = pt2.pizza_type_id
GROUP BY pt.name, pt2.name
ORDER BY times_sold_together DESC
LIMIT 10;


-- Q10: Which pizza combinations generate the highest revenue when sold together?
-- Finds top pizza pairings by total revenue generated across all orders.

WITH pizza_pairs AS (
    SELECT 
        od1.order_id,
        p1.pizza_type_id AS pizza_type_1,
        p2.pizza_type_id AS pizza_type_2,
        SUM(od1.quantity * p1.price + od2.quantity * p2.price) AS pair_revenue
    FROM order_details od1
    JOIN order_details od2 
        ON od1.order_id = od2.order_id
       AND od1.pizza_id < od2.pizza_id
    JOIN pizzas p1 ON od1.pizza_id = p1.pizza_id
    JOIN pizzas p2 ON od2.pizza_id = p2.pizza_id
    GROUP BY od1.order_id, p1.pizza_type_id, p2.pizza_type_id
)
SELECT 
    pt1.name AS pizza_1,
    pt2.name AS pizza_2,
    ROUND(SUM(pair_revenue)::numeric, 2) AS total_revenue
FROM pizza_pairs pp
JOIN pizza_types pt1 ON pp.pizza_type_1 = pt1.pizza_type_id
JOIN pizza_types pt2 ON pp.pizza_type_2 = pt2.pizza_type_id
GROUP BY pt1.name, pt2.name
ORDER BY total_revenue DESC
LIMIT 10;


/*
=========================================================
End of SQL Script
This file answers 10 key business questions about the pizza sales 
performance of a restaurant.
Author: Gabriel Roca
=========================================================
*/


