/* 스포츠, 연예, 일반 뉴스를 관리하는 사이트를 구축하기 위한 ERD를 설계하세요
- 네이버 뉴스 참고
- 뉴스 등록, 수정, 삭제 기능
- 댓글 기능
- 좋아요, 싫어요 기능 
- 일반, 스포츠, 연예 뉴스를 하나로 관리 

[테이블]
- 뉴스
	-뉴스번호(PK), 제목, 내용, 기자번호(FK), 작성일, 최종수정일, 신문사, 대분류(일반/스포츠/연예), 중분류(경제,정치/야구,축구 등)
- 기자
	- 기자번호(PK), 이름, 주민번호, 구독자수, 응원수, 소속신문사 
- 회원
	- 아이디(PK), 비번
- 댓글 
	- 댓글번호, 뉴스번호(FK), 아이디(FK), 댓글내용, 공감, 비공감, 답글번호(FK), 작성일 
- 반응 
	- 반응번호(PK), 뉴스번호(FK), 아이디(FK), 상태(좋아요, 훈훈해요, 슬퍼요)
*/

CREATE DATABASE news;
USE news;

CREATE TABLE `news` (
	`nw_num`	INT	NOT NULL,
	`nw_title`	VARCHAR(50)	NULL,
	`nw_contents`	LONGTEXT	NULL,
	`nw_reg_date`	DATETIME	NULL,
	`nw_update`	DATETIME	NULL,
	`nw_company`	VARCHAR(50)	NULL,
	`nw_main_category`	VARCHAR(50)	NULL,
	`nw_sub_category`	VARCHAR(50)	NULL,
	`j_num`	INT	NOT NULL
);

CREATE TABLE `journalist` (
	`j_num`	INT	NOT NULL,
	`j_name`	VARCHAR(50)	NULL,
	`j_reg_num`	CHAR(14)	NULL,
	`j_company`	VARCHAR(50)	NULL
);

CREATE TABLE `member` (
	`me_id`	VARCHAR(50)	NOT NULL,
	`me_pw`	VARCHAR(255)	NULL
);

CREATE TABLE `comment` (
	`co_num`	INT	NOT NULL,
	`me_id`	VARCHAR(50)	NOT NULL,
	`nw_num`	INT	NOT NULL,
	`co_contents`	LONGTEXT	NULL,
	`co_up`	INT	NULL,
	`co_down`	INT	NULL,
	`co_date`	DATE	NULL,
	`co_del`	CHAR(1)	NULL,
	`co_com_num`	INT	NOT NULL
);

CREATE TABLE `reaction` (
	`re_num`	INT	NOT NULL,
	`re_state`	VARCHAR(10)	NULL,
	`me_id`	VARCHAR(50)	NOT NULL,
	`nw_num`	INT	NOT NULL
);

ALTER TABLE `news` ADD CONSTRAINT `PK_NEWS` PRIMARY KEY (
	`nw_num`
);

ALTER TABLE `journalist` ADD CONSTRAINT `PK_JOURNALIST` PRIMARY KEY (
	`j_num`
);

ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`me_id`
);

ALTER TABLE `comment` ADD CONSTRAINT `PK_COMMENT` PRIMARY KEY (
	`co_num`
);

ALTER TABLE `reaction` ADD CONSTRAINT `PK_REACTION` PRIMARY KEY (
	`re_num`
);

ALTER TABLE `news` ADD CONSTRAINT `FK_journalist_TO_news_1` FOREIGN KEY (
	`j_num`
)
REFERENCES `journalist` (
	`j_num`
);

ALTER TABLE `comment` ADD CONSTRAINT `FK_member_TO_comment_1` FOREIGN KEY (
	`me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `comment` ADD CONSTRAINT `FK_news_TO_comment_1` FOREIGN KEY (
	`nw_num`
)
REFERENCES `news` (
	`nw_num`
);

ALTER TABLE `comment` ADD CONSTRAINT `FK_comment_TO_comment_1` FOREIGN KEY (
	`co_com_num`
)
REFERENCES `comment` (
	`co_num`
);

ALTER TABLE `reaction` ADD CONSTRAINT `FK_member_TO_reaction_1` FOREIGN KEY (
	`me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `reaction` ADD CONSTRAINT `FK_news_TO_reaction_1` FOREIGN KEY (
	`nw_num`
)
REFERENCES `news` (
	`nw_num`
);

