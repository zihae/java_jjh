/* 트리거: 테이블에 대한 이벤트에 반응해 자동으로 실행되는 작업
- 데이터 무결성을 지킬 수 있다 => 연관된 테이블간의 데이터 일관성을 유지 
- 트리거 사용 방법
	1. 트리거 생성
    2. 이벤트를 발생 
    delimiter // --> delimiter: 문장의 끝을 어떤 기호로 할 지 임시로 지정하는 것 
    create trigger 트리거명 타이밍(after|before) 이벤트명(insert|update|delete) on 테이블명 for each row
    begin
    -- 실행코드 
    end //
    delimiter ; 
    
    - old : update 이벤트 발생할 때 사용 가능한 것으로, 값이 바뀌기전의 행
    - new : insert,update 이벤트 발생할 때 사용한 것으로, 값이 바뀐후의 행 또는 새로 추가된 행 
    
    - 변수 선언 방법
    declare 변수명 자료형 default 기본값;
    
    - 변수값 변경 방법
    set 변수명 = 값; 
    set 변수명 = (select를 이용한 검색 결과);
*/

USE fruit_jjh;
DROP TRIGGER IF EXISTS insert_buy;
DELIMITER //
CREATE TRIGGER insert_buy AFTER INSERT ON buy FOR EACH ROW 
BEGIN
	-- 알아야 될 것- 구매한 과일의 수량: new.bu_amount 
    -- 구매한 과일의 이름: new: bu_fr_name
    UPDATE fruit
    SET fr_amount = fr_amount + new.bu_amount WHERE fr_name = new.bu_fr_name;
END //
DELIMITER ;
-- 트리거 확인을 위해 buy 테이블에 행을 추가 
INSERT INTO buy VALUES(2,'바나나',50,NOW(),'송이','과일상회');
-- 트리거에 의해 fruit 테이블이 변경됐는지 확인 
SELECT * FROM fruit;
-- 만들어진 트리거를 확인 
SHOW TRIGGERS;

-- 과일을 판매 했을 때 과일 수량을 맞춰주는 트리거를 만들어 보세요 

