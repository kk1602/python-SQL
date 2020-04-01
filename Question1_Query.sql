select 
C.state,
O.ORDER_ID,
O.sales_date,
O.order_amount
FROM salesman S 
JOIN orders O
ON S.salesman_id = O.salesman_id
JOIN customer C
on C.cust_id = O.cust_id
WHERE C.state = 'CALIFORNIA'
AND
EXTRACT(YEAR FROM O.SALES_DATE) = '2018'
GROUP BY 1,2
order by 2 ASC;