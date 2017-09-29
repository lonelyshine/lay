create table  contactinfo
(
       userId            NUMBER(10) not null,
       contactId         NUMBER(10) not null,
       name              VARCHAR2(20),
       age               NUMBER(2),
       sex               VARCHAR2(1),
       birthday          DATE,
       contactType       VARCHAR2(1),
       tel               VARCHAR2(11),
       qq                VARCHAR2(12),
       email             VARCHAR2(50),
       address           VARCHAR2(256),
       avatar            VARCHAR2(128),
       brief             VARCHAR2(1000)
);
alter  table contactinfo
       add constraint PK_contactinfo_userId primary key (userId,contactId);
comment on table contactinfo is '联系人信息表';
comment on column contactinfo.userId is '编号 主联系人id';
comment on column contactinfo.contactId is '用户编号 联系人的编号';
comment on column contactinfo.name is '联系人昵称 联系人昵称';
comment on column contactinfo.age is '年龄 年龄';
comment on column contactinfo.sex is '性别 性别';
comment on column contactinfo.birthday is '生日 生日';
comment on column contactinfo.contactType is '联系方式 联系方式';
comment on column contactinfo.tel is '电话 电话';
comment on column contactinfo.qq is 'qq号码 qq号码';
comment on column contactinfo.email is '邮箱 邮箱';
comment on column contactinfo.address is '地址 地址';
comment on column contactinfo.avatar is '头像地址 头像地址';
comment on column contactinfo.brief is '个人介绍 个人介绍';