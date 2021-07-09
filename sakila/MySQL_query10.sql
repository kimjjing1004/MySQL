# 10. 영화 'AGENT TRUMAN' 를 보유하고 있는 매장의 정보를 아래와 같이 출력함.
# 영화제목, 매장ID, 매장staff first_name, 매장staff last_name, 매장의 address, address2,
# district, city, country, 해당 타이틀 "보유수량"



select FL.title, ST.store_id, SF.first_name, SF.last_name, AD.address, AD.address2
, AD.district, CT.city, CU.country, count(FL.title) as "보유수량"
from film FL join inventory IV on FL.film_id = IV.film_id
join store ST on IV.store_id = ST.store_id
join staff SF on ST.store_id = SF.store_id
join address AD on ST.address_id = AD.address_id
join city CT on AD.city_id = CT.city_id
join country CU on CT.country_id = CU.country_id
where FL.title = 'AGENT TRUMAN'
group by FL.title, ST.store_id, SF.first_name, SF.last_name, AD.address, AD.address2
, AD.district, CT.city, CU.country;