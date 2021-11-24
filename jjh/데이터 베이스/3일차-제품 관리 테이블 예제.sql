-- 고객 명단 확인
SELECT * FROM 고객;

-- 고객의 등급을 확인(중복을 제거 DISTINCT)
SELECT DISTINCT 등급 FROM 고객;

-- 아이디가 apple인 고객의 주문 내역을 확인
SELECT * FROM 주문 WHERE 주문고객 = 'apple';

-- 아이디가 apple인 고객의 주문 제품을 확인
SELECT DISTINCT 제품명 FROM 주문 JOIN 제품 ON 제품번호=주문제품 WHERE 주문고객 = 'apple';  

-- 쿵떡 파이를 주문한 고객 명단을 확인
SELECT DISTINCT 주문고객  FROM 주문 JOIN 제품 ON 주문제품=제품번호 WHERE 제품명 = '쿵떡파이';
