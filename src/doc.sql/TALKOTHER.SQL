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
comment on table talkother is '交互信息表';
comment on column talkother.userId is '用户编号';
comment on column talkother.nickName is '昵称';
comment on column talkother.remark is '我的签名';
comment on column talkother.onlinestatus is '在线状态';
comment on column talkother.avatar is '我的头像';





INSERT INTO TALKOTHER (USERID, NICKNAME, REMARK, ONLINESTATUS, AVATAR, GROUPID) VALUES (1, '孤独拾光者', '做一枚轻盈的纸飞机', 'online', 'img/profile_small.jpg', 1);
INSERT INTO TALKOTHER (USERID, NICKNAME, REMARK, ONLINESTATUS, AVATAR, GROUPID) VALUES (2, '石满', '在深邃的编码世界，做一枚轻盈的纸飞机', 'online', 'img/profile_small.jpg', 1);
INSERT INTO TALKOTHER (USERID, NICKNAME, REMARK, ONLINESTATUS, AVATAR, GROUPID) VALUES (3, '小希', '在深邃的编码世界，做一枚轻盈的纸飞机', 'online', 'img/profile_small.jpg', 1);
