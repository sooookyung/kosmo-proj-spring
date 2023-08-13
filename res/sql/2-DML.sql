insert into MEMBER (email, nickname, pwd, name, ph, age) values ('bhs123@bhs.com', 'admin', '1234', '관리자', '01000000000', 30);
insert into MEMBER (email, nickname, pwd, name, ph, age) values ('sol@bhs.com', 'sol', '1234', '배솔반', '01012341234', 28);
insert into MEMBER (email, nickname, pwd, name, ph, age) values ('hsk@bhs.com', 'hsk', '1234', '홍수경', '01003568900', 20);
insert into MEMBER (email, nickname, pwd, name, ph, age) values ('sang@bhs.com', 'sang', '1234', '서상록', '01014702580', 25);

insert into diner (name, location, category) values ('카레', '성북구', '인도');
insert into diner (name, location, category) values ('야상해', '용산구', '중식');

insert into board (title, content, writer, diner_seq, parent) values ('여기 맛있음', 'ㄱㄱ', 'sol@bhs.com', 3, null);
insert into board (title, content, writer, diner_seq, parent) values ('', 'ㄹㅇ', 'sol@bhs.com', 3, 1);
