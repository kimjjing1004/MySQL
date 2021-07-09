# action 분야 영화의 다음 속성들을 출력하시오.
# 필름번호, 제목, 설명, 분야, 발배연도, 언어






select FL.film_id as 필름번호, FL.title as 제목, FL.description as 설명, CG.name as 분야
, FL.release_year as 발매년도, LG.name as 언어
from film as FL join film_category as FC on FL.film_id = FC.film_id
join category as CG on FC.category_id = CG.category_id
join language as LG on FL.language_id = LG.language_id
where CG.name = 'action'