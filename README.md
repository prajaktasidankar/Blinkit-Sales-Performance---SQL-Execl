
# 🛒 Blinkit Grocery Sales Analysis Using SQL (PostgreSQL)

📌 Project Objective  
Analyze a real-world grocery sales dataset from Blinkit to:
- Clean and standardize raw data
- Perform aggregations and calculations
- Extract actionable insights
- Demonstrate SQL capabilities using PostgreSQL


📊 Dataset Overview  
The dataset includes transactional records from grocery outlets and contains the following key fields
- `Item_Identifier` – Unique product ID  
- `Item_Fat_Content` – Fat type: Low Fat, Regular, etc.  
- `Item_Type` – Food category (e.g., Dairy, Bakery)  
- `Item_MRP` – Maximum retail price  
- `Outlet_Identifier` – Store ID  
- `Outlet_Location_Type` – Tier of city (Tier 1, 2, 3)  
- `Outlet_Type` – Store category (e.g., Supermarket Type1)  
- `Outlet_Size` – Store size (Small, Medium, High)  
- `Total_Sales` – Sales value (derived)

❓ Key Questions Answered  

🔸 Which outlet types generate the highest total sales?  
🔸 How is fat content distributed across different outlet locations?  
🔸 Which item types contribute most to the revenue?  
🔸 What is the percentage share of sales from each outlet size?  
🔸 Are Tier 1 outlets more profitable than Tier 2 or Tier 3?  
🔸 Which product categories are underperforming or need optimization?

🧠 SQL Concepts Used  

✅ Data Cleaning:  
  - `TRIM()`, `LOWER()`, `REPLACE()`, `CASE`

✅ Null & Zero Handling:  
  - `COALESCE()`, `NULLIF()`, `CASE WHEN`

✅ Aggregation Functions:  
  - `SUM()`, `AVG()`, `COUNT()`

✅ Conditional Aggregation:  
  - `FILTER (WHERE ...)` for grouped conditions

✅ Window Functions:  
  - `OVER()` to calculate sales percentages and totals

✅ Sorting & Grouping:  
  - `GROUP BY`, `ORDER BY`

✅ PostgreSQL Compatibility:  
  - Avoided `PIVOT`, used PostgreSQL-style conditionals and filters

🛠 Tools Used  
- PostgreSQL  
- pgAdmin4  
- Google Sheets (for previewing dataset)  
- VS Code

Dashboard Preview: https://github.com/prajaktasidankar/Blinkit-Sales-Performance---SQL-Execl/blob/main/Blinkit_Excel_Dashboard.png
