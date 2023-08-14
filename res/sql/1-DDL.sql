drop table board;
drop table member;
drop table diner;

create table file_up (
    file_id number(5) generated always as identity(start with 1 increment by 1) primary key not null,
    orgnm varchar2(50) not null,
    savednm varchar2(100) not null,
    savedpath varchar2(200) not null,
    content_type varchar2(30) not null
);

create table diner (
    seq number(5) generated always as identity(start with 1 increment by 1) primary key not null,
    name varchar2(60) not null,
    location varchar2(120) not null,
    category varchar2(30) not null,
    file_id number(5),
    foreign key (file_id) references file_up (file_id)
);

create table member (
    email varchar2(60) primary key not null,
    nickname varchar2(30) not null,
    pwd varchar(60) not null,
    name varchar2(30),
    ph varchar2(11),
    age number(3)
);

create table board (
    seq number(7) generated always as identity(start with 1 increment by 1) primary key not null,
    title varchar2(30),
    content long not null,
    rdate date default sysdate not null,
    writer varchar2(60) not null,
    foreign key (writer) references member (email),
    diner_seq number(5) not null,
    foreign key (diner_seq) references diner (seq),
    parent number(7),
    foreign key (parent) references board (seq),
    file_id number(5),
    foreign key (file_id) references file_up (file_id)
);
