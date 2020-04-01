SELECT
S.salesman_name,
SUM(O.order_amount) as TOTAL_SALES
FROM salesman S
JOIN orders O
ON S.salesman_id = O.salesman_id
WHERE EXTRACT(YEAR FROM O.SALES_DATE) = '2018'
GROUP BY S.salesman_id
ORDER BY TOTAL_SALES DESC
LIMIT 10;