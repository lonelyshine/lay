CREATE TABLE
    USERSEMAIL
    (
        ID INTEGER,
        SENDER VARCHAR2(20),
        RECIPIENTS VARCHAR2(20),
        TITLE VARCHAR2(100),
        CONTENT VARCHAR2(1000),
        THETIME VARCHAR2(20),
        UPLOAD VARCHAR2(20),
        TYPE INTEGER,
        STATUS INTEGER
    );



INSERT INTO USERSEMAIL (ID, SENDER, RECIPIENTS, TITLE, CONTENT, THETIME, UPLOAD, TYPE, STATUS) VALUES (null, 'qinxuegang@sohu.com', null, null, null, '2016-11-08  22:16:36', null, 3, 0);
