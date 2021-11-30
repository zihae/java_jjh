/* 영화 티켓 예매 사이트를 구축하기 위한 ERD를 설계하세요
-CGV 참고
-예매는 회원만 가능
-예매는 한 번에 여러 좌석 가능 
- [테이블]
- 영화 
	- 영화번호(PK), 제목, 연령, 런닝타임, 개봉일, 영화상세 
- 영화장르 
	- 영화장르번호(PK), 영화번호(FK), 장르명(FK)
- 장르
	- 장르명(PK)
- 인물
	- 인물번호(PK), 이름, 출생, 국적, 직업, 학력, 가족, 취미, 신체, 사이트, 바이오그래피  
    - 가족을 테이블로 관리할 수 있지만 영화와 관련해서 배우 가족은 중요한게 아니기 때문에 하나의 속성으로 관리 
    - 학력은 최종학력만 기술
    - 취미도 테이블로 만들 수 있짐나 속성으로 관리 
    - 직업도 테이블로 만들 수 있지만 속성으로 관리 
- 참여 
	- 참여번호(PK), 영화번호(FK), 인물번호(FK), 역할 
- 극장 
	- 극장번호(PK), 지역, 지점명, 주소, 교통안내, 주차안내, 관 개수, 총 좌석
- 좌석
	- 좌석번호(PK), 좌석명, 극장번호(FK), 관번호, 좌석상태(코로나 때문에 비워둬야 하는 좌석), 좌석타입  
- 상영시간 
	- 상영번호(PK), 영화번호(FK), 극장번호(FK), 상영시간, 관번호, 옵션(2D,4D), 총좌석, 예약가능좌석수 
- 회원
	- 아이디, 비번 
- 예매 
	- 예매번호(PK), 아이디(FK), 상영번호(FK), [영화명], 좌석번호(FK)  
- 예매 리스트
	-예매리스트번호(PK), 예매번호(FK), 좌석번호(FK)
*/

CREATE DATABASE cgv;
USE cgv;
CREATE TABLE `movie` (
	`mo_num`	INT	NOT NULL,
	`mo_title`	VARCHAR(50)	NULL,
	`mo_age`	VARCHAR(50)	NULL,
	`mo_runtime`	INT	NULL,
	`mo_date`	DATE	NULL,
	`mo_detail`	LONGTEXT	NULL
);

CREATE TABLE `genre` (
	`gr_name`	VARCHAR(50)	NOT NULL
);

CREATE TABLE `movie_genre` (
	`mg_num`	INT	NOT NULL,
	`mg_gr_name`	VARCHAR(50)	NOT NULL,
	`mg_mo_num`	INT	NOT NULL
);

CREATE TABLE `character` (
	`ch_num`	INT	NOT NULL,
	`ch_name`	VARCHAR(50)	NULL,
	`ch_birth`	VARCHAR(10)	NULL,
	`ch_nationality`	VARCHAR(50)	NULL,
	`ch_job`	VARCHAR(50)	NULL
);

CREATE TABLE `Untitled` (
	`pt_num`	INT	NOT NULL,
	`pt_mo_num`	INT	NOT NULL,
	`pt_ch_num`	INT	NOT NULL,
	`pt_role`	VARCHAR(50)	NULL
);

CREATE TABLE `theater` (
	`th_num`	INT	NOT NULL,
	`th_area`	VARCHAR(50)	NULL,
	`th_name`	VARCHAR(50)	NULL,
	`th_address`	VARCHAR(50)	NULL,
	`th_traffic`	LONGTEXT	NULL,
	`th_parking`	LONGTEXT	NULL,
	`th_room_count`	INT	NULL,
	`th_seat_count`	INT	NULL
);

CREATE TABLE `seat` (
	`st_num`	INT	NOT NULL,
	`st_name`	CHAR(3)	NULL,
	`st_th_num`	INT	NOT NULL,
	`st_room_num`	INT	NULL,
	`st_state`	VARCHAR(50)	NULL,
	`st_type`	VARCHAR(50)	NULL
);

CREATE TABLE `schedule` (
	`sc_num`	INT	NOT NULL,
	`sc_mo_num`	INT	NOT NULL,
	`sc_th_num`	INT	NOT NULL,
	`sc_date`	DATE	NULL,
	`sc_time`	VARCHAR(5)	NULL,
	`sc_room_num`	INT	NULL,
	`sc_option`	VARCHAR(10)	NULL,
	`sc_total_seat`	INT	NULL,
	`sc_seat`	INT	NULL
);

CREATE TABLE `member` (
	`me_id`	VARCHAR(50)	NOT NULL,
	`me_pw`	VARCHAR(255)	NULL
);

CREATE TABLE `ticketing` (
	`tk_num`	VARCHAR(10)	NOT NULL,
	`sc_num`	INT	NOT NULL,
	`me_id`	VARCHAR(50)	NOT NULL
);

CREATE TABLE `ticketing_list` (
	`tl_num`	INT	NOT NULL,
	`tk_num`	VARCHAR(10)	NOT NULL,
	`st_num`	INT	NOT NULL
);

ALTER TABLE `movie` ADD CONSTRAINT `PK_MOVIE` PRIMARY KEY (
	`mo_num`
);

ALTER TABLE `genre` ADD CONSTRAINT `PK_GENRE` PRIMARY KEY (
	`gr_name`
);

ALTER TABLE `movie_genre` ADD CONSTRAINT `PK_MOVIE_GENRE` PRIMARY KEY (
	`mg_num`
);

ALTER TABLE `character` ADD CONSTRAINT `PK_CHARACTER` PRIMARY KEY (
	`ch_num`
);

ALTER TABLE `Untitled` ADD CONSTRAINT `PK_UNTITLED` PRIMARY KEY (
	`pt_num`
);

ALTER TABLE `theater` ADD CONSTRAINT `PK_THEATER` PRIMARY KEY (
	`th_num`
);

ALTER TABLE `seat` ADD CONSTRAINT `PK_SEAT` PRIMARY KEY (
	`st_num`
);

ALTER TABLE `schedule` ADD CONSTRAINT `PK_SCHEDULE` PRIMARY KEY (
	`sc_num`
);

ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`me_id`
);

ALTER TABLE `ticketing` ADD CONSTRAINT `PK_TICKETING` PRIMARY KEY (
	`tk_num`
);

ALTER TABLE `ticketing_list` ADD CONSTRAINT `PK_TICKETING_LIST` PRIMARY KEY (
	`tl_num`
);

ALTER TABLE `movie_genre` ADD CONSTRAINT `FK_genre_TO_movie_genre_1` FOREIGN KEY (
	`mg_gr_name`
)
REFERENCES `genre` (
	`gr_name`
);

ALTER TABLE `movie_genre` ADD CONSTRAINT `FK_movie_TO_movie_genre_1` FOREIGN KEY (
	`mg_mo_num`
)
REFERENCES `movie` (
	`mo_num`
);

ALTER TABLE `Untitled` ADD CONSTRAINT `FK_movie_TO_Untitled_1` FOREIGN KEY (
	`pt_mo_num`
)
REFERENCES `movie` (
	`mo_num`
);

ALTER TABLE `Untitled` ADD CONSTRAINT `FK_character_TO_Untitled_1` FOREIGN KEY (
	`pt_ch_num`
)
REFERENCES `character` (
	`ch_num`
);

ALTER TABLE `seat` ADD CONSTRAINT `FK_theater_TO_seat_1` FOREIGN KEY (
	`st_th_num`
)
REFERENCES `theater` (
	`th_num`
);

ALTER TABLE `schedule` ADD CONSTRAINT `FK_movie_TO_schedule_1` FOREIGN KEY (
	`sc_mo_num`
)
REFERENCES `movie` (
	`mo_num`
);

ALTER TABLE `schedule` ADD CONSTRAINT `FK_theater_TO_schedule_1` FOREIGN KEY (
	`sc_th_num`
)
REFERENCES `theater` (
	`th_num`
);

ALTER TABLE `ticketing` ADD CONSTRAINT `FK_schedule_TO_ticketing_1` FOREIGN KEY (
	`sc_num`
)
REFERENCES `schedule` (
	`sc_num`
);

ALTER TABLE `ticketing` ADD CONSTRAINT `FK_member_TO_ticketing_1` FOREIGN KEY (
	`me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `ticketing_list` ADD CONSTRAINT `FK_ticketing_TO_ticketing_list_1` FOREIGN KEY (
	`tk_num`
)
REFERENCES `ticketing` (
	`tk_num`
);

ALTER TABLE `ticketing_list` ADD CONSTRAINT `FK_seat_TO_ticketing_list_1` FOREIGN KEY (
	`st_num`
)
REFERENCES `seat` (
	`st_num`
);

