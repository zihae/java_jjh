-- 과일 판매 내역을 확인
SELECT * FROM sell;

/*
SELECT NOW() > '2021-11-23';
SELECT NOW() <'2021-11-25';
SELECT NOW() >'2021-11-25';
*/

-- 오늘 과일 판매 내열을 확인 
-- 내가 쓴 쿼리 SELECT * FROM sell WHERE se_date LIKE '2021-11-24%';
-- 강사님이 쓴 쿼리 SELECT * FROM sell WHERE se_date < '2021-11-25' AND se_date >= '2021-11-24';

-- 오늘 과일 판매 총액을 확인
-- SELECT sum(se_price) AS '오늘 판매액' FROM sell WHERE se_date < '2021-11-25' AND se_date >= '2021-11-24';

SELECT * FROM sell;
-- 딸기 총 판매액을 확인
SELECT SUM(se_price) AS '딸기 판매액' FROM sell WHERE se_fr_name = '딸기';

-- 현금으로 판매한 금액
SELECT SUM(se_price) AS '현금 판매액' FROM sell WHERE se_type = '현금';
