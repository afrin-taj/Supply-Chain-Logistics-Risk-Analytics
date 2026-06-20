#Total orders
SELECT COUNT(DISTINCT `Order Id`) AS Total_Orders
FROM supply_chain_data;

#Total sales
SELECT ROUND(SUM(Sales),2) AS Total_Sales
FROM supply_chain_data;

#Top Markets by Revenue
SELECT Market,
ROUND(SUM(Sales),2) AS Revenue
FROM supply_chain_data
GROUP BY Market
ORDER BY Revenue DESC;

#Top Product Categories
SELECT `Category Name`,
ROUND(SUM(Sales),2) AS Revenue
FROM supply_chain_data
GROUP BY `Category Name`
ORDER BY Revenue DESC
LIMIT 10;

#Top 10 Countries by Revenue
SELECT `Order Country`,
ROUND(SUM(Sales),2) AS Revenue
FROM supply_chain_data
GROUP BY `Order Country`
ORDER BY Revenue DESC
LIMIT 10;

#Category Performance
SELECT `Category Name`,
COUNT(*) AS Orders,
ROUND(SUM(Sales),2) AS Revenue
FROM supply_chain_data
GROUP BY `Category Name`
ORDER BY Revenue DESC;

#Customer Segment Analysis
SELECT `Customer Segment`,
COUNT(*) AS Orders,
ROUND(SUM(Sales),2) AS Revenue
FROM supply_chain_data
GROUP BY `Customer Segment`
ORDER BY Revenue DESC;

#Top 5 Markets by Revenue using RANK()
SELECT
Market,
ROUND(SUM(Sales),2) AS Revenue,
RANK() OVER(
ORDER BY SUM(Sales) DESC
) AS Market_Rank
FROM supply_chain_data
GROUP BY Market;

#Top Product Categories using DENSE_RANK()
SELECT
`Category Name`,
ROUND(SUM(Sales),2) AS Revenue,
DENSE_RANK() OVER(
ORDER BY SUM(Sales) DESC
) AS Category_Rank
FROM supply_chain_data
GROUP BY `Category Name`;

#Markets with Above Average Revenue
WITH market_sales AS
(
SELECT
Market,
SUM(Sales) AS Revenue
FROM supply_chain_data
GROUP BY Market
)

SELECT *
FROM market_sales
WHERE Revenue >
(
SELECT AVG(Revenue)
FROM market_sales
);

#High Revenue Markets (> 5 Million)
SELECT Market,
ROUND(SUM(Sales),2) AS Revenue
FROM supply_chain_data
GROUP BY Market
HAVING Revenue > 5000000
ORDER BY Revenue DESC;

#Profitability Analysis
SELECT Market,
ROUND(AVG(`Order Profit Per Order`),2) AS Avg_Profit
FROM supply_chain_data
GROUP BY Market
ORDER BY Avg_Profit DESC;

#Top 10 Countries by Revenue
SELECT `Order Country`,
ROUND(SUM(Sales),2) AS Revenue
FROM supply_chain_data
GROUP BY `Order Country`
ORDER BY Revenue DESC
LIMIT 10;
