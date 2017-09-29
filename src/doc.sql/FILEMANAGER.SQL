create table  fileManager
(
       Id                NUMBER(20) not null,
       userId            NUMBER(10),
       fileName          VARCHAR2(128),
       filePath          VARCHAR2(256),
       fileCategory      VARCHAR2(20),
       fileType          VARCHAR2(20),
       fileTab           VARCHAR2(2),
       folder            VARCHAR2(64),
       fileTime          VARCHAR2(10)
);
alter  table fileManager
       add constraint PK_fileManager_Id primary key (Id);
comment on table fileManager is '附件文件表';
comment on column fileManager.Id is '编号';
comment on column fileManager.userId is '用户编号';
comment on column fileManager.fileName is '文件名称';
comment on column fileManager.filePath is '文件路径';
comment on column fileManager.fileCategory is '文件类别 文件类别';
comment on column fileManager.fileType is '文件图标 文件图标';
comment on column fileManager.fileTab is '文件标签 标签类型';
comment on column fileManager.folder is '文件夹 文件夹';
comment on column fileManager.fileTime is '文件上传时间 文件上传时间';



INSERT INTO FILEMANAGER (ID, USERID, FILENAME, FILEPATH, FILECATEGORY, FILETYPE, FILETAB, FOLDER, FILETIME) VALUES (201782519645889, 1, 'MG0A7976.JPG', 'D:\service\apache-tomcat-7.0.72\webapps\lay\fileManager\201782519645889.JPG', 'image', 'fa-file-image-o', null, null, '2017-8-25');
INSERT INTO FILEMANAGER (ID, USERID, FILENAME, FILEPATH, FILECATEGORY, FILETYPE, FILETAB, FOLDER, FILETIME) VALUES (201771512153490, 1, 'MG0A7976.JPG', 'D:\service\apache-tomcat-7.0.72\webapps\lay\fileManager\201771512153490.JPG', 'image', 'fa-file-image-o', null, null, '2017-7-15');
INSERT INTO FILEMANAGER (ID, USERID, FILENAME, FILEPATH, FILECATEGORY, FILETYPE, FILETAB, FOLDER, FILETIME) VALUES (201771512162497, 1, 'MG0A8056.JPG', 'D:\service\apache-tomcat-7.0.72\webapps\lay\fileManager\201771512162497.JPG', 'image', 'fa-file-image-o', null, null, '2017-7-15');
INSERT INTO FILEMANAGER (ID, USERID, FILENAME, FILEPATH, FILECATEGORY, FILETYPE, FILETAB, FOLDER, FILETIME) VALUES (201772316930632, 1, 'MG0A8045.JPG', 'D:\service\apache-tomcat-7.0.72\webapps\lay\fileManager\201772316930632.JPG', 'image', 'fa-file-image-o', null, null, '2017-7-23');
INSERT INTO FILEMANAGER (ID, USERID, FILENAME, FILEPATH, FILECATEGORY, FILETYPE, FILETAB, FOLDER, FILETIME) VALUES (20177221659690, 1, 'MG0A8046.JPG', 'D:\service\apache-tomcat-7.0.72\webapps\lay\fileManager\20177221659690.JPG', 'image', 'fa-file-image-o', null, null, '2017-7-22');
