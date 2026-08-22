-- =====================================================
-- E-COMMERCE SALES ANALYSIS PROJECT
-- Tool: MySQL
-- Dataset: E-Commerce Sales Dataset
-- =====================================================

-- =====================================================
-- 1. CREATE DATABASE
-- =====================================================

CREATE DATABASE e_commerce_db;

USE e_commerce_db;


-- =====================================================
-- 2. CREATE TABLE
-- =====================================================

CREATE TABLE ecommerce_sales (
    Order_ID VARCHAR(20),
    Order_Date DATE,
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    Gender VARCHAR(20),
    Age INT,
    City VARCHAR(50),
    Category VARCHAR(50),
    Product_Name VARCHAR(100),
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Sales DECIMAL(12,2),
    Discount DECIMAL(12,2),
    Profit DECIMAL(12,2),
    Payment_Method VARCHAR(50));
-- =====================================================
-- 3. BASIC DATA EXPLORATION
-- =====================================================

-- View all records
SELECT *
FROM ecommerce_sales;


-- Check total number of orders
SELECT COUNT(*) AS total_orders
FROM ecommerce_sales;


-- Check total quantity sold
SELECT SUM(Quantity) AS total_quantity
FROM ecommerce_sales;


-- Check total sales
SELECT SUM(Sales) AS total_sales
FROM ecommerce_sales;


-- Check total profit
SELECT SUM(Profit) AS total_profit
FROM ecommerce_sales;


-- Check average sales per order
SELECT AVG(Sales) AS average_sales_per_order
FROM ecommerce_sales;


-- Check average profit per order
SELECT AVG(Profit) AS average_profit_per_order
FROM ecommerce_sales;
-- =====================================================
-- 4. OVERALL BUSINESS KPIs
-- =====================================================

-- Total Sales
SELECT
    SUM(Sales) AS total_sales
FROM ecommerce_sales;


-- Total Profit
SELECT
    SUM(Profit) AS total_profit
FROM ecommerce_sales;


-- Total Quantity Sold
SELECT
    SUM(Quantity) AS total_quantity_sold
FROM ecommerce_sales;


-- Total Orders
SELECT
    COUNT(Order_ID) AS total_orders
FROM ecommerce_sales;


-- Average Order Value
SELECT
    SUM(Sales) / COUNT(Order_ID) AS average_order_value
FROM ecommerce_sales;


-- Average Profit per Order
SELECT
    AVG(Profit) AS average_profit_per_order
FROM ecommerce_sales;


-- Total Discount
SELECT
    SUM(Discount) AS total_discount
FROM ecommerce_sales;


-- Average Discount per Order
SELECT
    AVG(Discount) AS average_discount_per_order
FROM ecommerce_sales;


-- Average Unit Price
SELECT
    AVG(Unit_Price) AS average_unit_price
FROM ecommerce_sales;


-- Overall Profit Margin
SELECT
    SUM(Profit) / SUM(Sales) * 100 AS overall_profit_margin
FROM ecommerce_sales;
-- =====================================================
-- 5. CATEGORY ANALYSIS
-- =====================================================

-- Sales by Category
SELECT
    Category,
    SUM(Sales) AS total_sales
FROM ecommerce_sales
GROUP BY Category
ORDER BY total_sales DESC;


-- Profit by Category
SELECT
    Category,
    SUM(Profit) AS total_profit
FROM ecommerce_sales
GROUP BY Category
ORDER BY total_profit DESC;


-- Sales, Profit and Profit Margin by Category
SELECT
    Category,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit,
    SUM(Profit) / SUM(Sales) * 100 AS profit_margin
FROM ecommerce_sales
GROUP BY Category
ORDER BY total_sales DESC;
-- =====================================================
-- 6. CITY ANALYSIS
-- =====================================================

-- Sales by City
SELECT
    City,
    SUM(Sales) AS total_sales
FROM ecommerce_sales
GROUP BY City
ORDER BY total_sales DESC;


-- Profit by City
SELECT
    City,
    SUM(Profit) AS total_profit
FROM ecommerce_sales
GROUP BY City
ORDER BY total_profit DESC;


-- Sales, Profit and Profit Margin by City
SELECT
    City,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit,
    SUM(Profit) / SUM(Sales) * 100 AS profit_margin
FROM ecommerce_sales
GROUP BY City
ORDER BY total_sales DESC;
-- =====================================================
-- 7. PAYMENT METHOD ANALYSIS
-- =====================================================

-- Sales by Payment Method
SELECT
    Payment_Method,
    SUM(Sales) AS total_sales
FROM ecommerce_sales
GROUP BY Payment_Method
ORDER BY total_sales DESC;


-- Profit by Payment Method
SELECT
    Payment_Method,
    SUM(Profit) AS total_profit
FROM ecommerce_sales
GROUP BY Payment_Method
ORDER BY total_profit DESC;


-- Sales, Profit and Profit Margin by Payment Method
SELECT
    Payment_Method,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit,
    SUM(Profit) / SUM(Sales) * 100 AS profit_margin
FROM ecommerce_sales
GROUP BY Payment_Method
ORDER BY total_sales DESC;
-- =====================================================
-- 8. PRODUCT ANALYSIS
-- =====================================================

-- Sales by Product
SELECT
    Product_Name,
    SUM(Sales) AS total_sales
FROM ecommerce_sales
GROUP BY Product_Name
ORDER BY total_sales DESC;


-- Profit by Product
SELECT
    Product_Name,
    SUM(Profit) AS total_profit
FROM ecommerce_sales
GROUP BY Product_Name
ORDER BY total_profit DESC;


-- Sales, Profit and Profit Margin by Product
SELECT
    Product_Name,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit,
    SUM(Profit) / SUM(Sales) * 100 AS profit_margin
FROM ecommerce_sales
GROUP BY Product_Name
ORDER BY total_sales DESC;


-- Top 5 Products by Sales
SELECT
    Product_Name,
    SUM(Sales) AS total_sales
FROM ecommerce_sales
GROUP BY Product_Name
ORDER BY total_sales DESC
LIMIT 5;
-- =====================================================
-- 9. CUSTOMER ANALYSIS
-- =====================================================

-- Sales by Customer
SELECT
    Customer_Name,
    SUM(Sales) AS total_sales
FROM ecommerce_sales
GROUP BY Customer_Name
ORDER BY total_sales DESC;


-- Profit by Customer
SELECT
    Customer_Name,
    SUM(Profit) AS total_profit
FROM ecommerce_sales
GROUP BY Customer_Name
ORDER BY total_profit DESC;


-- Top 5 Customers by Sales
SELECT
    Customer_Name,
    SUM(Sales) AS total_sales
FROM ecommerce_sales
GROUP BY Customer_Name
ORDER BY total_sales DESC
LIMIT 5;


-- Number of Orders by Customer
SELECT
    Customer_Name,
    COUNT(Order_ID) AS total_orders
FROM ecommerce_sales
GROUP BY Customer_Name
ORDER BY total_orders DESC;
-- =====================================================
-- 10. CUSTOMER DEMOGRAPHIC ANALYSIS
-- =====================================================

-- Sales by Gender
SELECT
    Gender,
    SUM(Sales) AS total_sales
FROM ecommerce_sales
GROUP BY Gender
ORDER BY total_sales DESC;


-- Profit by Gender
SELECT
    Gender,
    SUM(Profit) AS total_profit
FROM ecommerce_sales
GROUP BY Gender
ORDER BY total_profit DESC;


-- Average Age by Gender
SELECT
    Gender,
    AVG(Age) AS average_age
FROM ecommerce_sales
GROUP BY Gender;


-- Sales by Age
SELECT
    Age,
    SUM(Sales) AS total_sales
FROM ecommerce_sales
GROUP BY Age
ORDER BY total_sales DESC;
-- =====================================================
-- 11. DISCOUNT & PROFITABILITY ANALYSIS
-- =====================================================

-- Total Discount
SELECT
    SUM(Discount) AS total_discount
FROM ecommerce_sales;


-- Average Discount per Order
SELECT
    AVG(Discount) AS average_discount_per_order
FROM ecommerce_sales;


-- Sales and Profit by Discount
SELECT
    Discount,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM ecommerce_sales
GROUP BY Discount
ORDER BY Discount;


-- Average Profit by Discount
SELECT
    Discount,
    AVG(Profit) AS average_profit
FROM ecommerce_sales
GROUP BY Discount
ORDER BY Discount;


-- Profit Margin by Discount
SELECT
    Discount,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit,
    SUM(Profit) / SUM(Sales) * 100 AS profit_margin
FROM ecommerce_sales
GROUP BY Discount
ORDER BY Discount;
-- =====================================================
-- 12. SALES TREND ANALYSIS
-- =====================================================

-- Sales by Year
SELECT
    YEAR(Order_Date) AS sales_year,
    SUM(Sales) AS total_sales
FROM ecommerce_sales
GROUP BY YEAR(Order_Date)
ORDER BY sales_year;


-- Sales by Month
SELECT
    MONTH(Order_Date) AS month_number,
    MONTHNAME(Order_Date) AS month_name,
    SUM(Sales) AS total_sales
FROM ecommerce_sales
GROUP BY MONTH(Order_Date), MONTHNAME(Order_Date)
ORDER BY month_number;


-- Profit by Month
SELECT
    MONTH(Order_Date) AS month_number,
    MONTHNAME(Order_Date) AS month_name,
    SUM(Profit) AS total_profit
FROM ecommerce_sales
GROUP BY MONTH(Order_Date), MONTHNAME(Order_Date)
ORDER BY month_number;


-- Monthly Sales and Profit
SELECT
    MONTH(Order_Date) AS month_number,
    MONTHNAME(Order_Date) AS month_name,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM ecommerce_sales
GROUP BY MONTH(Order_Date), MONTHNAME(Order_Date)
ORDER BY month_number;
-- =====================================================
-- 13. ADVANCED SQL ANALYSIS
-- =====================================================

-- Categorize orders based on sales value
SELECT
    Order_ID,
    Sales,
    CASE
        WHEN Sales >= 30000 THEN 'High Value'
        WHEN Sales >= 15000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS order_value_category
FROM ecommerce_sales;


-- Find products with sales above the average product sales
SELECT
    Product_Name,
    SUM(Sales) AS total_sales
FROM ecommerce_sales
GROUP BY Product_Name
HAVING SUM(Sales) > (
    SELECT AVG(product_sales)
    FROM (
        SELECT
            Product_Name,
            SUM(Sales) AS product_sales
        FROM ecommerce_sales
        GROUP BY Product_Name
    ) AS product_summary
)
ORDER BY total_sales DESC;


-- CTE: Category performance
WITH category_performance AS (
    SELECT
        Category,
        SUM(Sales) AS total_sales,
        SUM(Profit) AS total_profit
    FROM ecommerce_sales
    GROUP BY Category
)
SELECT
    Category,
    total_sales,
    total_profit,
    total_profit / total_sales * 100 AS profit_margin
FROM category_performance
ORDER BY total_sales DESC;


-- Rank products by sales
SELECT
    Product_Name,
    SUM(Sales) AS total_sales,
    RANK() OVER (
        ORDER BY SUM(Sales) DESC
    ) AS sales_rank
FROM ecommerce_sales
GROUP BY Product_Name;


-- Rank cities by total sales
SELECT
    City,
    SUM(Sales) AS total_sales,
    RANK() OVER (
        ORDER BY SUM(Sales) DESC
    ) AS sales_rank
FROM ecommerce_sales
GROUP BY City;
-- =====================================================
-- 14. PROJECT SUMMARY
-- =====================================================

-- Key business findings:
--
-- 1. Total Sales: ₹2,125,750
-- 2. Total Profit: ₹498,061.29
-- 3. Total Orders: 100
-- 4. Total Quantity Sold: 250
-- 5. Average Order Value: ₹21,257.50
-- 6. Overall Profit Margin: approximately 23%
-- 7. Electronics generated the highest category sales.
-- 8. Mangalore generated the highest city sales.
-- 9. UPI generated the highest sales among payment methods.
-- 10. Refrigerator generated the highest product sales.
-- 11. Chennai had the highest city-level profit margin.
-- 12. Pune had the lowest city-level profit margin.
--
-- The analysis demonstrates SQL skills including
-- aggregation, grouping, filtering, subqueries, CTEs,
-- CASE statements, and window functions.