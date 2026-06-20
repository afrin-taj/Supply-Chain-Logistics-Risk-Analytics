#Top 3 Countries per Market using ROW_NUMBER()
WITH country_sales AS
(
SELECT
Market,
`Order Country`,
ROUND(SUM(Sales),2) AS Revenue,
ROW_NUMBER() OVER(
PARTITION BY Market
ORDER BY SUM(Sales) DESC
) AS rn
FROM supply_chain_data
GROUP BY Market,`Order Country`
)

SELECT *
FROM country_sales
WHERE rn<=3;

#Market wise sales
SELECT
Market,
ROUND(SUM(Sales),2) AS Revenue
FROM supply_chain_data
GROUP BY Market
ORDER BY Revenue DESC;

#Country-wise Revenue
SELECT
`Order Country`,
ROUND(SUM(Sales),2) AS Revenue
FROM supply_chain_data
GROUP BY `Order Country`
ORDER BY Revenue DESC;

#Region-wise Performance
SELECT
`Order Region`,
COUNT(*) AS Orders,
ROUND(SUM(Sales),2) AS Revenue,
ROUND(AVG(`Order Profit Per Order`),2) AS Avg_Profit
FROM supply_chain_data
GROUP BY `Order Region`
ORDER BY Revenue DESC;

#Region Ranking by Revenue
SELECT
`Order Region`,
ROUND(SUM(Sales),2) AS Revenue,
RANK() OVER(
ORDER BY SUM(Sales) DESC
) AS Region_Rank
FROM supply_chain_data
GROUP BY `Order Region`;




