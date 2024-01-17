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
     
     
     
