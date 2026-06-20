#Delivery Status Distribution
SELECT `Delivery Status`,
COUNT(*) AS Orders
FROM supply_chain_data
GROUP BY `Delivery Status`
ORDER BY Orders DESC;

#Shipping Modes
SELECT `Shipping Mode`,
COUNT(*) AS Orders
FROM supply_chain_data
GROUP BY `Shipping Mode`
ORDER BY Orders DESC;

#Average Shipping Days by Mode
SELECT `Shipping Mode`,
ROUND(AVG(`Days for shipping (real)`),2) AS Avg_Days
FROM supply_chain_data
GROUP BY `Shipping Mode`
ORDER BY Avg_Days;

#Order Status Distribution
SELECT `Order Status`,
COUNT(*) AS Orders
FROM supply_chain_data
GROUP BY `Order Status`
ORDER BY Orders DESC;

#Shipping Mode Performance Ranking
SELECT
`Shipping Mode`,
ROUND(AVG(`Days for shipping (real)`),2) AS Avg_Days,
RANK() OVER(
ORDER BY AVG(`Days for shipping (real)`)
) AS Speed_Rank
FROM supply_chain_data
GROUP BY `Shipping Mode`;

#Shipping Mode Revenue
SELECT `Shipping Mode`,
ROUND(SUM(Sales),2) AS Revenue
FROM supply_chain_data
GROUP BY `Shipping Mode`
ORDER BY Revenue DESC;