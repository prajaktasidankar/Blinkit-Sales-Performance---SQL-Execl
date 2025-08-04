DROP TABLE IF EXISTS blinkit_data;

CREATE TABLE blinkit_data(
     "Item Fat Content" VARCHAR (20),
     "Item Identifier" VARCHAR (20),
     "Item Type" TEXT,
     "Outlet Establishment Year" INT,
     "Outlet Identifier" VARCHAR (20),
     "Outlet Location" VARCHAR (20),
     "Outlet Size" VARCHAR (20),
     "Outlet Type" TEXT,
     "Item Visibility" NUMERIC(6, 4),
     "Item Weight" NUMERIC(6, 2),
     "Total Sales" NUMERIC(10, 2),
     "Rating" NUMERIC(4, 2)
);

SELECT * FROM blinkit_data;

SELECT COUNT(*) FROM blinkit_data;

---DATA CLEANING----

UPDATE blinkit_data
SET "Item Fat Content" = 
     CASE 
         WHEN "Item Fat Content" IN ('LF', 'low fat') THEN 'Low Fat'
         WHEN "Item Fat Content" = 'reg' THEN 'Regular'
         ELSE "Item Fat Content"
          END;

SELECT DISTINCT ("Item Fat Content") FROM blinkit_data;

---(KPIs)---

--Total Sales--
SELECT CAST(SUM("Total Sales")/ 1000000 AS DECIMAL(10,2)) AS Total_Sales_Millions
FROM blinkit_data;

--Average Sales--
SELECT CAST(AVG("Total Sales") AS INT) AS Avg_Sales
FROM blinkit_data;

--No of Items--
SELECT COUNT(*) AS No_of_Items 
FROM blinkit_data; 

--Avg Rating--
SELECT CAST(AVG("Rating") AS DECIMAL(10,1)) AS Avg_Rating 
FROM blinkit_data;

---Filters---
SELECT CAST(SUM("Total Sales")/ 1000000 AS DECIMAL(10,2)) AS Total_Sales_Millions
FROM blinkit_data
WHERE "Outlet Establishment Year" = 2022;

SELECT CAST(AVG("Total Sales") AS DECIMAL(10,1)) AS Avg_Sales FROM blinkit_data
WHERE "Outlet Establishment Year" = 2022;


--Total Sales by Fat Content--
SELECT "Item Fat Content", 
         CAST(SUM("Total Sales") AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit_data
GROUP BY "Item Fat Content"
ORDER BY Total_Sales DESC;

--Total Sales by Item Type--
SELECT "Item Type", 
         CAST(SUM("Total Sales") AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit_data
GROUP BY "Item Type"
ORDER BY Total_Sales DESC;

--Fat Content by Outlet for Total Sales--
SELECT "Outlet Location",
         COALESCE(SUM("Total Sales") FILTER (WHERE "Item Fat Content" = 'Low Fat'), 0) AS Low_Fat,
		 COALESCE(SUM("Total Sales") FILTER (WHERE "Item Fat Content" = 'Regular'), 0) AS Regular
FROM 
    blinkit_data
GROUP BY
    "Outlet Location"
ORDER BY 
    "Outlet Location";
		 
--Total Sales by Outlet Establishment--
SELECT "Outlet Establishment Year",  
         CAST(SUM("Total Sales") AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit_data
GROUP BY "Outlet Establishment Year"
ORDER BY  "Outlet Establishment Year";

--Percentage of Sales by Outlet Size--
SELECT "Outlet Size",
         CAST(SUM("Total Sales") AS DECIMAL(10,2)) AS Total_Sales,
		 CAST(SUM("Total Sales")*100.0/ SUM(SUM("Total Sales")) OVER() AS DECIMAL(10,2)) AS Sales_Percentage
FROM blinkit_data
GROUP BY "Outlet Size"
ORDER BY  Total_Sales DESC;

--Sales by Outlet Location--
SELECT "Outlet Location",  
         CAST(SUM("Total Sales") AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit_data
GROUP BY "Outlet Location"
ORDER BY  Total_Sales DESC;

--All Metrics by Outlet Type--
SELECT "Outlet Type",  
         CAST(SUM("Total Sales") AS DECIMAL(10,2)) AS Total_Sales,
		 CAST(AVG("Total Sales") AS DECIMAL(10,1)) AS Avg_Sales,
		 COUNT(*) AS No_of_Items,
		 CAST(AVG("Rating") AS DECIMAL(10,2)) AS Avg_Rating,
		 CAST(AVG("Item Visibility") AS DECIMAL(10,2)) AS Item_Visibility
FROM blinkit_data
GROUP BY "Outlet Type"
ORDER BY  Total_Sales DESC;
