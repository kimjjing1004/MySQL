# 2. 1번 쿼리에 고객ID 대신 고객의 first name, last name을 출력하시오.

USE sakila;

SELECT concat(concat(cs.first_name, ' '), cs.last_name) as '고객명', sum(amount) as '총금액'
FROM payment pm join customer cs
on pm.customer_id = cs.customer_id
GROUP BY 고객명
ORDER BY SUM(AMOUNT) DESC;
