create table  dict
(
       Id                NUMBER(10) not null,
       userId            NUMBER(10),
       dictCode          VARCHAR2(64),
       dictlist          VARCHAR2(128)
);
alter  table dict
       add constraint PK_dict_Id primary key (Id);
comment on table dict is '�ֵ��';
comment on column dict.Id is '���';
comment on column dict.userId is '�û����';
comment on column dict.dictCode is '�ֵ�code';
comment on column dict.dictlist is '���ֵ�����';