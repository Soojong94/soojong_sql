/*********************************DCL*********************************/

--DCL : 데이터 제어어 (권한 부여 , 권한 회수 , 권한 묶음)

-- 1. 사용자 생성
CONN SYSTEM/12345;
CREATE USER 유저이름 IDENTIFIED BY 비밀번호;


-- 2. DB에 접속할 수 있는 권한 생성
GRANT CREATE SESSION TO 유저이름;

--3. DB에 접속할 수 있는 권한 회수
REVOKE CREATE SESSION FROM 유저이름;

--4. 테이블 생성 권한
GRANT RESOURCE TO 유저이름;


--5. HR 계정 유저 권한 주기
GRANT SELECT, UPDATE 
     ON 다른유저, 객체
     TO 유저이름;
     
     CREATE TABLE TEST(
     TEST NUMBER);
     
     SELECT  *
     FROM TEST;
     
-- 스키마
-- 각 계정마다 존재하고, 이름이 계정과 같음
-- 오라클에서는 계정과 스키마를 구분하지 않고 사용

SELECT *
 FROM DCLTEST.TEST;
 
 --원래 대로라면  스키마.테이블.컬럼 형태로 작성해야하지만
 --자동으로 접속한 계정의 스키마로 접근 가능해서 그동안 생략했던 거임
 
 SELECT *
   FROM HR.EMPLOYEES;

--HR 계정에서 객체 권한 주기

-- GRANT SELECT, UPDATE
--    ON HR.EMPLOYEES
--     TO DCLTEST;

--------------------------------------------------

UPDATE HR.EMPLOYEES
      SET FIRST_NAME = '수룡'
 WHERE EMPLOYEE_ID = 207;
 
 