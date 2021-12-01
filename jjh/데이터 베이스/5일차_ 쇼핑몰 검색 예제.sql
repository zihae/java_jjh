-- 카테고리 추가
/*
INSERT INTO category(ca_main, ca_sub) VALUES ('아우터','점퍼'),('아우터','코트'),('상의','티셔츠'),('상의','블라우스/셔츠'),('하의','데님'),('하의','팬츠'),('하의','스커트');
*/

-- 제품 등록
/*
INSERT INTO goods VALUES (1,'아크 폭스터 패딩',159000,'패딩입니다',1), (2,'엘비아 앙모코트',229000,'앙모코트입니다',2), (3,'클로 다운후드',99000,'다운 후드입니다',3), 
(4,'파코 레이어드 탑',43000,'탑',4), (5,'기모 와이드 데님 팬츠',43000,'팬츠',5), (6,'롤스 버튼 팬츠',36000,'팬츠',6);
SELECT * FROM goods;
*/

-- 아이디가 abc123, 비밀번호가 abc123, 이름은 홍길동, 폰 번호는 010-1234-5678, 성별은 남자
-- 주소는 청주시 우편번호는 1234, 주소 상세는 그린컴퓨터학원인 회원이 가입을 했다
-- 회원가입 ==> 신규 정보 => INSERT => member 테이블, address 테이블
-- 제품등록 => 신규 정보 => INSERT
-- 회원가입 순서1
-- member에 INSERT ==> address에 INSERT => member에 UPDATE 
-- 회원가입 순서2
-- address에 INSERT => member에 INSERT 
/*
INSERT INTO address VALUES (1, NULL, '청주시', '1234', '그린컴퓨터학원');
INSERT INTO member VALUES ('abc123', 'abc123', '홍길동', '010-1234-5678', '남자',1);
*/

-- 아크 폭스터 패딩이 크기가 s, 색상은 화이트인 제품이 10개 입고 되었다 
-- INSERT INTO `option` VALUES(1, '화이트', 's',10, 1);

-- abc123 회원이 아크 폭스터 패딩을 화이트 색상에 s 사이즈를 1개 구매했다 
-- order에 INSERT
-- INSERT INTO `order` VALUES ('2021HNT001','abc123', 1, NOW(), 1,159000,'결제완료');
-- option에 UPDATE
-- UPDATE `option` SET op_stock = op_stock -1 WHERE op_num = 1;
-- abc123 회원이 주문한 아크 폭스터 패딩에 리뷰를 작성
-- INSERT INTO review VALUES(1,'패딩 좋아요', '따뜻하고 좋아요', NOW(), 1, 'abc123');
select * from review;

-- 분류가 아우터인 모든 제품을 확인 => 점퍼, 코트 x, 아크 폭스터 패딩 o
-- 내가 짠 쿼리 SELECT gd_name FROM goods JOIN category ON category.ca_num =gd_ca_num WHERE gd_ca_num IN (1,2);
-- 강사님이 짠 쿼리 SELECT gd_name FROM goods JOIN category ON category.ca_num =gd_ca_num WHERE ca_main = '아우터';

-- 분류가 아우터이고 구매 가능한 모든 제품을 확인 
SELECT gd_name AS '구매 가능한 아우터' FROM goods JOIN category ON category.ca_num = gd_ca_num JOIN `option` ON op_gd_num = gd_num WHERE ca_main = '아우터' AND op_stock >0;

-- 분류가 아우터이고, 가장 많이 팔린 제품 4가지를 확인 
-- 가장 많이 팔린 제품 4가지 확인 
SELECT goods.* FROM `order` JOIN `option` ON or_op_num =op_num JOIN goods ON gd_num = op_gd_num JOIN category ON category.ca_num =gd_ca_num WHERE ca_main = '아우터' 
AND or_state != '주문취소' AND or_state != '환불' GROUP BY gd_num  ORDER BY sum(or_amount) DESC LIMIT 4;

-- 등록된 아우터 제품의 전체 제품의 개수를 확인 
SELECT COUNT(*) AS '아우터 제품의 수' FROM goods JOIN category ON ca_num = gd_ca_num WHERE ca_main = '아우터';
-- 등록된 아우터 제품을 10개씩 화면에 출력할 때 2페이지에 해당하는 제품을 확인
SELECT * FROM goods JOIN category ON ca_num = gd_ca_num WHERE ca_main = '아우터' LIMIT 10,10;

-- abc123 회원이 주문한 횟수 
SELECT COUNT(*) AS '주문 횟수' FROM `order` WHERE or_me_id = 'abc123';
 
 -- abc123 회원의 상반기 사용 금액 
 SELECT SUM(or_total_price) FROM `order` WHERE or_me_id = 'abc123' AND or_date BETWEEN '2021-01-01' AND '2021-06-30';
 SELECT SUM(or_total_price) FROM `order` WHERE or_me_id = 'abc123' 	AND or_state = '결제완료' AND or_date LIKE '2021%' AND or_date <'2021-07-01' ;
 
 -- 아크폭스터 패딩에 달린 리뷰들을 확인 
 SELECT * FROM review JOIN goods ON gd_num = re_gd_num WHERE gd_name ='아크 폭스터 패딩';
