-- 2021160001학번 학생이 1번 강의인 컴퓨터 개론 3분반 강의를 신청했다. 이 때 알맞은 쿼리를 작성하세요.
-- INSERT INTO course (co_st_num, co_su_num) VALUES (2021160001,1);

-- 2021160015학번 학생이 컴퓨터 개론 3분반 강의를 신청했다. 이 때 알맞은 쿼리를 작성하세요.
-- INSERT INTO course(co_st_num, co_su_num) SELECT 2021160015, su_num FROM subject WHERE su_class_num = 3 and su_title = '컴퓨터 개론';

-- 2021160123학번 홍길동 학생이 수강중인 컴퓨터 개론 3분반 성적이 A+ 이 나왔다. 이 때 알맞은 쿼리를 작성하세요 
-- UPDATE course set co_score = 'A+' WHERE co_st_num=2021160123 AND co_su_num =1;

-- 홍길동 학생이 수강한 수강 과목의 수를 확인하는 쿼리를 작성하세요 
-- 내가 작성한 쿼리 SELECT COUNT(co_st_num) AS '홍길동 학생 수강' FROM course WHERE co_st_num =2021160123; -> 홍길동 학생 STUDENT NUMBER를 알고 있을 때 사용 가능
-- SELECT COUNT(*) AS '홍길동 학생 수강 과목 수' FROM course JOIN student ON st_num = co_st_num WHERE st_name ='홍길동';

select * from subject;
-- 컴퓨터 개론 3분반 현재 수강 신청 학생수를 확인 
SELECT COUNT(*)  AS '컴퓨터 개론 3분반 현재인원' FROM course JOIN subject ON co_su_num = su_num WHERE su_title ='컴퓨터 개론' AND su_class_num = 3;

-- 이순신 교수님이 강의하는 강의 수
SELECT COUNT(*) AS '이수신 교수님 강의' FROM lecture JOIN professor ON le_pr_num = pr_num WHERE pr_name ='이순신';

SELECT COUNT(*) AS '이수신 교수님 강의' FROM lecture JOIN (SELECT * FROM professor WHERE pr_name ='이순신') AS tmp_professor ON le_pr_num = pr_num;

