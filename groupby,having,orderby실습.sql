DROP TABLE 데이터디자인 ;
DROP TABLE 교육생정보 ; 
DROP TABLE 성적표 ; 

CREATE TABLE 교육생정보 (
학생ID VARCHAR2(9) PRIMARY KEY , 
학생이름 VARCHAR2(50) NOT NULL , 
팀 VARCHAR2(5) 
); 

CREATE TABLE 성적표 ( 
    학생ID VARCHAR2(9) , 
    과목   VARCHAR2(30) , 
    성적   NUMBER  , 
    CONSTRAINT PK_성적표 PRIMARY KEY(학생ID , 과목) , 
    CONSTRAINT FK_성적표 FOREIGN KEY(학생ID) REFERENCES 교육생정보(학생ID) 
)  ; 

INSERT INTO 교육생정보 VALUES ('SMHRD1' , '박수현' , 'A') ; 
INSERT INTO 교육생정보 VALUES ('SMHRD2' , '송승호' , 'A') ; 
INSERT INTO 교육생정보 VALUES ('SMHRD3' , '이은비' , 'B') ; 
INSERT INTO 교육생정보 VALUES ('SMHRD4' , '박원호' , 'B') ; 
INSERT INTO 교육생정보 VALUES ('SMHRD5' , '000' , 'C') ; 
INSERT INTO 교육생정보 VALUES ('SMHRD6' , '000' , 'C') ; 
INSERT INTO 교육생정보 VALUES ('SMHRD7' , '000' , 'C') ; 
INSERT INTO 교육생정보 VALUES ('SMHRD8' , '000' , 'C') ; 
INSERT INTO 교육생정보 VALUES ('SMHRD9' , '000' , 'C') ; 

INSERT INTO 성적표 VALUES('SMHRD1'  ,'JAVA' , 90); 
INSERT INTO 성적표 VALUES('SMHRD1'  ,'DATABASE' , 85); 
INSERT INTO 성적표 VALUES('SMHRD1'  ,'PYTHON' , 100); 
INSERT INTO 성적표 VALUES('SMHRD2'  ,'JAVA' , 100); 
INSERT INTO 성적표 VALUES('SMHRD2'  ,'DATABASE' , 100); 
INSERT INTO 성적표 VALUES('SMHRD2'  ,'PYTHON' , 20); 
INSERT INTO 성적표 VALUES('SMHRD3'  ,'JAVA' , 100); 
INSERT INTO 성적표 VALUES('SMHRD3'  ,'DATABASE' , 100); 
INSERT INTO 성적표 VALUES('SMHRD3'  ,'PYTHON' , 20); 
INSERT INTO 성적표 VALUES('SMHRD4'  ,'JAVA' , 85); 
INSERT INTO 성적표 VALUES('SMHRD4'  ,'DATABASE' , 40); 
INSERT INTO 성적표 VALUES('SMHRD4'  ,'PYTHON' , 60); 
INSERT INTO 성적표 VALUES('SMHRD5'  ,'JAVA' , 100); 
INSERT INTO 성적표 VALUES('SMHRD5'  ,'DATABASE' , 100); 
INSERT INTO 성적표 VALUES('SMHRD5'  ,'PYTHON' , 100); 
INSERT INTO 성적표 VALUES ( 'SMHRD6' , 'JAVA' , NULL ) ; 
INSERT INTO 성적표 VALUES ( 'SMHRD6' , 'DATABASE' , NULL ) ; 
INSERT INTO 성적표 VALUES ( 'SMHRD6' , 'PYTHON' , NULL ) ; 

COMMIT; 

