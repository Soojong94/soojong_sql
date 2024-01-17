/**********************************DML*********************************/

-- DML : 테이블 안에 들어있는 데이터에 변형을 가하는 명령어 

-- 1. INSERT : 데이터 추가 
INSERT INTO 테이블(컬럼리스트)
     VALUES (컬럼리스트 안에 각각 대입할 값들);
     
INSERT INTO 테이블(컬럼1, 컬럼2)
     VALUES (값1, 값2);
     
SELECT *
  FROM 네이버회원;
  
INSERT INTO 네이버회원
     VALUES ('smart123', '김인재', '1234', '2005-02-04','남'); 

-- 오류 1) SQL 오류: ORA-00947: not enough values
-- 컬럼의 개수가 안맞아서 생기는 오류, 컬럼의 개수와 내가 적은 값은 개수를 매칭해보기! 

INSERT INTO 네이버회원(네이버ID, 비밀번호) 
     VALUES ('juhee','1234');
     
-- 오류 2) ORA-01400: cannot insert NULL into ("HR"."네이버회원"."이름")
-- 따로 지정하지 않은 컬럼에는 (이름, 생년월일, 성별) 자동으로 null 값이 들어감 
-- 이름 컬럼에는 NOT NULL 제약조건을 걸어두었기 때문에 오류가 발생 

INSERT INTO 네이버회원(네이버ID,비밀번호,이름) 
     VALUES ('juhee','1234','이주희'); 
     
INSERT INTO 네이버회원(네이버ID,비밀번호,이름)
    VALUES ('hodoodaddy','1234','박병관','2005-01-25');

-- 오류 3) SQL 오류: ORA-00913: too many values
-- 컬럼리스트와 컬럼값의 개수가 맞지 않아서 오류 발생 

INSERT INTO 네이버회원 
     VALUES ('yeho', '1234','나예호',040125,'남');

-- 오류 4) SQL 오류: ORA-00932: inconsistent datatypes: expected DATE got NUMBER
-- 생년월일 자리에는 DATE를 넣어주기로 했는데 숫자가 들어가서 오류 발생 

-- 오류 5) ORA-00001: unique constraint (HR.회원_ID_PK) violated
-- 아이디는 중복값이 들어갈 수 없는데, 이미 있는 아이디를 또 추가하려고 해서 오류 발생 

INSERT INTO 네이버회원 
     VALUES ('beom','신범식','1234','2023-09-08','냠'); 
     
-- 오류 6) ORA-02290: check constraint (HR.회원_성별_CK) violated
-- CHECK 제약 조건에 어긋나서 오류 발생 

INSERT INTO 네이버회원
     VALUES ('hongju','위홍주본부장입니다만나서반갑습니다','1234','2024-01-01','남');

-- 오류 7) ORA-12899: value too large for column "HR"."네이버회원"."이름" (actual: 51, maximum: 12)
-- 이름 최대 크기를 12 바이트로 지정 
-- 한글은 3바이트, 영어 2바이트 => 최대 크기를 넘긴 것 
-- actual : 내가 실제 사용한 크기, maximum : 지정된 최대 크기 


-- 컬럼의 크기 조정 
ALTER TABLE 네이버회원 MODIFY 이름 VARCHAR2 (52); 


-- INSERT 실습 
-- 1. 부서 (한글) 테이블 5개의 부서를 추가한다. 
--  연구개발팀(1), 교육운영부(2), 기획팀(3), 홍보팀(4), 외부강사(5) 
-- 지정해주지 않은 값들은 NULL 로 처리 

SELECT *
  FROM 부서;
  
INSERT INTO 부서 
     VALUES (1, '연구개발팀',NULL, NULL);   
INSERT INTO 부서 
     VALUES (2, '교육운영부',NULL, NULL);   
INSERT INTO 부서 
     VALUES (3, '기획팀',NULL, NULL);   
INSERT INTO 부서 
     VALUES (4, '홍보팀',NULL, NULL);   
INSERT INTO 부서 
     VALUES (5, '외부강사',NULL, NULL); 

-- 2. 직원 (한글) 테이블에 값을 넣을 것 
-- 직원 테이블을 본인이 잘 분석해서 NULL 이 가능한 컬럼에는 NULL 값을, 
-- NULL 이 불가능한 컬럼에는 본인의 정보로 채우기 

SELECT *
  FROM 직원;

INSERT INTO 직원 (직원ID, 이름, 성, 이메일, 입사일, 직업ID)
    VALUES (1,'영표','선','seonzeroticket@gmail.com',SYSDATE,'ABC');
    
-- 3. 2번까지 된 사람들은 본인 '팀'단톡방에 공유 

INSERT INTO 직원 VALUES (2, '은비', '이', 'EUNBEE@gmail.com', '010-0000-0000', sysdate, 'JAVA', 10000, NULL, NULL, 5);
INSERT INTO 직원 VALUES (3, '원호', '박', '1HO@gmail.com', '010-1111-1111', sysdate, 'JAVA', 10000, NULL, NULL, 2);
INSERT INTO 직원 VALUES (4, '수현', '박', 'SUE@gmail.com', '010-2222-2222', sysdate, 'DB', 10000, NULL, NULL, 1);

-- 4. 본인 팀 데이터도 채워넣기 

-- 3번까지 되셨으면 '개인 완료' 에 체크
-- 4번까지 되셨으면 '팀 완료'에 체크 




COMMIT;

/**********************************DML*********************************/

-- DML : 테이블 안에 들어있는 데이터에 변형을 가하는 명령어 

-- [1] INSERT : 데이터 추가 
INSERT INTO 테이블(컬럼리스트)
     VALUES (컬럼리스트 안에 각각 대입할 값들);
     
INSERT INTO 테이블(컬럼1, 컬럼2)
     VALUES (값1, 값2);
     
SELECT *
  FROM 네이버회원;
  
INSERT INTO 네이버회원
     VALUES ('smart123', '김인재', '1234', '2005-02-04','남'); 

-- 오류 1) SQL 오류: ORA-00947: not enough values
-- 컬럼의 개수가 안맞아서 생기는 오류, 컬럼의 개수와 내가 적은 값은 개수를 매칭해보기! 

INSERT INTO 네이버회원(네이버ID, 비밀번호) 
     VALUES ('juhee','1234');
     
-- 오류 2) ORA-01400: cannot insert NULL into ("HR"."네이버회원"."이름")
-- 따로 지정하지 않은 컬럼에는 (이름, 생년월일, 성별) 자동으로 null 값이 들어감 
-- 이름 컬럼에는 NOT NULL 제약조건을 걸어두었기 때문에 오류가 발생 

INSERT INTO 네이버회원(네이버ID,비밀번호,이름) 
     VALUES ('juhee','1234','이주희'); 
     
INSERT INTO 네이버회원(네이버ID,비밀번호,이름)
    VALUES ('hodoodaddy','1234','박병관','2005-01-25');

-- 오류 3) SQL 오류: ORA-00913: too many values
-- 컬럼리스트와 컬럼값의 개수가 맞지 않아서 오류 발생 

INSERT INTO 네이버회원 
     VALUES ('yeho', '1234','나예호',040125,'남');

-- 오류 4) SQL 오류: ORA-00932: inconsistent datatypes: expected DATE got NUMBER
-- 생년월일 자리에는 DATE를 넣어주기로 했는데 숫자가 들어가서 오류 발생 

-- 오류 5) ORA-00001: unique constraint (HR.회원_ID_PK) violated
-- 아이디는 중복값이 들어갈 수 없는데, 이미 있는 아이디를 또 추가하려고 해서 오류 발생 

INSERT INTO 네이버회원 
     VALUES ('beom','신범식','1234','2023-09-08','냠'); 
     
-- 오류 6) ORA-02290: check constraint (HR.회원_성별_CK) violated
-- CHECK 제약 조건에 어긋나서 오류 발생 

INSERT INTO 네이버회원
     VALUES ('hongju','위홍주본부장입니다만나서반갑습니다','1234','2024-01-01','남');

-- 오류 7) ORA-12899: value too large for column "HR"."네이버회원"."이름" (actual: 51, maximum: 12)
-- 이름 최대 크기를 12 바이트로 지정 
-- 한글은 3바이트, 영어 2바이트 => 최대 크기를 넘긴 것 
-- actual : 내가 실제 사용한 크기, maximum : 지정된 최대 크기 


-- 컬럼의 크기 조정 
ALTER TABLE 네이버회원 MODIFY 이름 VARCHAR2 (52); 


-- INSERT 실습 
-- 1. 부서 (한글) 테이블 5개의 부서를 추가한다. 
--  연구개발팀(1), 교육운영부(2), 기획팀(3), 홍보팀(4), 외부강사(5) 
-- 지정해주지 않은 값들은 NULL 로 처리 

SELECT *
  FROM 부서;
  
INSERT INTO 부서 
     VALUES (1, '연구개발팀',NULL, NULL);   
INSERT INTO 부서 
     VALUES (2, '교육운영부',NULL, NULL);   
INSERT INTO 부서 
     VALUES (3, '기획팀',NULL, NULL);   
INSERT INTO 부서 
     VALUES (4, '홍보팀',NULL, NULL);   
INSERT INTO 부서 
     VALUES (5, '외부강사',NULL, NULL); 

-- 2. 직원 (한글) 테이블에 값을 넣을 것 
-- 직원 테이블을 본인이 잘 분석해서 NULL 이 가능한 컬럼에는 NULL 값을, 
-- NULL 이 불가능한 컬럼에는 본인의 정보로 채우기 

SELECT *
  FROM 직원;

INSERT INTO 직원 (직원ID, 이름, 성, 이메일, 입사일, 직업ID)
    VALUES (1,'영표','선','seonzeroticket@gmail.com',SYSDATE,'ABC');
    
-- 3. 2번까지 된 사람들은 본인 '팀'단톡방에 공유 

INSERT INTO 직원 VALUES (2, '은비', '이', 'EUNBEE@gmail.com', '010-0000-0000', sysdate, 'JAVA', 10000, NULL, NULL, 5);
INSERT INTO 직원 VALUES (3, '원호', '박', '1HO@gmail.com', '010-1111-1111', sysdate, 'JAVA', 10000, NULL, NULL, 2);
INSERT INTO 직원 VALUES (4, '수현', '박', 'SUE@gmail.com', '010-2222-2222', sysdate, 'DB', 10000, NULL, NULL, 1);

-- 4. 본인 팀 데이터도 채워넣기 

-- 3번까지 되셨으면 '개인 완료' 에 체크
-- 4번까지 되셨으면 '팀 완료'에 체크 


COMMIT; 

-- [2] 저장된 데이터 변경 : UPDATE SET WHERE 
UPDATE 테이블
   SET 변경할컬럼 = 변경할데이터
 WHERE 행의 조건 ; 
 
SELECT *
  FROM 직원;
  
-- 나의 직업을 내가 좋아하는 과목으로 변경 
UPDATE 직원 
   SET 직업ID = 'DB'
 WHERE 직원ID = 1;

ROLLBACK;

-- [3] 데이터 삭제 : DELETE 

-- 3-1) DELETE FROM 테이블 ; : 테이블 내의 모든 데이터 삭제 (단, 롤백 가능) 
DELETE FROM 직원;

-- 3-2) DELETE FROM 테이블 WHERE 조건 ; : 조건에 해당하는 데이터만 삭제 (단, 롤백 가능)
DELETE FROM 직원
 WHERE 직원ID = 1;
 
-- 3-3) TRUNCATE TABLE 테이블 : 테이블 내의 모든 데이터 삭제 (롤백 불가) 
TRUNCATE TABLE 직원;

-- 3-4) DROP TABLE 테이블 : 테이블 자체가 통으로 삭제 (롤백 불가) 

COMMIT;