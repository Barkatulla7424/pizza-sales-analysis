# Pizza Sales Analysis | MySQL

An end-to-end SQL portfolio project exploring pizza sales performance, customer ordering patterns, product popularity, and revenue trends using **MySQL** and a relational dataset.

## Project overview

This project answers **13 business questions** at basic, intermediate, and advanced SQL levels. It demonstrates how transactional sales data can be transformed into actionable insights for product and operational decisions.

### Dataset snapshot

| Metric | Value |
| --- | ---: |
| Sales period | 2015 |
| Total orders | 21,350 |
| Order-detail records | 48,620 |
| Pizzas sold | 49,574 |
| Total revenue | $817,860.05 |
| Pizza types | 32 |
| Pizza variants | 96 |
| Average pizzas sold per active day | 138.47 |

## Relational data model

Four connected tables:

- **orders:** `order_id`, `date`, `time`
- **order_details:** `order_details_id`, `order_id`, `pizza_id`, `quantity`
- **pizzas:** `pizza_id`, `pizza_type_id`, `size`, `price`
- **pizza_types:** `pizza_type_id`, `name`, `category`, `ingredients`

Relationships: `orders.order_id` → `order_details.order_id`; `order_details.pizza_id` → `pizzas.pizza_id`; `pizzas.pizza_type_id` → `pizza_types.pizza_type_id`.

## SQL techniques demonstrated

| Technique | How it is used in this project |
| --- | --- |
| **INNER JOIN / LEFT JOIN** | Combine order, line-item, pizza, and product-category information |
| **Aggregation: COUNT, SUM, AVG** | Calculate order volume, units sold, revenue, and daily averages |
| **GROUP BY** | Analyze performance by pizza type, size, category, date, and hour |
| **ORDER BY and LIMIT** | Identify top-selling and highest-revenue products |
| **Date/time functions: HOUR, DAY** | Study hourly demand and daily sales patterns |
| **CASE expressions** | Convert 24-hour order times into readable AM/PM labels |
| **Numeric and string functions: ROUND, CONCAT** | Format revenue totals and percentage contributions |
| **Common Table Expressions (WITH / CTEs)** | Organize multi-stage calculations for daily averages, category revenue, and rankings |
| **Window functions: SUM() OVER()** | Calculate revenue share against overall sales and running cumulative revenue |
| **Window functions: PARTITION BY and ORDER BY** | Perform within-category rankings and chronological running totals |
| **DENSE_RANK() OVER()** | Rank pizza types by revenue within each category, including ties |
| **Calculated expressions** | Compute line-item sales using `quantity * price` |

These techniques are demonstrated in the project's SQL analysis rather than being a generic list of MySQL features.

## Business questions

**Basic:** total orders, total revenue, highest-priced pizza, most common pizza size, and top five pizzas by quantity.

**Intermediate:** category-wise units sold, hourly order distribution, category breakdown, average daily pizza sales, and top revenue-generating pizza types.

**Advanced:** revenue contribution percentages, cumulative daily revenue, and top-three revenue rankings within each pizza category.

## Key findings

- **Large** was the most popular size, with **18,956 pizzas sold**.
- **Classic Deluxe Pizza** led by quantity, with **2,453 units**.
- **Thai Chicken Pizza** generated the highest revenue by pizza type: **$43,434.25**.
- The **Classic** category generated approximately **26.91%** of total revenue.
- **12 PM** was the busiest order hour, with **2,520 orders**.

## Business recommendations

- Plan staffing and preparation capacity around the midday ordering peak.
- Prioritize stock planning for high-demand sizes and pizza types.
- Monitor high-revenue products separately from high-volume products.
- Use category-level sales contribution and daily revenue trends to guide promotions and inventory decisions.

## Repository structure

```text
pizza-sales-analysis/
├── data/
│   ├── orders.csv
│   ├── order_details.csv
│   ├── pizzas.csv
│   └── pizza_types.csv
├── sql/
│   └── pizza_sales_analysis.sql
├── reports/
│   └── Pizza_Sales_Analysis_Report.md
└── README.md
```

## How to explore the analysis

1. Import the four CSV files from `data/` into MySQL tables with matching names.
2. Ensure the order date and time columns match the SQL script's schema.
3. Run the queries in [sql/pizza_sales_analysis.sql](sql/pizza_sales_analysis.sql).
4. Read the [analysis report](reports/Pizza_Sales_Analysis_Report.md) for findings and recommendations.

**Tools:** MySQL, SQL, CSV datasets.

**Scope note:** This repository documents a MySQL-based analysis; it does not claim a Power BI dashboard or Python pipeline.
