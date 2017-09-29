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
comment on table talkgroup is '群组表';
comment on column talkgroup.userId is '用户编号';
comment on column talkgroup.groupId is '群组编号';
comment on column talkgroup.gAvatar is '群组头像';
comment on column talkgroup.gMember is '群组成员';
comment on column talkgroup.groupName is '群组名称';





INSERT INTO TALKGROUP (USERID, GROUPID, GAVATAR, GMEMBER, GROUPNAME) VALUES (1, 1, 'img/profile_small.jpg', null, '开发组');
INSERT INTO TALKGROUP (USERID, GROUPID, GAVATAR, GMEMBER, GROUPNAME) VALUES (1, 2, 'img/profile_small.jpg', null, '运维组');
INSERT INTO TALKGROUP (USERID, GROUPID, GAVATAR, GMEMBER, GROUPNAME) VALUES (2, 1, 'img/profile_small.jpg', null, '开发组');
INSERT INTO TALKGROUP (USERID, GROUPID, GAVATAR, GMEMBER, GROUPNAME) VALUES (3, 1, 'img/profile_small.jpg', null, '开发组');
