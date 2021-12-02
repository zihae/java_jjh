/* 프로시저 : 쿼리의 집합으로 함수라고 생각하면 됨
- 장점
1. 하나의 요청으로 여러 SQL문을 실행할 수 있다 => 네트워크 부하를 줄일 수 있다 
2. 처리시간이 줄어든다 
3. 응용 프로그램측 로직을 가지지 않고도 데이터의 앞뒤가 맞게 할 수 있다 
4. 보수성이 뛰어나다 
- 단점 
1. 재사용성이 나쁘다 
2. 업무의 사양 변경 시 프로시저의 정의를 변경할 필요할 필요가 있다 
- 프로시저 목록 확인 
SHOW PROCEDURE STATUS; 
- 프로시저 스크립트 확인 
SHOW CREATE PROCEDURE 프로시저명; 
-프로시저 생성 하는 방법
DROP PROCEDURE IF EXISTS 프로시저명;
DELIMITER //
CREATE PROCEDURE 프로시저명
(
	[(IN|OUT) 변수명 타입, 
    ...
    (IN|OUT) 변수명 타입], 
)
BEGIN
-- 실행코드 
END //
DELIMITER ; 
*/ 