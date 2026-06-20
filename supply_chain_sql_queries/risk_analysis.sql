#Late Delivery Risk
SELECT Late_delivery_risk,
COUNT(*) AS Orders
FROM supply_chain_data
GROUP BY Late_delivery_risk;

#Risk Classification using CASE
SELECT
CASE
WHEN `Late_delivery_risk`=1 THEN 'High Risk'
ELSE 'Low Risk'
END AS Risk_Level,
COUNT(*) AS Orders
FROM supply_chain_data
GROUP BY Risk_Level;

#Delayed Orders Only
SELECT `Delivery Status`,
COUNT(*) AS Delayed_Orders
FROM supply_chain_data
WHERE `Delivery Status`='Late delivery'
GROUP BY `Delivery Status`;

#Highest Revenue Product in Each Category
WITH product_sales AS
(
SELECT
`Category Name`,
`Product Name`,
ROUND(SUM(Sales),2) AS Revenue,
ROW_NUMBER() OVER(
PARTITION BY `Category Name`
ORDER BY SUM(Sales) DESC
) AS rn
FROM supply_chain_data
GROUP BY `Category Name`,`Product Name`
)
SELECT *
FROM product_sales
WHERE rn=1;