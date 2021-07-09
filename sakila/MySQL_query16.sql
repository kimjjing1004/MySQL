# 16. '2005-08-01' 부터 '2005-08-15' 사이, Cannada(country) Alberta(district) 주에서
# 대여한 영화의 타이틀 정보를 아래와 같이 출력하시오.
# 대여일, 영화 타이틀, 인벤토리ID, 매장ID, 매장 전체 주소




select RT.rental_date, FL.title, IV.inventory_id, IV.store_id, AD.address, AD.address2, AD.district, CT.city, CU.country
from rental RT join inventory IV on RT.inventory_id = IV.inventory_id
join store ST on IV.store_id = ST.store_id
join address AD on ST.address_id = AD.address_id
join city CT on AD.city_id = CT.city_id
join country CU on CT.country_id = CU.country_id
join film FL on IV.film_id = FL.film_id
where rental_date between '2005-08-01' and '2005-08-15'
and AD.district = 'Alberta'
and CU.country = 'Canada'