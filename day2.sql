/*********** where ***********/

-- 우리가 이제까지 SELECT로 출력했던 데이터는 모든 데이터를 전부 가져왔어야했음 
-- 우리는 이제부터 필요한 데이터만 출력하기 위해서 WHERE 절을 사용 

SELECT * 
  FROM EMPLOYEES; 
  
SELECT * 
  FROM DEPARTMENTS; 
  
-- 1. WHERE 절 
SELECT *
  FROM EMPLOYEES 
 WHERE JOB_ID = 'IT_PROG'; 
 
 -- 저는 직원 중에서 직원 아이디가 105인 사람의 성과 이름을 출력하겠습니다. 
SELECT FIRST_NAME, LAST_NAME 
  FROM EMPLOYEES 
 WHERE EMPLOYEE_ID = 105;
 
-- 2. 산술 연산자 (+, -, *, / ) 
-- 컬럼에 산술 연산자를 사용하면 그 컬럼에 해당하는 모든 행에 산술이 진행된다. 
-- SALARY * 12 => 모든 행이 가지고 있는 SALARY * 12 

SELECT SALARY, SALARY*10 
  FROM EMPLOYEES;
 
-- 3. 비교 연산자 (=, >, >=, < , <=) 

-- 1. 부서 ID가 50인 사람의 직원 ID, 부서 ID 를 출력 
SELECT EMPLOYEE_ID, DEPARTMENT_ID 
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 50; 

-- 2. 직원 테이블에서 급여가 5000 이하인 사람들의 이름과 급여를 출력 
SELECT LAST_NAME, SALARY 
  FROM EMPLOYEES 
 WHERE SALARY <= 5000; 

-- 3. 직원 테이블에서 연봉(!!) 50000 이상인 사람들의 이름과 연봉을 출력 
--     (단, 연봉은 'ANNSAL'로 출력) 
SELECT LAST_NAME, SALARY*12 AS ANNSAL
  FROM EMPLOYEES
 WHERE SALARY*12 >= 50000; 


-- * HINT : 위에서 사용되는 개념 비교연산자, 산술연산자, WHERE절, AS, SELECT문
 
-- 4. 등가 비교 연산자 (!=, ^=, <>, NOT) 
-- <> 기본적으로 해당 연산자를 가장 많이 사용함 
-- 기본적으로 성능 차이는 없고 동일한 연산자다 

SELECT *
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID != 50 ; 
 
 SELECT *
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID ^= 50 ; 

SELECT *
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID <> 50 ; 
 
SELECT *
  FROM EMPLOYEES 
 WHERE NOT DEPARTMENT_ID = 50 ; 

-- 실습 
-- 1) 급여가 10000 미만이 아닌 직원의 ID와 이름을 출력 (10000 이상인 직원) 
SELECT EMPLOYEE_ID, LAST_NAME
  FROM EMPLOYEES 
 WHERE SALARY >= 10000;

-- 2) JOB_ID가 IT_PROG이 아닌 직원의 이름과 JOB_ID를 출력해라 
SELECT LAST_NAME, JOB_ID 
  FROM EMPLOYEES 
 WHERE JOB_ID <> 'IT_PROG';


-- 5. 논리 연산자 (AND, OR) : 조건식을 여러개 사용하고 싶을 때 

-- 1) 부서 ID = 90 이고 급여가 5000 이상인 직원의 ID와 이름 출력 (AND)
SELECT EMPLOYEE_ID, LAST_NAME
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 90
   AND SALARY >= 5000;

-- 2) 부서 ID가 100 이거나, 입사일이 16년 02월 02일 이후에 입사한 직원의 이름 (OR) 
SELECT LAST_NAME
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID = 100 
    OR HIRE_DATE >= '16-02-02'; 
-- 날짜 데이터는 20XX 가능, / - 변환 가능 



 
-- 6.  IS NULL, IS NOT NULL 
-- NULL은 존재하지 않는 값이기때문에 비교가 불가능하다 
-- NULL 값과 관련해서 사용할 수 있는 연산자는 IS NULL, IS NOT NULL 단 두개 뿐! 

-- 핸드폰 번호가 NULL 인 직원의 이름과 핸드폰번호를 출력 
SELECT LAST_NAME, PHONE_NUMBER 
  FROM EMPLOYEES
 WHERE PHONE_NUMBER IS NULL;
 
SELECT LAST_NAME, PHONE_NUMBER 
  FROM EMPLOYEES
 WHERE PHONE_NUMBER IS NOT NULL;


-- 7. IN / NOT IN 
-- IN 연산자 : OR 연산자 

-- 부서 ID가 30,50,90인 대상의 정보를 출력하겠습니다. 

SELECT *
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID = 30
    OR DEPARTMENT_ID = 50
    OR DEPARTMENT_ID = 90;

-- 위와 동일, IN 사용 
-- ** IN연산자 안에서 NULL 은 무시된다. 
SELECT * 
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (30,50,90, NULL);
 
 
 
 /*
    AND, OR 실습문제 (숙제) 
    1. 부서 ID가 100이거나, 50인 직원 중에서 
        연봉이 10000 이상인 직원의 ID, 이름, 그리고 연봉을 출력 (연봉 AnnSal로 출력) 
      * 단, AND가 OR보다 힘이 세다. AND 먼저 진행이 됨 
        만약에 OR를 먼저 진행하고 싶으면 괄호 안에 넣어야 함 
    2. 부서 ID가 100이거나 90인 직원 중, 직원 ID가 101인 사람의 이름과 연봉 출력 
    
*/

SELECT EMPLOYEE_ID, LAST_NAME, SALARY*12 AS AnnSal
  FROM EMPLOYEES
 WHERE (DEPARTMENT_ID = '100'
    OR DEPARTMENT_ID = '50')
   AND salary*12 >= 10000;
   
SELECT LAST_NAME, SALARY * 12  AS ANNSAL
  FROM employees
 WHERE DEPARTMENT_ID = '100'
    OR DEPARTMENT_ID = '90';



/*
    실습 문제 
    1. 매니저의 ID가 100이거나 120인 직원의 이름과 매니저 ID를 출력해라 (단, OR연산자는 사용X) 
    2. JOB_ID가 AD_VP 이거나 ST_MAN 인 사람의 이름과 JOB_ID 를 출력 (단, OR연산자 사용x) 
    3. 매니저 ID가 145,146,147,148,149가 아닌 직원의 이름과 매니저 ID 출력 (단, AND 연산자 X) 
    
*/

SELECT LAST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE manager_id IN (100,120);
 
 SELECT LAST_NAME, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID IN ('AD_VP' , 'ST_MAN' );
 
  SELECT LAST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID NOT IN (145 , 146, 147, 148, 149 );
 






