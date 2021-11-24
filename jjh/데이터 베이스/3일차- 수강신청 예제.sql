-- 2021160001학번 학생이 1번 강의인 컴퓨터 개론 3분반 강의를 신청했다. 이 때 알맞은 쿼리를 작성하세요.
-- INSERT INTO course (co_st_num, co_su_num) VALUES (2021160001,1);

-- 2021160015학번 학생이 컴퓨터 개론 3분반 강의를 신청했다. 이 때 알맞은 쿼리를 작성하세요.
INSERT INTO course(co_st_num, co_su_num) SELECT 2021160015, su_num FROM subjㄷ WHERE su_class_num = 3 and su_title = '컴퓨터 개론';

-- 2021160123학번 홍길동 학생이 수강중인 컴퓨터 개론 3분반 성적이 A+ 이 나왔다. 이 때 알맞은 쿼리를 작성하세요 
UPDATE course set co_score = 'A+' WHERE co_st_num=2021160123 AND co_su_num =1;