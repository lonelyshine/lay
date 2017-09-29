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
comment on table userinfo is '�û���';
comment on column userinfo.userId is '��� �û����';
comment on column userinfo.userCode is '�û�code �û�code';
comment on column userinfo.userName is '�û����� �û�����';
comment on column userinfo.userPassword is '�û����� �û�����';
comment on column userinfo.age is '���� �û�����';
comment on column userinfo.sex is '�Ա� �Ա�';
comment on column userinfo.birthday is '���� ����������';
comment on column userinfo.tel is '�绰 �绰';
comment on column userinfo.qq is 'qq���� qq����';
comment on column userinfo.email is '���� ����';
comment on column userinfo.emailUser is '�����û� �����û�';
comment on column userinfo.emailPassword is '�������� ��������';
comment on column userinfo.address is '�û���ַ �û���ַ';
comment on column userinfo.avatar is 'ͷ���ַ ͷ���ַ';
comment on column userinfo.verfiyCode is '��֤�� ��֤��';
comment on column userinfo.brief is '���˽��� ���˼��';








INSERT INTO USERINFO (USERID, USERCODE, USERNAME, USERPASSWORD, AGE, SEX, BIRTHDAY, TEL, QQ, EMAIL, EMAILUSER, EMAILPASSWORD, VERFIYCODE, ADDRESS, AVATAR, BRIEF) VALUES (3, 'jiayulong', '������', '000000', null, null, null, null, null, 'lonelypickuplight@163.com', null, null, null, null, null, null);
INSERT INTO USERINFO (USERID, USERCODE, USERNAME, USERPASSWORD, AGE, SEX, BIRTHDAY, TEL, QQ, EMAIL, EMAILUSER, EMAILPASSWORD, VERFIYCODE, ADDRESS, AVATAR, BRIEF) VALUES (1, 'qinxg', 'һ������', '000000', 24, '1', TIMESTAMP '1993-03-20 00:00:00', '13122986657', '1054056499', 'lonelypickuplight@163.com', 'lonelypickuplight', 'qin190530246', 'ek5e', '����ʡ��������ʯ�غ�����', '201782519645889_1.JPG', '��ҵ�ںϷʹ�ҵ��ѧ�������רҵ�����Ϻ���Ԫ�����ɷ����޹�˾��������');
INSERT INTO USERINFO (USERID, USERCODE, USERNAME, USERPASSWORD, AGE, SEX, BIRTHDAY, TEL, QQ, EMAIL, EMAILUSER, EMAILPASSWORD, VERFIYCODE, ADDRESS, AVATAR, BRIEF) VALUES (2, 'shiman', 'ʯ��', '111111', 23, '1', null, '13122986657', '1054056499', 'lonelypickuplight@163.com', 'lonelypickuplight', 'qin190530246', 'ek5e', null, null, null);
