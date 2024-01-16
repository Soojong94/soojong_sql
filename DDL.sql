/******************DDL**********************/

--DDL : 데이터 정의어
    --  테이블과 같은 데이터 구조를 정의하는 데 사용하는 명령어
    -- CREATE : 새로운 객체를 생성할 때 사용하는 명령어
    
    --CREATE 로 테이블 생성하는 방법
    CREATE TABLE 테이블 이름(
    컬럼이름 자료형(크기) (기본값) (NULL여부)
    );

    CREATE TABLE 직원(
    직원ID NUMBER(6) NOT NULL,
    이름 VARCHAR2(20) ,
    성 VARCHAR2(25) NOT NULL,
    이메일 VARCHAR2(25) NOT NULL,
    핸드폰 VARCHAR2(20),
    입사일 DATE NOT NULL,
    직업ID VARCHAR2(10) NOT NULL,
    급여 NUMBER(8,2),
    수수료비율 NUMBER(2),
    매니저ID NUMBER(6),
    부서ID NUMBER(4)
    );
    
    CREATE TABLE 부서(
    부서ID NUMBER(4) NOT NULL,
    부서이름 VARCHAR2(30) NOT NULL,
    매니저ID NUMBER(6),
    위치ID NUMBER(4)
    );
    
--제약 조건
--PK (PRIMARY KEY) : 중복불가 + NULL 불가 -> 행을 식별할 수 잇는 컬럼
--UK (UNIQUE KEY ) : 중복불가 + NULL 가능

--         중복      NULLABLE   예시
--PK (Primary Key)   X      X      주민번호,사번,..
--UK (Unique Key)   X      O      email,인증수단

--NOT NULL : NULL 을 넣을 수 있냐 없냐 
--CHECK : 지정한 데이터만 입력 가능하게 함 (EX. 남/여 , 1/2) 

--FK (Foreign Key) : 외래키, 다른 테이블의 기본 키를 참조하는 속성 (연결)
--- PK는 없으면 Table 이라고 칭하지 X (기능X 협업상) 
--- 다만, UK는 없어도 됨 
    
-- 제약조건을 추가하는 문접
-- ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건명 제약조건 (컬럼);

--1. PK 추가 지정
ALTER TABLE 직원
ADD CONSTRAINT 직원_직원ID_PK PRIMARY KEY(직원ID);

--2. UK 추가 지정(이메일)
ALTER TABLE 직원
ADD CONSTRAINT 직원_이메일_UK UNIQUE(이메일);

--3. CHECK 지정(급여 0 초과)
ALTER TABLE 직원
ADD CONSTRAINT 직원_급여_CK CHECK(급여>0);

-- 4. FK 추가 지정(외래키)
-- FK 는 다른 테이블의 UK 와 FK 일 때만 참조 가능
-- 따라서 내가 참조할 테이블의 컬럼이 PK, UK 로 설정이 되어 있어야만 FK로 참조 가능
-- ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건명 제약조건(컬럼) 
-- REFERENCES  참조할 테이블(참조할 컬럼);
-- 직원 테이블에 있는 부서 ID를 FK로 사용
-- 부서 테이블에 있는 부서 ID를 참조
    
    
-- 4-1) 부서 ID를 PK 로 지정
ALTER TABLE 부서 ADD CONSTRAINT 부서_부서ID_PK PRIMARY KEY(부서ID);
-- 4-2) 직원 테이블의 부서 ID - 부서 테이블 부서 ID 참조
ALTER TABLE 직원 ADD CONSTRAINT 직원_부서ID_FK FOREIGN KEY(부서ID)
            REFERENCES 부서(부서ID);

-- 5. NOT NULL 변경
ALTER TABLE 직원 MODIFY 이름 NOT NULL;

-- 6. 제약조건 삭제
-- ALTER TABLE 테이블명 DROP CONSTRAINT 제약조건명
ALTER TABLE 직원 DROP CONSTRAINT 직원_급여_CK; 


--7. 제약조건 조회
SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = '직원';

--데이터 무결성 
--- 무결성 : 데이터에 결함이 없는 상태 
--- 무결성 제약 조건의 목적은 데이터베이스의 무결성을 보장하고, 일관되게 유지하게 하는 것 
--
--- 무결성 제약조건의 종류 
--1) 개체 무결성 (Entity integrity) 
--- 기본키 제약 
--- 테이블은 기본키를 가져야한다. 
--- 기본키는 Null값을 가질 수 없다 
--- 기본키는 테이블 내에 하나만 존재 할 수 있다. 
--- 하나의 테이블 내에 기본키와 동일한 이름을 가진 컬럼 존재할 수 없다 
--
--2) 참조 무결성 (Referential integrity) 
--- 외래키 제약 
--- 외래키는 참조 릴레이션의 기본키 값과 동일해야한다. 
--  ( = 외래키는 PK, UK 만 참조할 수 있다) 
--- 외래키 속성은 참조할 수 없는 값을 지닐 수 없다. 
--  (참조할 수 없는 값 =/ PK, UK) 

--8. 제약 조건을 테이블 생성 시에 추가
CREATE TABLE 제약조건테스트(   
    PK테스트 NUMBER PRIMARY KEY,
    UK테스트 NUMBER UNIQUE,
    NN테스트 NUMBER NOT NULL,
    CK테스트 NUMBER CHECK(CK테스트>0)
    );
    
--테이블 -> 오른쪽 마우스 -> 새로고침
--제약조건테스트 드래그 -> SHIFT + F4 -> 테이블 상태 확인

-- 9. 테이블 삭제
-- DROP TABLE 테이블명 : 테이블 영구 삭제 (-안에 있는 데이터까지 삭제)

DROP TABLE 제약조건테스트;
DROP TABLE 부서; --안 날아감(참조 중이기 때문에)

--DROP TABLE 테이블명 CASCADE CONSTRAINT(테이블, 데이터, FK관계 전부 삭제)
--원래 대로라면 제약조건 삭제한 다음에 ->DROP TABLE

CREATE TABLE 네이버블로그(
    블로그번호 NUMBER(4),
    블로그제목 VARCHAR2(100) NOT NULL,
    블로그내용 VARCHAR2(4000) NOT NULL,
    ID  VARCHAR2(15)
);

CREATE TABLE 네이버회원 (
    ID VARCHAR2(15),
    이름 VARCHAR2(12) NOT NULL,
    비밀번호 VARCHAR2(16) ,
    생년월일 DATE ,
    성별 VARCHAR2(3)
);

ALTER TABLE 네이버회원 ADD CONSTRAINT 네이버회원_ID_PK PRIMARY KEY(ID);

ALTER TABLE 네이버회원 ADD CONSTRAINT 네이버회원_성별_CK CHECK (성별 IN ('남' , '여'));

ALTER TABLE 네이버블로그 ADD CONSTRAINT PK_네이버블로그 PRIMARY KEY (블로그번호);

ALTER TABLE 네이버블로그 ADD CONSTRAINT 네이버블로그_ID_FK FOREIGN KEY(ID)
            REFERENCES 네이버회원(ID);
            
ALTER TABLE 네이버블로그 DROP CONSTRAINT 네이버블로그_FK ;

ALTER TABLE 네이버블로그 ADD CONSTRAINT FK_네이버블로그 FOREIGN KEY(ID)
            REFERENCES 네이버회원(ID);
            
            
            
            

