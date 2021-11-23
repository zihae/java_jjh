-- 학번이 2021123001 학생의 id와 pw를 수정하는 쿼리문
UPDATE student SET st_id= 'kangkidont', st_pw='kangkidongpw' WHERE st_num = '2021123001';

UPDATE subject SET su_schedule ='월1,월2', su_class_num =3 WHERE su_num =1;

-- 200160001 교수님이 1번 과목을 강의할 강의 시간표가 새로 나왔다. 월1,2회로 결정되었고, 분반은 3분반이다.
-- 다음을 실행하는 쿼리문을 작성하세요.
UPDATE subject SET su_schedule = '월1,월2', su_class_num = 3 WHERE su_num = 1;