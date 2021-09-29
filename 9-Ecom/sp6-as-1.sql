use amazon_ASIA;

-- Top 5 items generating the maximum revenue
SELECT title, Country, product_type, rating, review_count, ROUND(SUM(total_sale),0) AS Sum_sale 
FROM summary2
-- WHERE Country != 'Germany' 
-- WHERE product_type = 'mouse'
-- 'smartphone', 'processor', 'dslr camera', 'monitor', 'keyboard', 'mouse'
GROUP BY title, Country, product_type, rating, review_count
ORDER BY Sum_sale DESC
LIMIT 5;

-- Q1-2: Top 5 Countrywise maximum revenue generation 
SELECT continent, sub_region, Country, ROUND(SUM(total_sale),2) AS Sum_sale
FROM summary2
GROUP BY continent, sub_region, Country
ORDER BY Sum_sale DESC, Country ASC;
-- LIMIT 5;

-- Q1-3: Countrywise items revenue generation 
SELECT Country, ROUND(SUM(total_sale),2) AS Sum_sale 
FROM summary2
WHERE Country != 'Germany' AND continent = 'Europe'
GROUP BY Country
ORDER BY Sum_sale DESC
LIMIT 5;

-- Q2-1: How is the customer buying pattern. (Yearly)
-- (I would be interested to know weekly, monthly, daily etc.)
SELECT YEAR(invoice_date) AS Year, product_type, ROUND(SUM(total_sale),2) AS sale
FROM summary2
WHERE YEAR(invoice_date)= 2018 OR YEAR(invoice_date)= 2019 AND continent = 'Europe'
GROUP BY YEAR(invoice_date), product_type
ORDER BY YEAR(invoice_date) ASC;

-- Q2-2: How is the customer buying pattern. (Monthly)
-- (I would be interested to know weekly, monthly, daily etc.)
SELECT MONTH(invoice_date) AS Month, MONTHNAME(invoice_date) AS Month_name, product_type, ROUND(SUM(total_sale),2) AS sale
FROM summary2
WHERE YEAR(invoice_date)= 2019 AND continent = 'Europe'
GROUP BY MONTH(invoice_date), MONTHNAME(invoice_date), product_type
ORDER BY MONTH(invoice_date) ASC, sale DESC;

-- Q2-3: How is the customer buying pattern. (Weekly)
-- (I would be interested to know weekly, monthly, daily etc.)
SELECT YEAR(invoice_date) AS Year, WEEK(invoice_date) AS Week, product_type, ROUND(SUM(total_sale),2) AS sale
FROM summary2
WHERE YEAR(invoice_date)= 2018 OR YEAR(invoice_date)= 2019
GROUP BY YEAR(invoice_date), WEEK(invoice_date), product_type
ORDER BY YEAR(invoice_date), WEEK(invoice_date) ASC, sale DESC;

-- Q2-4: How is the customer buying pattern. (Monthly and weekly)
-- (I would be interested to know weekly, monthly, daily etc.)
SELECT MONTHNAME(invoice_date) AS Month, WEEK(invoice_date) AS Week, product_type, ROUND(SUM(total_sale),2) AS sale
FROM summary2
WHERE YEAR(invoice_date)= 2019
GROUP BY MONTHNAME(invoice_date), WEEK(invoice_date), product_type
ORDER BY MONTHNAME(invoice_date) DESC, WEEK(invoice_date) ASC, sale DESC;

-- Q3-1: Hourly buying pattern
SELECT invoice_time, product_type, ROUND(SUM(total_sale),2) AS sale
FROM summary2
WHERE YEAR(invoice_date)= 2019 AND continent = 'Europe'
GROUP BY invoice_time, product_type
ORDER BY invoice_time ASC, sale DESC;

-- Q3-2: Hourly buying pattern w.r.t weekday
SELECT DAYNAME(invoice_date) AS Weekday, invoice_time, ROUND(SUM(total_sale),2) AS sale
FROM summary2
WHERE YEAR(invoice_date)= 2019
AND DAYNAME(invoice_date) IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday')
GROUP BY DAYNAME(invoice_date), invoice_time
ORDER BY invoice_time ASC, sale DESC;

-- Q4-1: Weekly highest sale
SELECT WEEKDAY(invoice_date) AS day, DAYNAME(invoice_date) AS Weekday, product_type, ROUND(SUM(total_sale),2) AS sale
FROM summary2
WHERE YEAR(invoice_date)= 2019 AND continent = 'Europe'
GROUP BY WEEKDAY(invoice_date), DAYNAME(invoice_date), product_type
ORDER BY WEEKDAY(invoice_date) ASC, sale;

-- Q4-2: Monthly highest sale
SELECT MONTH(invoice_date) AS Month, product_type, ROUND(SUM(total_sale),2) AS sale
FROM summary2
WHERE YEAR(invoice_date)= 2018 OR YEAR(invoice_date)= 2019
GROUP BY MONTH(invoice_date), product_type
ORDER BY sale DESC, MONTH(invoice_date);

-- Q5-1: What do you think about the customers? Are they individuals or wholesalers?
SELECT product_type, Quantity, price, ROUND(SUM(total_sale),2) AS sale
FROM summary2
GROUP BY product_type, Quantity, price
ORDER BY Quantity DESC, sale DESC;

-- Q6-1: Countrywise Highest number of orders
SELECT Country, SUM(Quantity) AS Quantity
FROM summary2
GROUP BY Country
ORDER BY Quantity DESC;

-- Q6-2: Countrywise Highest money spent
SELECT Country, ROUND(SUM(total_sale),2) AS sale
FROM summary2
GROUP BY Country
ORDER BY sale DESC
LIMIT 5;

SELECT YEAR(invoice_date) AS year, QUARTER(invoice_date) AS qt, ROUND(SUM(total_sale),2) AS sale
FROM summary2
WHERE YEAR(invoice_date)= 2019 AND continent='Europe'
GROUP BY year, qt
ORDER BY QUARTER(invoice_date);


SELECT YEAR(invoice_date) AS Year, title, InvoiceNo, CustomerID, Country
FROM summary2
WHERE YEAR(invoice_date)= 2019 AND continent = 'Europe'
GROUP BY YEAR(invoice_date), title, InvoiceNo, CustomerID, Country
ORDER BY Country;
-- LIMIT 5;

-- KPI (Purchase frequency) = Total # of orders/Total # of unique customers
SELECT COUNT(DISTINCT InvoiceNo) AS Customer_Invoice, COUNT(DISTINCT CustomerID) AS Customer_ID
FROM summary2
WHERE YEAR(invoice_date)= 2019 AND continent = 'Europe' AND CustomerID != 'Null';

-- KPI (Average Order Value) = Revenue/Total # of unique orders
SELECT COUNT(DISTINCT InvoiceNo) AS Customer_Invoice, COUNT(DISTINCT CustomerID) AS Customer_ID, ROUND(SUM(total_sale),2) AS Sum_Sale
FROM summary2
WHERE YEAR(invoice_date)= 2019 AND continent = 'Europe' AND CustomerID != 'Null'
ORDER BY Sum_Sale DESC;

-- KPI (Average Order Value) = Revenue/Total # of unique orders
SELECT DISTINCT CustomerID, COUNT(DISTINCT InvoiceNo) AS Invoice
-- ROUND(SUM(total_sale),2) AS Sum_Sale
FROM summary2
WHERE YEAR(invoice_date)= 2019 AND continent = 'Europe' AND CustomerID != 'Null'
GROUP BY CustomerID
ORDER BY Invoice DESC;