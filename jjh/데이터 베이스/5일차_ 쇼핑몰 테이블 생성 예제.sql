/* 의류 쇼핑몰을 구축하려 한다. 이때 필요한 테이블 구조를 잡아보세요.
- 장바구니 기능 x, 한 제품의 옵션을 하나만 선택해서 여러개 구매할 수 있다 
	- A제품 빨강 L 
    - A제품 파랑 L 
    - 위 두 제품을 구매하려면 A제품 빨강 L을 구매 후 A제품 파랑 L제품을 구매해야 한다 
- 의류 구매 가능
- 배송 정보는 회원 주소로 사용(고정)
- 결제 정보 관리 X
- 구매는 회원만 가능
- 쿠폰, 할인 X 
- 제품 
	-분류 방법
		-대분류로 상의/하의 등으로 구분 후 증분류로 상의에 가디건/니트, 민소매 등으로 분류
	- 옵션 
		-색상, 사이즈 선택 가능
        -색상은 한글로 표기
        -제품은 재고량이 있는 제품만 선택 가능
        -제품의 나믕ㄴ 재고량을 보여줌
- 동일한 제품 X
- 회원
	- 내국인만 가능
*/
CREATE DATABASE shoppingmall;
USE shoppingmall;


CREATE TABLE `goods` (
	`gd_num`	VARCHAR(10)	NOT NULL,
	`gd_name`	VARCHAR(50)	NULL,
	`gd_price`	INT	NULL,
	`gd_detail`	LONGTEXT	NULL,
	`gd_ca_num`	INT	NOT NULL
);

CREATE TABLE `option` (
	`op_num`	INT	NOT NULL AUTO_INCREMENT,
	`op_color`	VARCHAR(10)	NULL,
	`op_size`	VARCHAR(10)	NULL,
	`op_stock`	VARCHAR(255)	NULL,
	`op_gd_num`	VARCHAR(10)	NOT NULL,
    PRIMARY KEY(op_num)
);

CREATE TABLE `category` (
	`ca_num`	INT	NOT NULL AUTO_INCREMENT,
	`ca_main`	VARCHAR(10)	NULL,
	`ca_sub`	VARCHAR(10)	NULL,
    PRIMARY KEY(ca_num)
);

CREATE TABLE `member` (
	`me_id`	VARCHAR(20)	NOT NULL,
	`me_pw`	VARCHAR(255)	NULL,
	`me_name`	VARCHAR(30)	NULL,
	`me_phone`	VARCHAR(13)	NULL,
	`me_gender`	VARCHAR(10)	NULL,
	`me_ad_num`	INT	NOT NULL
);


CREATE TABLE `address` (
	`ad_num`	INT	NOT NULL AUTO_INCREMENT,
	`ad_nickname`	VARCHAR(50)	NULL,
	`ad_address`	VARCHAR(50)	NULL,
	`ad_post_num`	VARCHAR(10)	NULL,
	`ad_detail`	VARCHAR(50)	NULL,
    PRIMARY KEY(ad_num)
);

CREATE TABLE `order` (
	`or_num`	VARCHAR(15)	NOT NULL,
	`or_me_id`	VARCHAR(20)	NOT NULL,
	`or_op_num`	INT	NOT NULL,
	`or_date`	DATETIME	NULL,
	`or_amount`	INT	NULL,
	`or_total_price`	INT	NULL,
	`or_state`	VARCHAR(10)	NULL
);

CREATE TABLE `review` (
	`re_num`	INT	NOT NULL AUTO_INCREMENT,
	`re_title`	VARCHAR(100)	NULL,
	`re_contents`	VARCHAR(150)	NULL,
	`re_date`	DATETIME	NULL,
	`re_gd_num`	VARCHAR(10)	NOT NULL,
	`re_me_id`	VARCHAR(20)	NOT NULL,
    PRIMARY KEY(re_num)
);


ALTER TABLE `goods` ADD CONSTRAINT `PK_GOODS` PRIMARY KEY (
	`gd_num`
);



ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`me_id`
);


ALTER TABLE `address` ADD CONSTRAINT `PK_ADDRESS` PRIMARY KEY (
	`ad_num`
);

ALTER TABLE `order` ADD CONSTRAINT `PK_ORDER` PRIMARY KEY (
	`or_num`
);



ALTER TABLE `goods` ADD CONSTRAINT `FK_category_TO_goods_1` FOREIGN KEY (
	`gd_ca_num`
)
REFERENCES `category` (
	`ca_num`
);

ALTER TABLE `option` ADD CONSTRAINT `FK_goods_TO_option_1` FOREIGN KEY (
	`op_gd_num`
)
REFERENCES `goods` (
	`gd_num`
);

ALTER TABLE `member` ADD CONSTRAINT `FK_address_TO_member_1` FOREIGN KEY (
	`me_ad_num`
)
REFERENCES `address` (
	`ad_num`
);

ALTER TABLE `order` ADD CONSTRAINT `FK_member_TO_order_1` FOREIGN KEY (
	`or_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `order` ADD CONSTRAINT `FK_option_TO_order_1` FOREIGN KEY (
	`or_op_num`
)
REFERENCES `option` (
	`op_num`
);

ALTER TABLE `review` ADD CONSTRAINT `FK_goods_TO_review_1` FOREIGN KEY (
	`re_gd_num`
)
REFERENCES `goods` (
	`gd_num`
);

ALTER TABLE `review` ADD CONSTRAINT `FK_member_TO_review_1` FOREIGN KEY (
	`re_me_id`
)
REFERENCES `member` (
	`me_id`
);


