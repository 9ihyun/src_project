create table member_user(
user_id VARCHAR2(20) not null constraint id_pk primary key,
nickname VARCHAR2(10) not null UNIQUE,
pw VARCHAR2(20) not null,
birth NUMBER(8) not null,
pwq VARCHAR2(60) not null,
pwa VARCHAR2(60) not null,
regdate VARCHAR2(30) not null
);

SELECT * FROM tab;
select * from member_user;

create table taglist(
tag_no NUMBER(10) not null constraint tag_no_pk primary key,
tag_name VARCHAR2(30) not null);

drop table study_state;
drop table study_day;

create table study_state(
state_no NUMBER(2) not null constraint state_no_pk primary key,
state_name VARCHAR2(30) not null);

create table study_day(
day_no NUMBER(2) not null constraint day_no_pk primary key,
day_name VARCHAR2(30) not null);

create table study(
study_no NUMBER(10) not null constraint study_no_pk primary key,
tag_no NUMBER(10) constraint tag_no_fk references taglist(tag_no),
user_id VARCHAR2(20) constraint user_id_fk references member_user(user_id),
state_no NUMBER(2) constraint state_no_fk references study_state(state_no),
day_no NUMBER(2) constraint day_no_fk references study_day(day_no),
study_maxnum NUMBER(10) not null,
study_location_si VARCHAR2(20),
study_location_gu VARCHAR2(20),
study_duedate VARCHAR2(30),
study_title VARCHAR2(60) not null,
study_content VARCHAR2(4000) not null,
study_regdate date not null
);

ALTER TABLE study MODIFY (study_regdate DEFAULT SYSDATE);




create table board(
board_no NUMBER(10) not null constraint board_no_pk primary key,
board_name VARCHAR2(30) not null);


create table post(
post_no NUMBER(10) not null constraint post_no_pk primary key,
tag_no NUMBER(10) constraint tag2_no_fk references taglist(tag_no),
board_no NUMBER(10) not null constraint board_no_fk references board(board_no),
user_id VARCHAR2(20) not null constraint user2_id_fk references member_user(user_id),
post_title VARCHAR2(100) not null,
post_date date not null,
post_content VARCHAR2(4000) not null,
post_up NUMBER(5)
);

ALTER TABLE post MODIFY (post_date DEFAULT SYSDATE);

drop table post;

create table study_reply(
s_reply_no NUMBER(10) not null constraint study_reply_no_pk primary key,
study_no NUMBER(10) not null constraint study_no_fk references study(study_no),
user_id VARCHAR2(20) not null constraint user3_id_fk references member_user(user_id),
s_reply_content VARCHAR2(300) not null,
s_reply_date date not null
);
ALTER TABLE study_reply MODIFY (s_reply_date DEFAULT SYSDATE);
drop table study_reply;

create table post_reply(
p_reply_no NUMBER(10) not null constraint post_reply_pk primary key,
post_no NUMBER(10) not null constraint post_no_fk references post(post_no),
user_id VARCHAR2(20) not null constraint user4_id_fk references member_user(user_id),
p_reply_content VARCHAR2(300) not null,
p_reply_date date not null
);

ALTER TABLE post_reply MODIFY (p_reply_date DEFAULT SYSDATE);

create table study_room(
chat_no NUMBER(10) not null constraint chat_no_pk primary key,
study_no NUMBER(10) not null constraint study2_no_fk references study(study_no),
nickname VARCHAR2(30) not null constraint nickname_fk references member_user(nickname),
chat_content VARCHAR2(500) not null,
chat_date date not null
);

ALTER TABLE study_room MODIFY (chat_date DEFAULT SYSDATE);



create table studysign_state(
signstate_no NUMBER(2) not null constraint signstate_no_pk primary key,
signstate_name VARCHAR2(30) not null);

create table study_state(
state_no NUMBER(2) not null constraint state_no_pk primary key,
state_name VARCHAR2(30) not null);

create table study_day(
day_no NUMBER(2) not null constraint day_no_pk primary key,
day_name VARCHAR2(30) not null);


select * from study_day;


create table wish_study(
user_id VARCHAR2(20) not null constraint user5_id_fk references member_user(user_id),
study_no NUMBER(10) not null constraint study5_no_fk references study(study_no)
);


create table sign_study(
user_id VARCHAR2(20) not null constraint user6_id_fk references member_user(user_id),
study_no NUMBER(10) not null constraint study6_no_fk references study(study_no),
state_no NUMBER(2) not null constraint state2_no_fk references study_state(state_no)
);


create table point(
user_id VARCHAR2(20) not null constraint user7_id_fk references member_user(user_id),
point_number number(1) not null);


insert into studysign_state values(1,'수락대기');
insert into studysign_state values(2,'수락완료');

insert into study_state values(1,'모집중');
insert into study_state values(2,'스터디진행중');
insert into study_state values(3,'스터디종료');

insert into study_day values(1,'무관');
insert into study_day values(2,'평일');
insert into study_day values(3,'주말');


select * from studysign_state;
select * from study_state;
select * from study_day;

insert into taglist values(1,'C/C++');
insert into taglist values(2,'Python');
insert into taglist values(3,'Python');
insert into taglist values(4,'Go');
insert into taglist values(5,'swift');
insert into taglist values(6,'Perl');
insert into taglist values(7,'Java');
insert into taglist values(8,'Kotlin');
insert into taglist values(9,'JavaScript');
insert into taglist values(10,'Vue.js');
insert into taglist values(11,'React');
insert into taglist values(12,'node.js');
insert into taglist values(13,'Typescript');
insert into taglist values(14,'Ajax');
insert into taglist values(15,'JQuery');
insert into taglist values(16,'HTML');
insert into taglist values(17,'CSS');
insert into taglist values(18,'spring');
insert into taglist values(19,'JPA');
insert into taglist values(20,'Ruby');
insert into taglist values(21,'Mysql');
insert into taglist values(22,'ORACLE');
insert into taglist values(23,'git');
insert into taglist values(24,'Linux');
insert into taglist values(25,'Ubuntu');
insert into taglist values(26,'프론트엔드');
insert into taglist values(27,'백엔드');
insert into taglist values(28,'토이프로젝트');
insert into taglist values(29,'기타');

select * from taglist;

insert into board values(1,'자유게시판');
insert into board values(2,'정보공유게시판');


insert into member_user values('admin','관리자','admin',20211014,'가장 좋아하는 것은?','치킨',sysdate);


select * from member_user;

insert into post values(1,1,1,'admin','테스트 입니다',sysdate,'하핳 반갑습니다 여러분 화이팅~!!',0);

insert into post_reply values(1,1,'admin','테스트 댓글 입니다',sysdate);
insert into post_reply values(2,1,'admin','테스트 댓글2 입니다',sysdate);

insert into study values(1,2,'admin',1,1,5,'서울시','강남구','2021.10.14','테스트 입니다','사람만 들어오세요',sysdate);

insert into wish_study values('admin',1);

insert into sign_study values('admin',1,1);

insert into point values('admin',5);
insert into point values('admin',4);
insert into point values('admin',4);

commit;