# 📊 Customer Orders & Revenue Analysis — SQL Project

## 📌 Problem Statement

A mid-sized B2B retail company sells office and electronics products across multiple Indian cities. The sales team wants to understand **how revenue is distributed, which customers and products drive the most value, and where operational inefficiencies (like cancellations) are costing the business money.**

As a Business Analyst, the goal is to query the order management database and surface insights that can guide decisions in sales, marketing, and operations.

---

## 🎯 Business Questions Answered

| # | Question | Business Purpose |
|---|----------|-----------------|
| 1 | Order count by status | Track order health |
| 2 | Total revenue (completed orders) | Top-line performance |
| 3 | Monthly order volume trend | Seasonal planning |
| 4 | Top 5 customers by revenue | Retention prioritization |
| 5 | Revenue by customer segment | Segment strategy |
| 6 | Repeat buyers | Loyalty measurement |
| 7 | Best-selling products by quantity | Inventory planning |
| 8 | Revenue by product category | Portfolio analysis |
| 9 | Average discount per category | Margin monitoring |
| 10 | Cancellation rate by segment | Operational quality |
| 11 | Revenue lost to cancellations | Financial impact |
| 12 | City-wise order distribution | Regional planning |

---

## 🗃️ Database Schema

```
customers   → customer_id, customer_name, city, segment, join_date
products    → product_id, product_name, category, unit_price
orders      → order_id, customer_id, order_date, status
order_items → item_id, order_id, product_id, quantity, discount_pct
```

**Entity Relationships:**
- One **customer** can place many **orders**
- One **order** can contain many **order items**
- Each **order item** references one **product**

---

## 🛠️ SQL Concepts Used

- `JOIN` (INNER JOIN across 3–4 tables)
- `GROUP BY` with aggregations (`SUM`, `COUNT`, `AVG`, `ROUND`)
- `HAVING` for post-aggregation filtering
- `CASE WHEN` for conditional aggregation
- `STRFTIME` for date-based grouping
- Subquery-style filtering via `WHERE status = 'Completed'`

---

## 📁 Files in This Project

| File | Description |
|------|-------------|
| `analysis_queries.sql` | All 12 SQL queries with comments |
| `customers.csv` | Sample customer master data (10 records) |
| `products.csv` | Product catalogue with pricing |
| `orders.csv` | Order header data with status |
| `order_items.csv` | Line-item level order details |

---

## ▶️ How to Run

1. Open **DB Browser for SQLite** (free tool) or any SQL client
2. Create a new database and import all 4 CSV files as tables
3. Open `analysis_queries.sql` and run queries section by section
4. Each query has a comment explaining its **business purpose**

> The queries are also compatible with **MySQL** and **PostgreSQL** with minor date function adjustments (`DATE_FORMAT` for MySQL, `TO_CHAR` for PostgreSQL).

---

## 💡 Key Insights (Sample Findings)

- **Corporate segment** generates the highest revenue despite fewer customers
- **Electronics** is the top revenue category, but also receives the highest average discounts
- **Repeat buyers** account for a disproportionate share of total revenue — a strong case for loyalty programs
- Cancellations result in measurable revenue loss — worth investigating root causes by segment

---

## 👤 About

**[Your Name]**  
Business Analyst | SQL • Excel • Power BI  
[LinkedIn Profile URL] | [GitHub Profile URL]
