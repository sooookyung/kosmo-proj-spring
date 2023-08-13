create table diner (
    seq number(5) generated always as identity(start with 1 increment by 1) primary key not null,
    name varchar2(60) not null,
    location varchar2(120) not null,
    category varchar2(30) not null
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
    title varchar2(30) not null,
    content long not null,
    writer varchar2(60) not null,
    foreign key (writer) references member (email),
    diner_seq number(5) not null,
    foreign key (diner_seq) references diner (seq),
    parent number(7),
    foreign key (parent) references board (seq)
);