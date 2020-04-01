SELECT s.salesman_id,
S.salesman_name
FROM salesman S
WHERE S.salesman_id NOT IN
(select 
distinct O.salesman_id
from orders O
WHERE EXTRACT(YEAR FROM O.SALES_DATE) = '2018')




