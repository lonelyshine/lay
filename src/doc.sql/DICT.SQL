create table  dict
(
       Id                NUMBER(10) not null,
       userId            NUMBER(10),
       dictCode          VARCHAR2(64),
       dictlist          VARCHAR2(128)
);
alter  table dict
       add constraint PK_dict_Id primary key (Id);
comment on table dict is '字典表';
comment on column dict.Id is '编号';
comment on column dict.userId is '用户编号';
comment on column dict.dictCode is '字典code';
comment on column dict.dictlist is '子字典类型';