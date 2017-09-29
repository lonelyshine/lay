create table  talkgroup
(
       userId            NUMBER(10) not null,
       groupId           NUMBER(10) not null,
       gAvatar           VARCHAR2(128),
       gMember           VARCHAR2(2000),
       groupName         VARCHAR2(128)
);
alter  table talkgroup
       add constraint PK_talkgroup_userId primary key (userId,groupId);
comment on table talkgroup is 'Ⱥ���';
comment on column talkgroup.userId is '�û����';
comment on column talkgroup.groupId is 'Ⱥ����';
comment on column talkgroup.gAvatar is 'Ⱥ��ͷ��';
comment on column talkgroup.gMember is 'Ⱥ���Ա';
comment on column talkgroup.groupName is 'Ⱥ������';





INSERT INTO TALKGROUP (USERID, GROUPID, GAVATAR, GMEMBER, GROUPNAME) VALUES (1, 1, 'img/profile_small.jpg', null, '������');
INSERT INTO TALKGROUP (USERID, GROUPID, GAVATAR, GMEMBER, GROUPNAME) VALUES (1, 2, 'img/profile_small.jpg', null, '��ά��');
INSERT INTO TALKGROUP (USERID, GROUPID, GAVATAR, GMEMBER, GROUPNAME) VALUES (2, 1, 'img/profile_small.jpg', null, '������');
INSERT INTO TALKGROUP (USERID, GROUPID, GAVATAR, GMEMBER, GROUPNAME) VALUES (3, 1, 'img/profile_small.jpg', null, '������');