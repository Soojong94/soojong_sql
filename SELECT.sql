-- 주석 처리 기호 
-- SQL문장은 대소문자를 구분하지 않는다. 
-- 띄어쓰기나 줄바꿈 또한 명령어 수행에 영향을 주지 않는다. 
-- SQL 문장 끝에는 꼭 세미콜론 (;) 을 찍어야 한다.
-- 실행은 CTRL + ENTER , F9 

/* 여러 줄 주석처리 */ 

/* *************** SELECT **************** */
-- 데이터를 검색하거나 조회할 때 사용하는 SQL QUERY 문법 

-- 1. 전체 조회 (출력) 
-- * : 애스터리스크 => '전체' 
-- 성능이 감소, 어떤 컬럼정보를 이용하는지 한눈에 보기가 어렵기 때문에 실무에서는 자주 사용X 

SELECT * 
  FROM EMPLOYEES; 
  
-- 실습 : 부서 테이블에 있는 전체 정보를 출력하기 (DEPARTMENTS)
SELECT *
  FROM DEPARTMENTS;
  
  -- 2. 원하는 컬럼만 출력하기
 /*
    SELECT 컬럼1, 컬럼,2 컬럼3
    FROM 테이블
 */
 
 SELECT employee_id, employees_seq.nextval
   FROM EMPLOYEES;
 
 /*
    실습 
    1) 직원 테이블의 직원 ID, 이름, 입사일 출력 
    2) 부서 테이블에서 부서 ID, 부서명, 근무지 ID를 출력 
    
    문제 풀었으면 각 번호의 단톡에 체크!  
*/
  
  SELECT employee_id, first_name, last_name, hire_date
    FROM employees;

  SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID
    FROM DEPARTMENTS;
        
-- 3. DISTINCT 를 이용해서 중복 제거
-- 컬럼이 1개인 경우 해당 컬럼의 중복을 제거한다
-- 그러나 컬럼이 여러개인 경우 컬럼+컬럼 값의 중복을 제거 해줌
-- 그래서 한가지 컬럼만 다를 경우, 중복으로 출력되기도 한다

SELECT DISTINCT DEPARTMENT_ID
  FROM EMPLOYEES;

/* 실습
  1. 직원 테이블에서 입사일을 출력 -> 행의 개수를 확인, 옆에 주석
  2. 직원 테이블에서 입사일 중복제거 출력 -> 행의 개수를 확인, 옆에 주석
  
*/
  SELECT HIRE_DATE
    FROM EMPLOYEES;
  --107개
  
  SELECT DISTINCT HIRE_DATE
    FROM EMPLOYEES;
   --98개
 
 -- 4. 별칭 지정하기
 -- 4-1. 컬럼 이름이 너무 길거나, 다르게 표현할 경우
 
SELECT EMPLOYEE_ID 직원고유번호1
FROM employees;
   
SELECT EMPLOYEE_ID "직원고유번호2"
FROM employees;
   
SELECT EMPLOYEE_ID AS 직원고유번호3
FROM employees;
   
SELECT EMPLOYEE_ID AS "직원고유번호4"
FROM employees;
   
   -- 4-2. 내가 가진 컬럼을 변형해서 사용할 경우
   
   SELECT SALARY AS 월급
   ,SALARY*12 AS 연봉
     FROM EMPLOYEES;
     
     /* 직원 테이블에서 입사일, 입사 다음날 출력할 것
     
     입사일은 "입사일" 로 표현
     입사 다음날은  "계약서 작성일"로 표현
     단, 4가지 표현법으로 모두 작성
     
     */
     
     SELECT HIRE_DATE 입사일, HIRE_DATE+1 "계약서 작성일"
       FROM EMPLOYEES;
       
       SELECT HIRE_DATE AS 입사일, HIRE_DATE+1 AS "계약서 작성일"
       FROM EMPLOYEES;
 
 /* 별칭 사용시 주의 사항
 
1. 별칭에는 띄어쓰기를 사용할 수 없음
2. 문자로 시작해야됨
3. 예약어 불가(기존에 사용하고 있는 문법 키워드)
4. 특수문자 $, _, # 세 개만 가능

*/
 
 -- 5.  NULL 
 SELECT SALARY*12 AS 연봉
   FROM EMPLOYEES;
 INSERT INTO EMPLOYEES
 (  employee_id, last_name, EMAIL, hire_date, job_id )
 VALUES (
 207, '박' , 'PARK' , SYSDATE, 'IT_PROG'
 ); 
   
 
 
 
 
 
 
 
 
 
 
 
  