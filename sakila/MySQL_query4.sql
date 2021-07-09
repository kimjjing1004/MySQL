# 위 3번 쿼리에서 고객ID 대신 고객의 FIRST_NAME, LAST_NAME을 출력하라.


SELECT concat(concat(cs.first_name, ' '), cs.last_name) as '고객명', count(rental_id) as '렌탈 수'
FROM rental as pm
JOIN customer as cs ON pm.customer_id = cs.customer_id
GROUP BY pm.customer_id
ORDER BY count(rental_id) DESC;


-- INNER JOIN으로 쿼리하는 법
-- select concat(customer.first_name,' ',customer.last_name) as '고객명', count(rental.customer_id) as '총 대여수'
-- from customer
-- inner join rental
-- on customer.customer_id = rental.customer_id
-- group by rental.customer_id
-- order by count(rental.customer_id) desc;