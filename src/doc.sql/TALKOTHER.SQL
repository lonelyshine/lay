create table  talkother
(
       userId            NUMBER(10) not null,
       nickName          VARCHAR2(128) not null,
       remark            VARCHAR2(256),
       onlinestatus      VARCHAR2(10),
       avatar            VARCHAR2(128)
);
alter  table talkother
       add constraint PK_talkother_userId primary key (userId);
comment on table talkother is '������Ϣ��';
comment on column talkother.userId is '�û����';
comment on column talkother.nickName is '�ǳ�';
comment on column talkother.remark is '�ҵ�ǩ��';
comment on column talkother.onlinestatus is '����״̬';
comment on column talkother.avatar is '�ҵ�ͷ��';





INSERT INTO TALKOTHER (USERID, NICKNAME, REMARK, ONLINESTATUS, AVATAR, GROUPID) VALUES (1, '�¶�ʰ����', '��һö��ӯ��ֽ�ɻ�', 'online', 'img/profile_small.jpg', 1);
INSERT INTO TALKOTHER (USERID, NICKNAME, REMARK, ONLINESTATUS, AVATAR, GROUPID) VALUES (2, 'ʯ��', '������ı������磬��һö��ӯ��ֽ�ɻ�', 'online', 'img/profile_small.jpg', 1);
INSERT INTO TALKOTHER (USERID, NICKNAME, REMARK, ONLINESTATUS, AVATAR, GROUPID) VALUES (3, 'Сϣ', '������ı������磬��һö��ӯ��ֽ�ɻ�', 'online', 'img/profile_small.jpg', 1);