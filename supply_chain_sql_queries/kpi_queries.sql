#Total Orders
SELECT COUNT(DISTINCT `Order Id`) AS Total_Orders
FROM supply_chain_data;

#Total Sales
SELECT ROUND(SUM(Sales),2) AS Total_Sales
FROM supply_chain_data;

#Average Shipping Days
SELECT ROUND(AVG(`Days for shipping (real)`),2) AS Avg_Shipping_Days
FROM supply_chain_data;

#Average Profit
SELECT ROUND(AVG(`Order Profit Per Order`),2) AS Avg_Profit
FROM supply_chain_data;

#Delayed Orders
SELECT COUNT(*) AS Delayed_Orders
FROM supply_chain_data
WHERE `Delivery Status`='Late delivery';

#Late Delivery Risk %
SELECT
ROUND(
100.0 * SUM(CASE WHEN Late_delivery_risk=1 THEN 1 ELSE 0 END)
/ COUNT(*),2
) AS Late_Delivery_Risk_Percentage
FROM supply_chain_data;

#Top Category
SELECT
`Category Name`,
ROUND(SUM(Sales),2) AS Revenue
FROM supply_chain_data
GROUP BY `Category Name`
ORDER BY Revenue DESC
LIMIT 1;

#Top Market
SELECT
Market,
ROUND(SUM(Sales),2) AS Revenue
FROM supply_chain_data
GROUP BY Market
ORDER BY Revenue DESC
LIMIT 1;