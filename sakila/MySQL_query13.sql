# 13. 고객의 지불정보를 총지불금액 내림차순, 다음과 같이 출력하시오.
# 고객의 first_name, last_name, 총지불금액, 고객의 주소 address, address2, district, city, country





select CS.first_name, CS.last_name, sum(PM.amount), AD.address, AD.address2, AD.district, CT.city, CU.country
from payment PM join customer CS on PM.customer_id = CS.customer_id
join address AD on CS.address_id = AD.address_id
join city CT on AD.city_id = CT.city_id
join country CU on CT.country_id = CU.country_id
group by CS.customer_id
order by sum(PM.amount) desc;
