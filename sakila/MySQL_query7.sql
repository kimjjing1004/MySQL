# MARY KEITEL의 출연작을 영화제목 오름차순으로 출력하시오.
# 출력 컬럼은 다음과 같다.
# FIRST_NAME, LAST_NAME, 영화제목, 출시일, 대여 비용


select AC.first_name, AC.last_name, FL.title, FL.release_year, FL.rental_rate
from actor AC join film_actor FA on AC.actor_id = FA.actor_id
join film FL on FA.film_id = FL.film_id
where AC.first_name = 'MARY' and AC.last_name = 'KEITEL'
order by FL.title;