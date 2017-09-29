create table  userinfo
(
       userId            NUMBER(10) not null,
       userCode          VARCHAR2(20) not null,
       userName          VARCHAR2(20) not null,
       userPassword      VARCHAR2(16) not null,
       age               NUMBER(2),
       sex               VARCHAR2(1),
       birthday          DATE,
       tel               VARCHAR2(11),
       qq                VARCHAR2(15),
       email             VARCHAR2(50),
       emailUser         VARCHAR2(50),
       emailPassword     VARCHAR2(16),
       address           VARCHAR2(256),
       avatar            VARCHAR2(256),
       verfiyCode        VARCHAR2(10),
       brief             VARCHAR2(1000)
);
alter  table userinfo
       add constraint PK_userinfo_userId primary key (userId);
comment on table userinfo is '用户表';
comment on column userinfo.userId is '编号 用户编号';
comment on column userinfo.userCode is '用户code 用户code';
comment on column userinfo.userName is '用户名称 用户名称';
comment on column userinfo.userPassword is '用户密码 用户密码';
comment on column userinfo.age is '年龄 用户年龄';
comment on column userinfo.sex is '性别 性别';
comment on column userinfo.birthday is '生日 出生年月日';
comment on column userinfo.tel is '电话 电话';
comment on column userinfo.qq is 'qq号码 qq号码';
comment on column userinfo.email is '邮箱 邮箱';
comment on column userinfo.emailUser is '邮箱用户 邮箱用户';
comment on column userinfo.emailPassword is '邮箱密码 邮箱密码';
comment on column userinfo.address is '用户地址 用户地址';
comment on column userinfo.avatar is '头像地址 头像地址';
comment on column userinfo.verfiyCode is '验证码 验证码';
comment on column userinfo.brief is '个人介绍 个人简介';








INSERT INTO USERINFO (USERID, USERCODE, USERNAME, USERPASSWORD, AGE, SEX, BIRTHDAY, TEL, QQ, EMAIL, EMAILUSER, EMAILPASSWORD, VERFIYCODE, ADDRESS, AVATAR, BRIEF) VALUES (3, 'jiayulong', '贾玉龙', '000000', null, null, null, null, null, 'lonelypickuplight@163.com', null, null, null, null, null, null);
INSERT INTO USERINFO (USERID, USERCODE, USERNAME, USERPASSWORD, AGE, SEX, BIRTHDAY, TEL, QQ, EMAIL, EMAILUSER, EMAILPASSWORD, VERFIYCODE, ADDRESS, AVATAR, BRIEF) VALUES (1, 'qinxg', '一米阳光', '000000', 24, '1', TIMESTAMP '1993-03-20 00:00:00', '13122986657', '1054056499', 'lonelypickuplight@163.com', 'lonelypickuplight', 'qin190530246', 'ek5e', '吉林省吉林市磐石县呼兰镇', '201782519645889_1.JPG', '毕业于合肥工业大学软件工程专业，在上海普元技术股份有限公司工作两年');
INSERT INTO USERINFO (USERID, USERCODE, USERNAME, USERPASSWORD, AGE, SEX, BIRTHDAY, TEL, QQ, EMAIL, EMAILUSER, EMAILPASSWORD, VERFIYCODE, ADDRESS, AVATAR, BRIEF) VALUES (2, 'shiman', '石满', '111111', 23, '1', null, '13122986657', '1054056499', 'lonelypickuplight@163.com', 'lonelypickuplight', 'qin190530246', 'ek5e', null, null, null);
