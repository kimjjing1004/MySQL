# 배우의 'R' 등급 영화 작품 수를 카운트 하여, 가장 많은 작품수를 가지는 배우부터 출력하시오,
# 출력 칼럼은 다음과 같다.
# actor_id, first_name, last_name, 'R'등급 작품 수



select AC.actor_id, AC.first_name, AC.last_name, count(FL.title)
from film FL join film_actor FA on FL.film_id = FA.film_id
join actor AC on AC.actor_id = FA.actor_id
where FL.rating = 'R'
group by AC.actor_id, AC.first_name, AC.last_name
order by count(FL.title) desc;