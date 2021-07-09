# 12. 대여된 영화 타이틀과 대여회수를 출력하시오(대여 회수 내림차순)




select FL.title, SUM(rental_info.rental_cnt)
from inventory IV
join (select inventory_id, COUNT(rental_id) as rental_cnt from rental group by inventory_id) as rental_info
on IV.INVENTORY_ID = rental_info.INVENTORY_ID
join film FL on IV.FILM_ID = FL.FILM_ID
GROUP BY FL.title
ORDER BY SUM(rental_info.rental_cnt) DESC;