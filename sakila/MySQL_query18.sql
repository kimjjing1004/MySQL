# 18. 각 store 별 총 대여금액을 출력하시오.(store id, 총 대여금액)




select ST.store_id, sum(amount)
from rental RT join payment PM on RT.rental_id = PM.rental_id
join inventory IV on RT.inventory_id = IV.inventory_id
join store ST on IV.store_id = ST.store_id
group by ST.store_id