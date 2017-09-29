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
comment on table talkfriend is '好友表';
comment on column talkfriend.userId is '用户编号';
comment on column talkfriend.fridendId is '好友用户编号';
comment on column talkfriend.fNickName is '好友昵称';
comment on column talkfriend.fRemark is '好友签名';
comment on column talkfriend.fStatus is '好友状态';
comment on column talkfriend.fAvatar is '好友头像';
comment on column talkfriend.groupName is '分类名称';
comment on column talkfriend.groupId is '分类id';



INSERT INTO TALKFRIEND (USERID, FRIDENDID, FNICKNAME, FREMARK, FSTATUS, FAVATAR, GROUPNAME, GROUPID) VALUES (1, 4, '小希', '海阔天空', 'online', 'img/profile_small.jpg', '朋友', '1');
INSERT INTO TALKFRIEND (USERID, FRIDENDID, FNICKNAME, FREMARK, FSTATUS, FAVATAR, GROUPNAME, GROUPID) VALUES (1, 2, '小满', '海阔天空', 'online', 'img/profile_small.jpg', '家人', '2');
INSERT INTO TALKFRIEND (USERID, FRIDENDID, FNICKNAME, FREMARK, FSTATUS, FAVATAR, GROUPNAME, GROUPID) VALUES (1, 3, '小空', '海阔天空', 'online', 'img/profile_small.jpg', '家人', '2');
INSERT INTO TALKFRIEND (USERID, FRIDENDID, FNICKNAME, FREMARK, FSTATUS, FAVATAR, GROUPNAME, GROUPID) VALUES (2, 1, '孤独拾光者', '海阔天空', 'online', 'img/profile_small.jpg', '家人', '2');
