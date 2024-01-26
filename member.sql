CREATE TABLE MEMBER(
        ID VARCHAR2(50) PRIMARY KEY,
        PW VARCHAR2(50) NOT NULL,
        NAME VARCHAR2(50) NOT NULL,
        AGE NUMBER NOT NULL
        );
        
        INSERT INTO MEMBER VALUES('admin', '1234', '°ü¸®ÀÚ', 20);
        COMMIT;
        
        SELECT *
        FROM MEMBER;
        
