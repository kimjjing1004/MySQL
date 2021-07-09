# 14. 총 지불 금액별 고객 등급을 출력하고자 한다. 등급 구분과 출력 컬럼은 다음과 같다.(case 문 사용)
# 'A' : 총 지불금액이 200 이상
# 'B' : 총 지불금액이 200 미만 100 이상
# 'C' : 총 지불금액이 100 미만 고객
# 고객의 first_name, last_name, 총 지불금액, 등급
# 총 지불금액이 많은 고객부터 출력





SELECT customer.first_name, customer.last_name, SUM(payment.amount) AS "총지불금액",
	CASE
		WHEN (SUM(payment.amount) >= 200) THEN 'A'
        WHEN (SUM(payment.amount) < 200 AND SUM(payment.amount) >= 100) THEN 'B'
        ElSE 'C'
	END AS '등급'
FROM customer
INNER JOIN rental
ON customer.customer_id = rental.customer_id
INNER JOIN payment
ON rental.rental_id = payment.rental_id
GROUP BY customer.customer_id
ORDER BY SUM(payment.amount) DESC;
