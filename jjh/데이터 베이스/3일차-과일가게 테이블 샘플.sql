/*
INSERT INTO fruit VALUES('딸기',5000, 0,'박스');
INSERT INTO fruit VALUES('바나나',4000, 0,'송이');
INSERT INTO fruit VALUES('포도',10000, 0,'상자');
INSERT INTO fruit VALUES('수박',12000, 0,'EA');
INSERT INTO fruit VALUES('귤',10000, 0,'박스');
*/
-- INSERT INTO store VALUES ('행복과일가게','청주시'),('과일상','청주시'),('과일상회','청주시');

-- 과일상회에서 딸기를 100상자 개당 4000원에 지금 구매를 했다. 이때 필요한 쿼리를 작성하세요.
-- 날짜는 '2021-11-24 15:10:00'
-- INSERT INTO buy(bu_fr_name, bu_amount, bu_date, bu_unit, bu_st_name) VALUES('딸기', 100, '2021-11-24 15:10:00', '상자', '과일상회');
-- UPDATE fruit SET fr_amount = fr_amount + 100 WHERE fr_name = '딸기';

-- 손님이 현금으로 딸기 2상자를 지금 사갔다. 
/*INSERT INTO sell VALUES(1,'딸기', 2, '상자',10000, now(),'현금');
UPDATE fruit set fr_amount = fr_amount -2 WHERE fr_name = '딸기';
*/
SELECT * FROM fruit;