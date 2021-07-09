# 20. 고객별 연체 건수가 많은 수부터 출력하시오(고객 first_name, last_name, 연체건수)




select CS.first_name, CS.last_name, count(RT.rental_id)
from rental RT join inventory IV on RT.inventory_id = IV.inventory_id
join film FL on IV.film_id = FL.film_id
join customer CS on RT.customer_id = CS.customer_id
where datediff(IFNULL(RT.return_date, curdate()), RT.rental_date) > FL.rental_duration
group by CS.first_name, CS.last_name
order by count(RT.rental_id) desc