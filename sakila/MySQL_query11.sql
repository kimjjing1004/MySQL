# 11. 영화 'AGENT TRUMAN'를 보유하고 있는 매장의 정보와 해당 타이틀의
# 대여 정보를(대여 정보가 없을 경우에는 관련 컬럼은 null 처리) 아래와 같이 출력함.
# 영화제목, 매장ID, 인벤토리ID, 매장의 address, address2, district, city, country,
# 대여 일자, 회수일자, 대여고객의 first_name, last_name



select FL.title, ST.store_id, IV.inventory_id, AD.address, AD.address2
, AD.district, CT.city, CU.country, RT.rental_date, RT.return_date, CS.first_name, CS.last_name
from film FL join inventory IV on FL.film_id = IV.film_id
join store ST on IV.store_id = ST.store_id
join address AD on ST.address_id = AD.address_id
join city CT on AD.city_id = CT.city_id
join country CU on CT.country_id = CU.country_id
left join rental RT on IV.inventory_id = RT.inventory_id
join customer CS on RT.customer_id = CS.customer_id
where FL.title = 'AGENT TRUMAN';