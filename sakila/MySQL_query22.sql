# 22. 배우 'WALTER TORN' 보다 출연작이 많은 배우의 정보를,
# 배우ID, 배우 이름(first_name, last_name), 출연작 타이틀, 작품 출시일을 출력하시오
# (정렬순서: 배우ID, 타이틀, 출시일)



select id, famous_actor.f_name, famous_actor.l_name, FL.title
, FL.release_year
from (select AC.actor_id as id, AC.first_name as f_name
		, AC.last_name as l_name, count(film_id) as cnt
	from actor AC join film_actor FA on AC.actor_id = FA.actor_id
	group by id, f_name, l_name
	having cnt > (select count(film_id)
		from actor AC join film_actor FA 
        on AC.actor_id = FA.actor_id
		where AC.first_name = 'WALTER'
		and AC.last_name = 'TORN')) as famous_actor
join film_actor FA on famous_actor.id = FA.actor_id
join film FL on FA.film_id = FL.film_id
order by id, FL.title, FL.release_year;