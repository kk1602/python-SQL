SELECT
C.cust_id,
C.cust_name,
SUM(O.order_amount) as TOTAL_ORDER_AMOUNT
FROM customer C
JOIN orders O
ON C.cust_id = O.cust_id
WHERE EXTRACT(YEAR FROM O.SALES_DATE) = '2018'
GROUP BY C.cust_id
ORDER BY TOTAL_ORDER_AMOUNT DESC
LIMIT 10;