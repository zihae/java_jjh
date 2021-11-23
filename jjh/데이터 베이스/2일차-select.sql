-- select문 기본 예제
SELECT * FROM student;
SELECT st_num, st_id, st_pw, st_name, st_reg_num from student;

-- sql에서는 숫자로 입력해도 자동으로 문자열로 변환 
SELECT * FROM student WHERE st_num =2021123005;
SELECT * FROM student WHERE st_num ='2021123005';

-- 입학한 학생 전체를 확인하는 쿼리문을 작성하세요.
SELECT * FROM student;

-- 홍길동 학생의 정보를 확인하는 쿼리문을 작성하세요.
SELECT * FROM student WHERE st_name = '홍길동';

-- 홍길동 학생이 아닌 학생들의 정보를 확인하는 쿼리문을 작성하세요.
SELECT * FROM student WHERE st_name != '홍길동'; 
SELECT * FROM student WHERE st_name <> '홍길동';

-- 시간표 일정이 등록된 과목들
SELECT * FROM subject WHERE su_schedule IS NOT NULL;

-- 시간표 일정이 등록되지 않은 과목들
SELECT * FROM subject WHERE su_schedule IS NULL;

-- 과목 제목이 컴퓨터가 들어간 과목들
SELECT * FROM subject WHERE su_title like '%컴퓨터%';

-- 과목 제목이 컴퓨터로 시작하는 과목들
SELECT * FROM subject WHERE su_title like '컴퓨터%';

-- 과목 제목이 컴퓨터로 끝나는 과목들
SELECT * FROM subject WHERE su_title like '%컴퓨터';

-- 과목 제목이 컴퓨터로 시작하고, 과목 제목의 글자수가 5자인 과목들
SELECT * FROM subject WHERE su_title like '컴퓨터__';

-- 과목 제목이 컴퓨터로 시작하고, 과목 제목의 글자수가 6자인 과목들
SELECT * FROM subject WHERE su_title LIKE '컴퓨터___';

-- 21학번 학생들을 확인하는 쿼리문을 작성하세요.  
SELECT * FROM student WHERE st_num LIKE '2021%'; 
SELECT * FROM student WHERE st_num LIKE '2021______';
SELECT * FROM student WHERE st_num >= 2021000000 AND st_num < 2022000000;

-- 컴공학생들을 확인하는 쿼리문을 작성하세요. 컴공과 번호는 160
-- 학번: 년도 4자리 + 과번호 3자리 + 이름순 3자리
SELECT * FROM student WHERE st_num LIKE '____160%';

-- 컴공 학생 + 끝자리가 160으로 끝나는 학생
SELECT * FROM student WHERE st_num LIKE '%160%';

-- 학생들 중 여학생들을 확인하는 쿼리문을 작성하세요.
SELECT * FROM student WHERE st_reg_num LIKE '_______4%' OR st_reg_num LIKE '______-2%';
SELECT * FROM student WHERE st_reg_num LIKE '%-4%' OR st_reg_num LIKE '%-2%';

-- 학생들 정보를 이름순으로 정렬하는 쿼리문
SELECT * FROM student ORDER BY st_name ASC, st_num DESC;

