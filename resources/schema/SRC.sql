--회원
CREATE TABLE MEMBER_USER(
    USER_ID VARCHAR2(20) CONSTRAINT USER_ID_PK PRIMARY KEY,
    NICKNAME VARCHAR2(30) NOT NULL UNIQUE,
    PW VARCHAR2(20) NOT NULL,
    BIRTH NUMBER(8) NOT NULL,
    PWQ VARCHAR2(60) NOT NULL,
    PWA VARCHAR2(60) NOT NULL,
    REGDATE DATE DEFAULT SYSDATE NOT NULL
);

--별점 평가
CREATE TABLE POINT(
    USER_ID VARCHAR2(20) NOT NULL CONSTRAINT POINT_ID_FK REFERENCES MEMBER_USER(USER_ID) ON DELETE CASCADE,
    POINT_NUMBER NUMBER(1) NOT NULL
);

--태그
CREATE TABLE TAGLIST(
    TAG_NO NUMBER(10) CONSTRAINT TAG_NO_PK PRIMARY KEY,
    TAG_NAME VARCHAR2(30) NOT NULL
);

--게시판 유형
CREATE TABLE BOARD(
    BOARD_NO NUMBER(10) CONSTRAINT BOARD_NO_PK PRIMARY KEY,
    BOARD_NAME VARCHAR2(30) NOT NULL
);

--게시판 게시글
CREATE TABLE POST(
    POST_NO NUMBER(10) CONSTRAINT POST_NO_PK PRIMARY KEY,
    TAG_NO NUMBER(10) NOT NULL CONSTRAINT POST_TAG_FK REFERENCES TAGLIST(TAG_NO),
    BOARD_NO NUMBER(10) NOT NULL CONSTRAINT POST_BOARD_FK REFERENCES BOARD(BOARD_NO),
    USER_ID VARCHAR2(20) NOT NULL CONSTRAINT POST_ID_FK REFERENCES MEMBER_USER(USER_ID) ON DELETE CASCADE,
    POST_TITLE VARCHAR2(100) NOT NULL,
    POST_DATE DATE DEFAULT SYSDATE NOT NULL,
    POST_CONTENT VARCHAR2(4000) NOT NULL,
    POST_UP NUMBER(5) DEFAULT 0 NOT NULL
);

--게시판 댓글
CREATE TABLE POST_REPLY(
    P_REPLY_NO NUMBER(10) CONSTRAINT P_REPLY_NO_PK PRIMARY KEY,
    POST_NO NUMBER(10) NOT NULL CONSTRAINT POST_NO_FK REFERENCES POST(POST_NO) ON DELETE CASCADE,
    USER_ID VARCHAR2(20) NOT NULL CONSTRAINT P_REPLY_ID_FK REFERENCES MEMBER_USER(USER_ID) ON DELETE CASCADE,
    P_REPLY_CONTENT VARCHAR2(300) NOT NULL,
    P_REPLY_DATE DATE DEFAULT SYSDATE NOT NULL
);

--스터디 상태
CREATE TABLE STUDY_STATE(
    STATE_NO NUMBER(2) CONSTRAINT STUDY_STATE_PK PRIMARY KEY,
    STATE_NAME VARCHAR(30) NOT NULL --1.모집중 2.스터디진행중 3.스터디종료
);

--스터디 요일
CREATE TABLE STUDY_DAY(
    DAY_NO NUMBER(2) CONSTRAINT STUDY_DAY_PK PRIMARY KEY,
    DAY_NAME VARCHAR2(20) NOT NULL --1.무관 2.평일 3.주말
);

--스터디 게시글
CREATE TABLE STUDY(
    STUDY_NO NUMBER(10) CONSTRAINT STUDY_NO_PK PRIMARY KEY,
    TAG_NO NUMBER(10) NOT NULL CONSTRAINT STUDY_TAG_FK REFERENCES TAGLIST(TAG_NO),
    USER_ID VARCHAR2(20) NOT NULL CONSTRAINT STUDY_ID_FK REFERENCES MEMBER_USER(USER_ID) ON DELETE CASCADE,
    STATE_NO NUMBER(2) DEFAULT 1 NOT NULL CONSTRAINT STUDY_STATE_FK REFERENCES STUDY_STATE(STATE_NO),
    DAY_NO NUMBER(2) NOT NULL CONSTRAINT STUDY_DAY_FK REFERENCES STUDY_DAY(DAY_NO),
    STUDY_MAXNUM NUMBER(10) NOT NULL,
    STUDY_LOCATION_SI VARCHAR2(20) NOT NULL,
    STUDY_LOCATION_GU VARCHAR2(20),
    STUDY_DUEDATE VARCHAR2(30) NOT NULL,
    STUDY_TITLE VARCHAR2(60) NOT NULL,
    STUDY_CONTENT VARCHAR2(4000) NOT NULL,
    STUDY_REGDATE DATE DEFAULT SYSDATE NOT NULL
);

--스터디 댓글
CREATE TABLE STUDY_REPLY(
    S_REPLY_NO NUMBER(10) CONSTRAINT S_REPLY_NO_PK PRIMARY KEY,
    STUDY_NO NUMBER(10) NOT NULL CONSTRAINT STUDY_NO_FK REFERENCES STUDY(STUDY_NO) ON DELETE CASCADE,
    USER_ID VARCHAR2(20) NOT NULL CONSTRAINT S_REPLY_ID_FK REFERENCES MEMBER_USER(USER_ID) ON DELETE CASCADE,
    S_REPLY_CONTENT VARCHAR2(300) NOT NULL,
    S_REPLY_DATE DATE DEFAULT SYSDATE NOT NULL
);

--스터디룸
CREATE TABLE STUDY_ROOM(
    CHAT_NO NUMBER(10) CONSTRAINT ROOM_CHAT_PK PRIMARY KEY,
    STUDY_NO NUMBER(10) NOT NULL CONSTRAINT ROOM_STUDY_NO_FK REFERENCES STUDY(STUDY_NO) ON DELETE CASCADE,
    USER_ID VARCHAR2(20) NOT NULL CONSTRAINT ROOM_ID_FK REFERENCES MEMBER_USER(USER_ID) ON DELETE SET NULL,
    CHAT_CONTENT VARCHAR2(500) NOT NULL,
    CHAT_DATE DATE DEFAULT SYSDATE NOT NULL
);

--스터디 신청 상태
CREATE TABLE STUDYSIGN_STATE(
    SIGNSTATE_NO NUMBER(2) CONSTRAINT SIGN_STATE_PK PRIMARY KEY,
    SIGNSTATE_NAME VARCHAR2(30) NOT NULL --1.수락대기 2.수락완료
);

--신청한 스터디
CREATE TABLE SIGN_STUDY(
    USER_ID VARCHAR2(20) NOT NULL CONSTRAINT SIGN_ID_FK REFERENCES MEMBER_USER(USER_ID) ON DELETE CASCADE,
    STUDY_NO NUMBER(10) NOT NULL CONSTRAINT SIGN_STUDY_FK REFERENCES STUDY(STUDY_NO) ON DELETE CASCADE,
    SIGNSTATE_NO NUMBER(2) DEFAULT 1 NOT NULL CONSTRAINT SIGN_STATE_FK REFERENCES STUDYSIGN_STATE(SIGNSTATE_NO)
);

--찜한 스터디
CREATE TABLE WISH_STUDY(
    USER_ID VARCHAR2(20) NOT NULL CONSTRAINT WISH_ID_FK REFERENCES MEMBER_USER(USER_ID) ON DELETE CASCADE,
    STUDY_NO NUMBER(10) NOT NULL CONSTRAINT WISH_STUDY_FK REFERENCES STUDY(STUDY_NO) ON DELETE CASCADE
);

--시퀀스 생성
create sequence study_seq increment by 1 start with 20001 maxvalue 40000 nocache nocycle;
create sequence post_reply_seq increment by 1 start with 1 maxvalue 20000 nocache nocycle;
create sequence post_seq increment by 1 start with 1 maxvalue 20000 nocache nocycle;
create sequence study_reply_seq increment by 1 start with 20001 maxvalue 40000 nocache nocycle;
create sequence study_room_seq increment by 1 start with 1 maxvalue 20000 nocache nocycle;


--번호 초기값 설정 
ALTER TABLE study MODIFY (study_no DEFAULT study_seq.nextval);
ALTER TABLE post MODIFY (post_no DEFAULT post_seq.nextval);
ALTER TABLE study_reply MODIFY (s_reply_no DEFAULT study_reply_seq.nextval);
ALTER TABLE post_reply MODIFY (p_reply_no DEFAULT post_reply_seq.nextval);
ALTER TABLE study_room MODIFY (chat_no DEFAULT study_room_seq.nextval);


--태그 db
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

insert into board values(1,'자유게시판');
insert into board values(2,'정보공유게시판');

insert into studysign_state values(1,'수락대기');
insert into studysign_state values(2,'수락완료');

insert into study_state values(1,'모집중');
insert into study_state values(2,'스터디진행중');
insert into study_state values(3,'스터디종료');

insert into study_day values(1,'무관');
insert into study_day values(2,'평일');
insert into study_day values(3,'주말');

insert into post(post_no, tag_no, board_no, user_id,post_title,post_content,post_up) values(post_seq.nextval,2,1,'admin','test중','holy moly',5);


insert into post values(1,1,1,'admin','테스트 입니다',sysdate,'하핳 반갑습니다 여러분 화이팅~!!',0);

insert into post_reply values(1,1,'admin','테스트 댓글 입니다',sysdate);
insert into post_reply values(2,1,'admin','테스트 댓글2 입니다',sysdate);

insert into study values(1,2,'admin',1,1,5,'서울시','강남구','2021.10.14','테스트 입니다','사람만 들어오세요',sysdate);

insert into wish_study values('admin',1);

insert into sign_study values('admin',1,1);

insert into point values('admin',5);
insert into point values('admin',4);
insert into point values('admin',4);
