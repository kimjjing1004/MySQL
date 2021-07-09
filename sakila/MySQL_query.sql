# 1. 고객별 지불 금액의 총합을 구하라
# customer_id, 총금액


USE sakila;

SELECT CUSTOMER_ID as '고객ID', SUM(AMOUNT) as '총금액'
FROM payment
GROUP BY CUSTOMER_ID
ORDER BY SUM(AMOUNT) DESC;
