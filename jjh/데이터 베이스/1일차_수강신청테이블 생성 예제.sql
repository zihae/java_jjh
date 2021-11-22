use university;
explain professor;

-- 수강테이블(course)
drop table if exists course;
CREATE TABLE course(
	co_num INT AUTO_INCREMENT,
    co_st_num CHAR(10) NOT NULL,
    co_su_num INT NOT NULL,
    co_score VARCHAR(4), 
    CONSTRAINT PRIMARY KEY(co_num),
    constraint foreign key(co_st_num) references student(st_num));

    explain course;
    
-- 강의 테이블(lecture)
CREATE TABLE lecture(
	le_num INT AUTO_INCREMENT,
    le_pr_num CHAR(10) NOT NULL,
    le_su_num INT NOT NULL,
    CONSTRAINT PRIMARY KEY(le_num),
    constraint foreign key(le_pr_num) references professor(pr_num));
   


