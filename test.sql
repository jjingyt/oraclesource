--권한이 불충분합니다
CREATE TABLE TABLE_DEFAULT(
    LOGIN_ID VARCHAR2(20) constraint tblDF_lgnkd_pk PRIMARY KEY,
    LOGIN_PWD VARCHAR2(20) DEFAULT '1234',
    TEL VARCHAR2(20));
    
--'USERS'에 대한 권한이 없습니다.
INSERT INTO TABLE_DEFAULT(LOGIN_ID,LOGIN_PWD)
VALUES('TEST_ID','TEST_ID');