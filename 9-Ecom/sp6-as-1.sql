
-- Q1-1: Top 5 items generating the maximum revenue
SELECT title, product_type, ROUND(SUM(total_sale),2) AS Sum_sale, ROUND(AVG(total_sale),2) AS Avg_sale 
FROM summary2
GROUP BY title, product_type
ORDER BY Sum_sale DESC, Avg_sale DESC
LIMIT 5;

-- Q1-2: Top 5 Countrywise maximum revenue generation 
SELECT Country, ROUND(SUM(total_sale),2) AS Sum_sale, ROUND(AVG(total_sale),2) AS Avg_sale 
FROM summary2
GROUP BY Country
ORDER BY Sum_sale DESC, Avg_sale DESC, Country ASC
LIMIT 5;

-- Q1-3: Countrywise items revenue generation 
SELECT Country, product_type, ROUND(SUM(total_sale),2) AS Sum_sale, ROUND(AVG(total_sale),2) AS Avg_sale 
FROM summary2
GROUP BY Country, product_type
ORDER BY Sum_sale DESC, Avg_sale DESC;

-- Q2-1: How is the customer buying pattern. (Yearly)
-- (I would be interested to know weekly, monthly, daily etc.)
SELECT YEAR(invoice_date) AS Year, product_type, ROUND(SUM(total_sale),2) AS sale
FROM summary2
WHERE YEAR(invoice_date)= 2018 OR YEAR(invoice_date)= 2019
GROUP BY YEAR(invoice_date), product_type
ORDER BY YEAR(invoice_date) ASC;

-- Q2-2: How is the customer buying pattern. (Monthly)
-- (I would be interested to know weekly, monthly, daily etc.)
SELECT MONTH(invoice_date) AS Month, product_type, ROUND(SUM(total_sale),2) AS sale
FROM summary2
WHERE YEAR(invoice_date)= 2018 OR YEAR(invoice_date)= 2019
GROUP BY MONTH(invoice_date), product_type
ORDER BY MONTH(invoice_date) ASC, sale DESC;

-- Q2-3: How is the customer buying pattern. (Weekly)
-- (I would be interested to know weekly, monthly, daily etc.)
SELECT WEEK(invoice_date) AS Week, product_type, ROUND(SUM(total_sale),2) AS sale
FROM summary2
WHERE YEAR(invoice_date)= 2018 OR YEAR(invoice_date)= 2019
GROUP BY WEEK(invoice_date), product_type
ORDER BY WEEK(invoice_date) ASC, sale DESC;

-- Q2-4: How is the customer buying pattern. (Monthly and weekly)
-- (I would be interested to know weekly, monthly, daily etc.)
SELECT MONTH(invoice_date) AS Month, WEEK(invoice_date) AS Week, product_type, ROUND(SUM(total_sale),2) AS sale
FROM summary2
WHERE YEAR(invoice_date)= 2018 OR YEAR(invoice_date)= 2019
GROUP BY MONTH(invoice_date), WEEK(invoice_date), product_type
ORDER BY MONTH(invoice_date)ASC, WEEK(invoice_date) ASC, sale DESC;

-- Q3-1: Hourly buying pattern
SELECT invoice_time, ROUND(SUM(total_sale),2) AS sale
FROM summary2
WHERE YEAR(invoice_date)= 2018 OR YEAR(invoice_date)= 2019
GROUP BY invoice_time
ORDER BY sale DESC;

-- Q3-2: Hourly buying pattern w.r.t weekday
SELECT DAYNAME(invoice_date) AS Weekday, invoice_time, ROUND(SUM(total_sale),2) AS sale
FROM summary2
WHERE YEAR(invoice_date)= 2018 OR YEAR(invoice_date)= 2019
AND DAYNAME(invoice_date) IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday')
GROUP BY DAYNAME(invoice_date), invoice_time
ORDER BY sale DESC;

-- Q4-1: Weekly highest sale
SELECT WEEK(invoice_date) AS Week, DAYNAME(invoice_date) AS Weekday, product_type, ROUND(SUM(total_sale),2) AS sale
FROM summary2
WHERE YEAR(invoice_date)= 2018 OR YEAR(invoice_date)= 2019
GROUP BY WEEK(invoice_date), DAYNAME(invoice_date), product_type
ORDER BY sale DESC, WEEK(invoice_date), DAYNAME(invoice_date) ASC;

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


SELECT MONTH(invoice_date) AS Month, COUNT(CustomerID) AS Customer_ID
FROM summary2
WHERE YEAR(invoice_date)= 2019
GROUP BY MONTH(invoice_date)
ORDER BY Customer_ID DESC;
-- LIMIT 5;

SELECT MONTH(invoice_date) AS Month, COUNT(CustomerID) AS Customer_count, ROUND(AVG(total_sale),2) AS Avg_Sale
FROM summary2
WHERE YEAR(invoice_date)= 2019
GROUP BY MONTH(invoice_date)
ORDER BY Customer_ID DESC, Avg_Sale;