-- INSERT INTO student VALUES('2021160123', 'hong','hong','홍길동','020101-3456789');
-- id: hong123, pw:pw123으로 하려 했으나 순서를 착각해서 잘못 입력했더니 원하지 않은 결과가 발생
-- INSERT INTO student VALUES('student2021160124', 'pw123','hong123','황길동','020501-3457789');
-- INSERT INTO student(st_num, st_id, st_pw, st_name, st_reg_num) VALUES('202116001', 'KANG', 'KANG', '강감찬', '021525-3654321');
-- id: kimid, pw:pumkin으로 하기 위해 속성 순서를 st_pw, st_id 순으로 바꿔서 원하는 결과가 나옴 
-- INSERT INTO student(st_num, st_pw, st_id,  st_name, st_reg_num) VALUES('202116015', 'pwkim', 'kimid', '김영희', '021525-4568351'); 
-- INSERT INTO student VALUES(2021123005,'park', 'parkpw', '박철수', '021221-4443332'), (2021145005,'bark', 'parkpw', '박철수', '020808-3985612');
-- SELECT * FROM university_jjh.student;


-- 교수번호가 2000160001인 이순신 교수님의 정보를 추가하는 쿼리문을 작성하세요.
-- id: lee, pw:leelee, 주민번호: 550505-1234567
-- INSERT INTO professor(pr_num, pr_id, pr_pw, pr_reg_num,pr_name) VALUES('200160001', '1ee', 'leelee', '550505-1234567','이순신');

-- 과목명이 컴퓨터 개론이고, 과목 코드는 MSC001, 일정과 분반은 미정인 과목을 추가하는 쿼리문을 작성하세요.
-- INSERT INTO subject(su_code, su_title) VALUES('MSC001', '컴퓨터 개론'); 

-- 2000160001 교수님이 1번 과목을 강의한다. 이 내용을 lecture 테이블에 추가하는 코드를 작성하세요.
INSERT INTO lecture(le_pr_num, le_su_num) VALUES ('200160001', '1');

-- 2021160123 홍길동 학생이 1번 과목을 수강신청 했다. 이 내용을 추가하는 코드를 작성하세요.
-- insert into course(co_st_num, co_su_num) VALUES(2021160123, 1);







