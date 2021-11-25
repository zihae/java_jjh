-- 단가가 3000원 이상 6000원 이하인 제품들을 확인 
SELECT 제조업체,제품명,재고량,단가 FROM 제품 WHERE 단가 >= 3000 AND 단가 <= 6000 ORDER BY 제조업체, 제품명;

-- BETWEEN: A이상 B이하일 때 사용
SELECT 제조업체,제품명,재고량,단가 FROM 제품 WHERE 단가 BETWEEN 3000 AND 6000 ORDER BY 제조업체, 제품명;

-- IN() : 여러 값 중 하나를 만족하는 경우 사용 
-- 제조업체가 대한식품 또는 민국푸드인 제품들을 확인 
SELECT * FROM 제품  WHERE 제조업체 IN('대한식품','민국푸드') ORDER BY 제조업체;
SELECT * FROM 제품  WHERE 제조업체 = '대한식품' OR 제조업체 = '민국푸드' ORDER BY 제조업체;

-- 등급이 SLIVER 또는 GOLD인 회원의 아이디를 확인
SELECT 고객아이디,등급 FROM 고객 WHERE 등급 IN ('silver','gold');
SELECT 고객아이디,등급 FROM 고객  WHERE 등급 = 'silver' OR 등급 = 'gold';

-- 등급이 sliver 또는 gold인 회원이 주문한 제품명을 확인
SELECT DISTINCT 제품명 FROM 주문 JOIN 제품 ON 제품번호 = 주문제품 JOIN 고객 ON 주문고객 = 고객아이디 WHERE 등급 IN ('silver','gold');

-- 가격이 2600원 이상인 제품의 제품명과 단가를 확인 
SELECT * FROM 제품 WHERE 단가>=2600;
-- 서브쿼리 : 퀴리문 안에 들어가 있는 쿼리 
-- SELECT () FROM () [WHERE()]; ()가 서브쿼리가 들어갈 수 있는 자리

-- 쿵떡파이의 가격보다 크거나 같은 제품의 제품명과 단가를 확인
SELECT * FROM 제품 WHERE 단가>=(SELECT 단가 FROM 제품 WHERE 제품명 ='쿵떡파이');

-- 그냥만두의 가격(4500)보다 크거나 같고 얼큰라면의 가격(1200)보다 크거나 같은 제품의 제품명과 단가를 확인 
SELECT 제품명, 단가 FROM 제품 WHERE 단가>=(SELECT 단가 FROM 제품 WHERE 제품명 ='얼큰라면') AND 단가>=(SELECT 단가 FROM 제품 WHERE 제품명 ='그냥만두'); 
SELECT 제품명, 단가 FROM 제품 WHERE 단가>=(SELECT MAX(단가) FROM 제품 WHERE 제품명 IN ('얼큰라면','그냥만두')); 

-- ALL() : 전부를 만족하는 경우들만 확인. AND
SELECT 제품명, 단가 FROM 제품 WHERE 단가>=ALL (SELECT 단가 FROM 제품 WHERE 제품명 IN ('얼큰라면','그냥만두'));

-- ANY() : 하나이상 만족하는 경우들만 확인. OR
-- 그냥만두의 가격보다 크거나 같거나 얼큰라면의 가격보다 크거나 같은 제품의 제품명과 단가를 확인 
SELECT 제품명, 단가 FROM 제품 WHERE 단가>=(SELECT 단가 FROM 제품 WHERE 제품명 ='얼큰라면') OR 단가>=(SELECT 단가 FROM 제품 WHERE 제품명 ='그냥만두'); 
SELECT 제품명, 단가 FROM 제품 WHERE 단가>=(SELECT MIN(단가) FROM 제품 WHERE 제품명 IN ('얼큰라면','그냥만두')); 
SELECT 제품명, 단가 FROM 제품 WHERE 단가>=ANY (SELECT 단가 FROM 제품 WHERE 제품명 IN ('얼큰라면','그냥만두'));

-- GROUP BY : WHERE절 다음에 나와야 함, ORDER BY 앞. 같은 그룹끼리 묶어줌 
-- GROUP BY는 DISTINCT 처럼 보일 수 있다.
SELECT * FROM 제품 GROUP BY 제조업체;
-- 제조업체별로 하나씩만 나옴
SELECT DISTINCT 제조업체,제품번호 FROM 제품;

-- 대한식품에서 만든 제품 개수 확인 
SELECT COUNT(제조업체) AS '대한식품 제품 개수' FROM 제품 WHERE 제조업체='대한식품';

-- 각 회사별 만든 제품 개수 확인 
SELECT 제조업체, COUNT(*) AS '제품수'FROM 제품 GROUP BY 제조업체;

-- 1번이상 주문한 고객별 주문한 주문 횟수
SELECT 주문고객,COUNT(*) AS 주문횟수 FROM 주문 GROUP BY 주문고객;

-- 1번이상 주문한 고객별 고객의 총 주문 개수
SELECT 주문고객,SUM(수량) AS '주문개수' FROM 주문 GROUP BY 주문고객; 

-- 1번이상 주문한 고객별 고객의 총 주문 금액을 확인 
-- 주문 제품 JOIN 
SELECT 주문고객,SUM(수량*단가) AS '총 주문 금액' FROM 주문 JOIN 제품 ON 제품번호 = 주문제품 GROUP BY 주문고객 ORDER BY `총 주문 금액`;

-- 1번 이상 주문한 고객 중 총 주문 금액이 100000원 이상인 고객 확인 
-- WHERE 절에는 GROUP BY로 작업한 집약함수를 이용한 조건을 걸 수 없다
-- HAVING 절은 GROUP BY로 작업한 내용에 조건을 걸어줄 때 사용 
SELECT 주문고객,SUM(수량*단가) AS '총 주문 금액' FROM 주문 JOIN 제품 ON 제품번호 = 주문제품 GROUP BY 주문고객 
HAVING SUM(수량*단가)>=100000 ORDER BY `총 주문 금액`;

-- 제품별 주문한 제품번호와 주문수량(제품의 누적 주문량), 제조업체를 확인 
SELECT 제조업체, 주문제품, SUM(수량) AS '누적주문량' FROM 주문 JOIN 제품 ON 제품번호 = 주문제품 GROUP BY 주문제품 ORDER BY 제조업체;

-- 제조업체별 가장 많이 팔린 제품을 제조업체,제품번호,주문수량을 확인
SELECT 제조업체, 주문제품, MAX(누적주문량) FROM (SELECT 제조업체, 주문제품, SUM(수량) AS '누적주문량' FROM 주문 
JOIN 제품 ON 제품번호 = 주문제품 
GROUP BY 주문제품 ORDER BY 제조업체) AS `제품별판매량` GROUP BY 제조업체;

-- WITH ROLLUP : 부분 총합을 구해줌 
SELECT 주문제품, 주문고객, SUM(수량) FROM 주문 GROUP BY 주문제품, 주문고객 WITH ROLLUP;

-- LIMIT : 검색 결과의 개수를 제한할 때 사용
-- LIMIT 정수1 : 정수 1개만큼 결과를 보여줌
-- LIMIT 번지,정수1 : 번지부터 정수1개의 결과를 보여줌
SELECT * FROM 주문 LIMIT 5; -- 처음5개

-- 한번에 주문 내역을 확인할 수 있는 개수가 5개인 경우로, 1페이지에 해당
SELECT * FROM 주문 LIMIT 0,5; -- 0번지부터 5개
-- 한번에 주문 내역을 확인할 수 있는 개수가 5개인 경우로, 2페이지에 해당
SELECT * FROM 주문 LIMIT 5,5; -- 5번지부터 5개
-- 한번에 주문 내역을 확인할 수 있는 개수가 5개인 경우로, 3페이지에 해당
SELECT * FROM 주문 LIMIT 10,5; -- 10번지부터 5개 / 5*(3-1) :개수 *(페이지 번호-1)

-- 가장 많은 금액을 사용한 고객아이디를 확인 
-- SELECT 속성 FROM 테이블 WHERE 조건 GROUP BY 속성 ORDER BY 속성 [DESC | ASC] LIMIT 개수
SELECT 주문고객, SUM(수량*단가) AS 누적금액 FROM 주문 JOIN 제품 ON 주문제품 = 제품번호 GROUP BY 주문고객 ORDER BY 누적금액 DESC LIMIT 1;

-- 가장 많은 제품 개수를 구매한 고객아이디를 확인
SELECT 주문고객, SUM(수량) AS '총 주문 수량' FROM 주문 JOIN 제품 ON 주문제품 = 제품번호 GROUP BY 주문고객 ORDER BY `총 주문 수량` 
DESC LIMIT 1;

-- 20대가 구매한 제품목록을 확인 
SELECT 제품명 FROM 주문 JOIN 제품 ON 주문제품=제품번호 JOIN 고객 ON 고객아이디 = 주문고객 WHERE 나이 BETWEEN 20 AND 29; -- 내가 짠 쿼리

SELECT 제품명 AS '20대구매제품' FROM 고객 JOIN 주문 ON 고객아이디=주문고객 JOIN 제품 ON 주문제품=제품번호 
WHERE 나이 BETWEEN 20 AND 29 GROUP BY 제품명; -- 강사님이 짠 쿼리

-- 20대가 구매를 가장 많이 한 제품을 확인 
SELECT 제품명, SUM(수량) AS 누적주문량 FROM 주문 JOIN 제품 ON 주문제품=제품번호 JOIN 고객 ON 고객아이디 = 주문고객 
WHERE 나이 BETWEEN 20 AND 29 GROUP BY 제품명 ORDER BY 누적주문량  DESC LIMIT 1;