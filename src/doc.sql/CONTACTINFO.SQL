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
comment on table contactinfo is '��ϵ����Ϣ��';
comment on column contactinfo.userId is '��� ����ϵ��id';
comment on column contactinfo.contactId is '�û���� ��ϵ�˵ı��';
comment on column contactinfo.name is '��ϵ���ǳ� ��ϵ���ǳ�';
comment on column contactinfo.age is '���� ����';
comment on column contactinfo.sex is '�Ա� �Ա�';
comment on column contactinfo.birthday is '���� ����';
comment on column contactinfo.contactType is '��ϵ��ʽ ��ϵ��ʽ';
comment on column contactinfo.tel is '�绰 �绰';
comment on column contactinfo.qq is 'qq���� qq����';
comment on column contactinfo.email is '���� ����';
comment on column contactinfo.address is '��ַ ��ַ';
comment on column contactinfo.avatar is 'ͷ���ַ ͷ���ַ';
comment on column contactinfo.brief is '���˽��� ���˽���';