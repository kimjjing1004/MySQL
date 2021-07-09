# 'R'등급 영화에 출연한 적이 없는 배우의 first_name, last_name,
# 출연영화제목, 출시년도를 출시년도 순으로 출럭하시오



select AC.first_name, AC.last_name, FL.title, FL.release_year
from film FL join film_actor FA on FL.film_id = FA.film_id
join actor AC on AC.actor_id = FA.actor_id
where AC.actor_id not in (select FA.actor_id
	from film FL join film_actor FA on FL.film_id = FA.film_id
	where rating = 'R')
order by FL.release_year;