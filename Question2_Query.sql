select 
COALESCE(D.department_name, NULL) as Department_Name,
COALESCE(SALEDEPT.Sale_Amount,0) as Sale_Amount,
COALESCE(SALEDEPT.SALE_YEAR,NULL) as Sale_Year
from DEPT D
LEFT OUTER JOIN
(select  (EXTRACT(YEAR FROM O.SALES_DATE)) AS SALE_YEAR,
sum(O.Order_Amount) as Sale_Amount,
S.dept_id 
from salesman S
LEFT OUTER JOIN Orders O
on S.salesman_id = O.salesman_id
WHERE EXTRACT(YEAR FROM O.SALES_DATE) = '2018'
GROUP BY 1,3)SALEDEPT
ON D.dept_id = SALEDEPT.dept_id
order by Sale_Amount DESC;

