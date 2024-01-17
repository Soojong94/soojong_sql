/*****************************TCL*********************************/
-- TCL  :  트랜잭션 제어어
--트랜잭션 (TRANSACTION) : 업무를 수행하기 위한 최소 수행 단위

-- 트랜잭션의 4가지 특성 : 원일고지
-- 1. 원자성 : ALL OR NOTHING (성공 / 실패)
-- 2. 일관성 : 언제나 일관성 있게 유지
-- 3. 고립성 : 트랜잭션 실행시 다른 트랜잭션에 영향 X
-- 4. 지속성 : 한번 COMMIT 한 트랜잭션은 영원히 반영

--COMMIT : DB 에 영구적으로 저장
--ROLLBACK : 트랜잭션 취소, 마지막 COMMIT 시점까지는 복구 가능

CREATE TABLE 카카오뱅크(
   계좌번호 VARCHAR2(50) PRIMARY KEY,
   이름 VARCHAR2(12),
   잔액 NUMBER
);

INSERT INTO 카카오뱅크
   VALUES ('3333 123 123' , 'CHILD', 150000);
   
INSERT INTO 카카오뱅크
    VALUES ('3333-92-912-0423', '김한빛', 200);
     
 INSERT INTO 카카오뱅크
     VALUES ('3333-01-010-0000','김현빈',100);
   
SELECT *
 FROM 카카오뱅크;
   
ROLLBACK;
   
   --롤백하면 INSERT 했던 계좌가 사라짐
   --DML (INSERT , UPDATE, DELETE)은 COMMIT 없이는 테이블에 영구반영되지 않는다(ROLLBACK 가능)
   --DROP, TURNCATE 는 ROLLBACK 불가
   
-- 송금 트랜잭션 실행 (김한빛 -> 김현빈 100원 송금) 

-- 1. 김한빛씨의 계좌에 잔액이 100원 이상 있는지 출력 (SELECT) 
-- 2. 김한빛씨의 계좌에서 100원 차감 (UPDATE SET) 
-- 3. 김현빈씨의 계좌에 100원 추가 (UPDATE SET) 
-- 4. COMMIT 으로 저장 
-- 5. 카카오뱅크 전체 출력 

UPDATE 카카오뱅크
      SET 이름 = '김수종'
 WHERE 이름 = 'CHILD';

SELECT 잔액
FROM 카카오뱅크
WHERE 이름 = '김한빛';

UPDATE 카카오뱅크
      SET 잔액 = 100
WHERE 이름 = '김한빛';

UPDATE 카카오뱅크
     SET 잔액  = 잔액 + 100
WHERE 이름 = '김현빈';

     
COMMIT;

SELECT *
FROM 카카오뱅크;

INSERT INTO 카카오뱅크
     VALUES ('3333-01-010-0122','박병관',999999)  ; 
     