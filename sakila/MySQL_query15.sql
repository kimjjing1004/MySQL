# 15. DVD 대여 후 아직 반납하지 않은 고객정보를 다음의 정보로 출력한다.(case 문 사용)
# 영화타이틀, 인벤토리ID, 매장ID, 고객의 first_name, last_name, 대여일자, 고객등급





select FL.title, IV.inventory_id, IV.store_id, CS.first_name, CS.last_name
, RT.rental_date, case when (sum(PM.amount) >= 200) then 'A'
	when (sum(PM.amount) >= 100) then 'B'
                    else 'C' end as customer_grade
from rental RT join customer CS on RT.customer_id = CS.customer_id
join inventory IV on RT.inventory_id = IV.inventory_id
join film FL on IV.film_id = FL.film_id
join store ST on IV.store_id = ST.store_id
join payment PM on CS.customer_id = PM.customer_id
where RT.return_date is null
group by FL.title, IV.inventory_id, IV.store_id, CS.first_name, CS.last_name
, RT.rental_date