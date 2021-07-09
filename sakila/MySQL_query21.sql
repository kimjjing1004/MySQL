# 21. 대여횟수 상위 5위 고객이 대여한 영화의 title을 알파벳 순으로 출력
# 출력 컬럼 : 고객이름(first, last), 영화제목, 총 대여수


SELECT CS.first_name, CS.last_name, top5.tot_cnt
FROM
	(SELECT customer_id, count(rental_id) AS tot_cnt
	FROM rental
	GROUP BY customer_id
	ORDER BY count(rental_id) DESC LIMIT 5) AS top5
JOIN rental RT ON top5.customer_id = RT.customer_id
JOIN inventory IV ON RT.inventory_id = IV.inventory_id
JOIN film FL ON IV.film_id = FL.film_id
JOIN customer CS ON top5.customer_id = CS.customer_id
ORDER BY top5.tot_cnt DESC, FL.title;



-- CTE문 으로 해결하는 방법
-- with top5(customer_id, tot_cnt)
-- as (
-- 	select customer_id, count(rental_id) as tot_cnt
-- 	from rental
-- 	group by customer_id
-- 	order by count(rental_id) desc
-- 	limit 5
-- )
-- select CS.first_name, CS.last_name, FL.title, top5.tot_cnt
-- from top5 join rental RT on top5.customer_id = RT.customer_id
-- join inventory IV on RT.inventory_id = IV.inventory_id
-- join film FL on IV.film_id = FL.film_id
-- join customer CS on top5.customer_id = CS.customer_id
-- order by top5.tot_cnt desc, FL.title;