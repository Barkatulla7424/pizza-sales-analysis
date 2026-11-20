# Pizza Sales Analysis | MySQL

A portfolio project analyzing pizza sales, product demand, and revenue performance using **MySQL** and four relational CSV tables.

## Project overview
- **Period:** 2015
- **Orders:** 21,350
- **Order-detail records:** 48,620
- **Pizza variants:** 96
- **Pizza types:** 32
- **Total pizzas sold:** 49,574
- **Revenue:** $817,860.05
- **Average pizzas per active sales day:** 138.47

## Data model
`orders` (order_id, date, time) → `order_details` (order_details_id, order_id, pizza_id, quantity) → `pizzas` (pizza_id, pizza_type_id, size, price) → `pizza_types` (pizza_type_id, name, category, ingredients).

## Analysis
13 SQL business questions across basic (5), intermediate (5), and advanced (3) levels. Topics include total orders, revenue, popular pizza sizes, top sellers, hourly demand, category performance, revenue contribution, cumulative revenue, and category rankings.

## Key insights
- Large pizzas lead by volume (18,956 units).
- Classic Deluxe Pizza is the top-selling type by quantity (2,453 units).
- Classic category contributes the largest revenue share (26.91%).
- Thai Chicken Pizza leads revenue by type ($43,434.25).
- Noon is the peak order hour (2,520 orders).

## SQL techniques
JOIN, GROUP BY, SUM, COUNT, AVG, CTE, DENSE_RANK, and window functions.

## Source files and report
The source files are `orders.csv`, `order_details.csv`, `pizzas.csv`, `pizza_types.csv`, and the MySQL SQL script. A PDF report documents KPIs, findings, and recommendations. These will be linked here when uploaded.

**Note:** Some supplied SQL statements use column names such as `order_date`/`order_time` while the uploaded CSV has `date`/`time`. Align names during MySQL import or update the SQL accordingly. The original question list and SQL also have a few mismatches to validate.
