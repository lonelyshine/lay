create table  talkfriend
(
       userId            NUMBER(10) not null,
       fridendId         NUMBER(10) not null,
       fNickName         VARCHAR2(128),
       fRemark           VARCHAR2(256),
       fStatus           VARCHAR2(10),
       fAvatar           VARCHAR2(128),
       groupName         VARCHAR2(128),
       groupId           VARCHAR2(10)
);
alter  table talkfriend
       add constraint PK_talkfriend_userId primary key (userId,fridendId);
comment on table talkfriend is '���ѱ�';
comment on column talkfriend.userId is '�û����';
comment on column talkfriend.fridendId is '�����û����';
comment on column talkfriend.fNickName is '�����ǳ�';
comment on column talkfriend.fRemark is '����ǩ��';
comment on column talkfriend.fStatus is '����״̬';
comment on column talkfriend.fAvatar is '����ͷ��';
comment on column talkfriend.groupName is '��������';
comment on column talkfriend.groupId is '����id';



INSERT INTO TALKFRIEND (USERID, FRIDENDID, FNICKNAME, FREMARK, FSTATUS, FAVATAR, GROUPNAME, GROUPID) VALUES (1, 4, 'Сϣ', '�������', 'online', 'img/profile_small.jpg', '����', '1');
INSERT INTO TALKFRIEND (USERID, FRIDENDID, FNICKNAME, FREMARK, FSTATUS, FAVATAR, GROUPNAME, GROUPID) VALUES (1, 2, 'С��', '�������', 'online', 'img/profile_small.jpg', '����', '2');
INSERT INTO TALKFRIEND (USERID, FRIDENDID, FNICKNAME, FREMARK, FSTATUS, FAVATAR, GROUPNAME, GROUPID) VALUES (1, 3, 'С��', '�������', 'online', 'img/profile_small.jpg', '����', '2');
INSERT INTO TALKFRIEND (USERID, FRIDENDID, FNICKNAME, FREMARK, FSTATUS, FAVATAR, GROUPNAME, GROUPID) VALUES (2, 1, '�¶�ʰ����', '�������', 'online', 'img/profile_small.jpg', '����', '2');