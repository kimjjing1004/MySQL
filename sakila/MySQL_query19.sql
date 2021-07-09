# 19. 대여된 영화 중 대여기간이 연체된 건을 다음의 정보로 조회하시오.
# 영화 타이틀, inventory_id, 대여일, 반납일, 기준대여기간, 실제대여기간
# ** 아직 반납이 되지 않은 경우, 실제대여기간 컬럼에 'Unknown' 출력



select FL.title, IV.inventory_id, RT.rental_date, RT.return_date
, FL.rental_duration
, IFNULL(DATEDIFF(RT.return_date, RT.rental_date), 'Unknown') as '실 대여기간'
from rental RT join inventory IV on RT.inventory_id = IV.inventory_id
join film FL on IV.film_id = FL.film_id
where DATEDIFF(IFNULL(RT.return_date, curdate()), RT.rental_date) > FL.rental_duration;