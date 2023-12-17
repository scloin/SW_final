DROP DATABASE asdf;
DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS movie;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS booking;
CREATE DATABASE asdf;
CREATE TABLE review(
	movidCD int, 
	id varchar(10), 
	rating int,
    primary key(movidCD, id)
	);

CREATE TABLE movie
	(
    movidCD int primary key, 
    movieNm varchar(50), 
    opendt char(8), 
    prdtstatNm varchar(10),
    genreAlt varchar(10),
    directors varchar(25),
    poster varchar(25)
    );
    
CREATE TABLE user(
	id varchar(10) primary key,
    name varchar(10),
    pw varchar(15),
    age int,
    sex char(1),
    authority bool
	);

CREATE TABLE booking(
	movidCD int,
    id varchar(10),
    time char(10),
    seat varchar(50),
    theater int,
    adult int,
    teenager int,
    price int,
    primary key(movidCD, id)
	);

insert into review
value
(20227762, 'mark', 5),
(20234114, 'nunomi0', 3),
(20212866, '4-head', 4),
(20234114, 'scloin', 2),
(20212866, 'user0', 4),
(20212866, 'user1', 5),
(20212866, 'user2', 3),
(20212866, 'user3', 4),
(20212866, 'user4', 3),
(20212866, 'user5', 2),
(20212866, 'user6', 5),
(20212866, 'user7', 3),
(20212866, 'user8', 2),
(20212866, 'user9', 4),
(20235030, 'user10', 4),
( 20202247,"mark",5),
(20202247 ,"4-head",4),
( 20202247,"nunomi0",3),
(20202247 ,"scloin",2),
( 20202247,"scloin",3),
( 20234957,"4-head",4),
( 20234957,"mark",5)	;


insert into movie
value
(20227762, '올빼미', '20221123', '종영', '스릴러', '안태진', 'image/poster1.png'),
(20212015, '돈 룩 업', '20211208', '종영', 'SF', '아담 맥케이', 'image/poster2.png'),
(20212866, '서울의 봄', '20231122', '상영 중', '드라마', '김성수', 'image/poster3.png'),
(20202247, '싱글 인 서울', '20231129', '상영 중', '코미디', '박범수', 'image/poster4.png'),
(20234114, '괴물', '20231129', '상영 중', '드라마', '고레에다 히로카즈', 'image/poster5.png'),
(20235030, '프레디의 피자가게', '20231115', '상영 중', '스릴러', '엠마 타미', 'image/poster6.png'),
(20234664, '그대들은 어떻게 살 것인가', '20231025', '상영 중', '애니메이션', '미야자키 하야오', 'image/poster7.png'),
(20234957, '스노우 폭스: 썰매개가 될 거야!', '20231123', '상영 중', '애니메이션', '아론 우들리', 'image/poster8.png'),
(20136803, '겨울왕국', '20140116', '상영 중', '애니메이션', '크리스 벅, 제니퍼 리', 'image/poster10.png'),
(20234798, '극장판 우당탕탕 은하안전단: 진정한 용기!', '20231130', '상영 중', '애니메이션', '정지훈', 'image/poster11.png'),
(20232536, '명탐정코난: 흑철의 어영', '20230720', '상영 중', '애니메이션', '타치카와 유즈루', 'image/poster12.png'),
(20203702, '노량: 죽음의 바다', '20231220', '개봉예정', '액션', '김한민', 'image/poster13.png'),
(20235698, '쏘우 X', '20231213', '개봉예정', '스릴러', '케빈 그루터트', 'image/poster14.png'),
(20239988, '아쿠아맨과 로스트 킹덤', '20231220', '개봉예정', '액션', '제임스 완', 'image/poster15.png'),
(20230011, '트롤: 밴드 투게더', '20231220', '개봉예정', '애니메이션', '월트 돈', 'image/poster16.png'),
(20240000, '지옥 2', '미정', '개봉예정', '스릴러', '연상호', 'image/poster17.png');

insert into user
value
('mark', '이민형', '8888', 25, 'M', FALSE),
('nunomi0', '이유경', '1111', 23, 'F', TRUE),
('4-head', '임아현', '2222', 23, 'F', TRUE),
('scloin', '장수호', '3333', 25, 'M', TRUE),
('user0', '문유정', '1234', 62, 'M', FALSE),
('user1', '권준용', '1234', 53, 'M', FALSE),
('user2', '홍호영', '1234', 48, 'M', FALSE),
('user3', '봉정주', '1234', 44, 'M', FALSE),
('user4', '강용현', '1234', 17, 'M', FALSE),
('user5', '김경선', '1234', 61, 'F', FALSE),
('user6', '이범준', '1234', 26, 'F', FALSE),
('user7', '추수희', '1234', 50, 'F', FALSE),
('user8', '윤광현', '1234', 24, 'F', FALSE),
('user9', '김예훈', '1234', 54, 'F', FALSE),
('user10', '신동윤', '1234', 37, 'F', FALSE),
('minjung','하민정', '2243', 45, 'F', FALSE),
('han','한정희', '5561', 17, 'F', FALSE),
('jaehawn','이재환', '0204', 17, 'M', FALSE),
('junsun','안준선', '0205', 17, 'M', FALSE);	

insert into booking
value
(20212866, 'mark', '231204', 'A6', 2, 1, 0, 8000),
(20212866, '4-head', '231204', 'A7', 2, 1, 0, 8000),
(20212866, 'user0', '231204', 'B4, B5, B6, B7', 2, 2, 2, 26000),
(20212866, 'user1', '231204', 'C10, C11, E10, E9', 2, 4, 0, 32000),
(20212866, 'user2', '231204', 'E5, E6', 2, 0, 2, 10000),
(20212866, 'user3', '231204', 'G7, G8, G9', 2, 3, 0, 24000),
(20212866, 'user4', '231204', 'F2, F3, F4, F5, F6, F7, F8', 2, 1, 6, 38000),
(20212866, 'user5', '231204', 'A1,A2,A3', 2, 0, 3, 15000),
(20212866, 'user6', '231204', 'B8, B9, C8, C9', 2, 4, 0, 32000),
(20212866, 'user7', '231204', 'A1, A2', 2, 1, 1, 13000),
(20212866, 'user8', '231204', 'G2, G3, G4', 2, 3, 0, 24000),
(20212866, 'user9', '231204', 'E1, E2, E3, E4, E5, E6, E7, E8', 2, 8, 0, 64000),
(20235030, 'user10', '231204', 'A6', 1, 1, 0, 8000),
(20235030, 'scloin', '231204', 'A7', 1, 1, 0, 8000),
(20235030, 'user0', '231204', 'B4, B5, B6, B7', 1, 2, 2, 26000),
(20235030, 'user4', '231204', 'C10, C11, E10, E11', 1, 4, 0, 32000),
(20235030, 'user6', '231204', 'E5, E6', 1, 0, 2, 10000),
(20235030, 'user7', '231204', 'G7, G8, G9', 1, 3, 0, 24000),
(20234114, 'scloin', '231204', 'F2, F3, F4, F5, F6, F7, F8', 3, 1, 6, 38000),
(20234114, '4-head', '231204', 'A6', 3, 1, 0, 8000),
(20234114, 'nunomi0', '231204', 'A7', 3, 1, 0, 8000),
(20234114, 'user5', '231204', 'B4, B5, B6, B7', 3, 2, 2, 26000),
(20234114, 'user6', '231204', 'C10, C11, E10, E11', 3, 1, 3, 23000),
(20234114, 'user3', '231204', 'E5, E6', 3, 2, 0, 16000);
