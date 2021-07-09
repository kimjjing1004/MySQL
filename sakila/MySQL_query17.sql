# 17. 도시별 'Horror' 영화 대여정보를 알고자 한다. 도시와 대여수를 출력하라.
# 대여수 내림차순, 도시명 오름차순으로 정렬하시오.





select CT.city, count(FL.title)
from film FL join film_category FC on FL.film_id = FC.film_id
join category CG on FC.category_id = CG.category_id
join inventory IV on FL.film_id = IV.film_id
join rental RT on IV.inventory_id = RT.inventory_id
join customer CS on RT.customer_id = CS.customer_id
join address AD on CS.address_id = AD.address_id
join city CT on AD.city_id = CT.city_id
join country CU on CT.country_id = CU.country_id
where CG.name = 'Horror'
group by CT.city
order by count(FL.title) desc, CT.city