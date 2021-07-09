# 출연작이 많은 순으로 배우의 first_name, last_name, 작품수 를 출력하시오.



select A.actor_id, A.first_name, A.last_name, count(FA.film_id) as "작품수"
from film_actor FA join actor as A
on FA.actor_id = A.actor_id
group by A.actor_id, A.first_name, A.last_name
order by count(FA.film_id) desc;