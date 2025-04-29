use practice_db;

# SHOW ALL COLUMNS AND ROWS?
select * FROM online_sales_dataset;


#1 Use EXTRACT(MONTH FROM order_date) for month.
SELECT 
    EXTRACT(MONTH FROM InvoiceDate ) AS order_month
FROM 
    online_sales_dataset
GROUP BY 
    EXTRACT(MONTH FROM InvoiceDate)
ORDER BY 
    order_month;

#2 GROUP BY year/month IN SQL?    
SELECT 
EXTRACT(YEAR FROM InvoiceDate) AS order_year,
EXTRACT(MONTH FROM InvoiceDate) AS order_month
FROM 
    online_sales_dataset
WHERE 
    InvoiceDate BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY 
    order_year, order_month;
    
# 3 use SUM() for revenue?
select SUM((Quantity * UnitPrice) * (1 - Discount) + COALESCE(ShippingCost, 0)) AS total_revenue
FROM 
    online_sales_dataset;

#COUNT(DISTINCT customerID for volume.?
SELECT COUNT(DISTINCT CustomerID ) AS order_volume
FROM 
    online_sales_dataset;


#Limit results for specific time periods?
SELECT * FROM online_sales_dataset #they show results only selected time period
WHERE 
    InvoiceDate BETWEEN '2020-01-01' AND '2020-12-31';
    
#or
SELECT * FROM online_sales_dataset 
WHERE 
    InvoiceDate BETWEEN '2020-01-01' AND '2020-12-31'
limit 5;
