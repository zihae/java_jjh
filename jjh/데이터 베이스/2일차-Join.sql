-- 2021160123 학번 학생이 수강 신청한 과목 제목을 확인하는 쿼리문 

SELECT co_st_num, su_title FROM course LEFT JOIN subject ON course.co_su_num = subject.su_num WHERE co_st_num = 2021160123;
SELECT co_st_num, su_title FROM course LEFT JOIN subject ON co_su_num = su_num WHERE co_st_num = 2021160123;
-- 테이블1과 테이블2의 순서를 바꾼 경우 결과가 달라짐 
SELECT * FROM subject LEFT JOIN course ON co_su_num = su_num;

-- 200016001 교수번호를 가진 교수님이 강의하는 강의 제목과 일정을 확인하는 쿼리문을 작성하세요 
SELECT * FROM lecture;
SELECT su_title, su_schedule FROM lecture LEFT JOIN subject on le_su_num = su_num WHERE le_pr_num = 200016001; 

-- 컴퓨터 개론을 강의하는 교수님 교수번호를 확인하는 쿼리문을 작성하세요 
SELECT su_title, le_pr_num FROM lecture LEFT JOIN subject on le_su_num = su_num WHERE su_title = '컴퓨터 개론';

-- 컴퓨터 개론을 강의하는 교수님 이름을 확인하는 쿼리문을 작성하세요 
SELECT le_pr_num FROM lecture LEFT JOIN subject on le_su_num = su_num LEFT JOIN professor on pr_num = le_pr_num WHERE su_title = '컴퓨터 개론';

