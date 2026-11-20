# Pizza Sales Analysis — Business Report

**Data period:** 2015 | **Tools:** MySQL | **Tables:** orders, order_details, pizzas, pizza_types

## Executive summary
Analysis of 21,350 orders and 48,620 order-detail records, comprising 49,574 pizzas sold. Revenue calculated as quantity × unit price totals **$817,860.05**.

## KPIs
| KPI | Value |
|---|---:|
| Total orders | 21,350 |
| Total pizzas sold | 49,574 |
| Revenue | $817,860.05 |
| Average pizzas per active sales day | 138.47 |
| Pizza types | 32 |
| Pizza variants | 96 |

## Findings
- Large pizzas lead sales by quantity: **18,956**.
- Classic Deluxe Pizza is the top seller by units: **2,453**.
- Classic category leads revenue share: **26.91%**.
- Thai Chicken Pizza leads pizza-type revenue: **$43,434.25**.
- Noon is the busiest order hour: **2,520 orders**.

## Recommendations
1. Align kitchen staffing and inventory with lunchtime and evening demand.
2. Monitor stock for high-volume Large pizzas and Classic Deluxe Pizza.
3. Feature high-revenue pizza types in targeted promotions, while measuring profitability.
4. Review daily revenue and category mix using recurring SQL reporting.

## Methodology and limitations
Revenue is gross sales, not profit. Daily average uses 358 dates with recorded sales. Source SQL has naming differences (`order_date`/`order_time` versus CSV `date`/`time`) and a few question/query mismatches; `sql/pizza_sales_analysis.sql` is a corrected version aligned to the supplied CSV schema. Results above were calculated from the supplied project dataset in earlier project materials.