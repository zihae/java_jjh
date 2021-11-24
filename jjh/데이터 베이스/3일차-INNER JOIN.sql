-- 컴퓨터 개론 3분반(su_title, su_class_num) 강의를 수강하는 학생들의 명단(st_name)을 확인하는 쿼리를 작성하세요
-- 기준 테이블 : course
-- SELECT st_num, st_name FROM course JOIN SUBJECT ON co_su_num = su_num JOIN student ON co_st_num = st_num WHERE su_title = '컴퓨터 개론' AND su_class_num=3;

-- 2021160123 학번인 홍길동 학생(co_st_num= 2021160123)이 수강한 모든 과목명(su_title)을 확인하는 쿼리를 작성하세요.
-- 기준 테이블: course
-- 내가 작성한 쿼리 
-- SELECT su_title FROM subject JOIN course WHERE co_st_num = 2021160123;
-- 강사님이 작성한 쿼리
-- SELECT su_title FROM course JOIN SUBJECT ON co_su_num = su_num WHERE co_st_num= 2021160123;

-- 이순신 교수님의 강의(le_pr_num= pr_num)를 수강하는 학생들 명단(st_name)을 확인하는 쿼리를 작성하세요 
SELECT st_name FROM lecture JOIN professor on pr_num = le_pr_num 
					  JOIN course ON co_su_num = le_su_num 
					  JOIN student ON co_st_num = st_num
                      WHERE pr_name = '이순신';
                      

