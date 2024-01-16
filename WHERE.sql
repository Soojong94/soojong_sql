/*************WHERE***********/

--  SELECT 로 출력했던 데이터는 모든 데이터를 전부 가져왔다
-- 필요한 데이터만 출력하기 위해 WHERE 절을 사용

SELECT *
  FROM employees;
  
  SELECT *
    FROM DEPARTMENTS;
    
    --1. WHERE 절
    
    SELECT *
     FROM employees
    WHERE job_id = 'IT_PROG';
    
    -- 저는 직원 중에서 직원 아이디가 105인 사람의 성과 이름을 출력하겠습니다. 
    
    SELECT LAST_NAME, FIRST_NAME
     FROM  employees
   WHERE employee_id = '105'  ;
 
    --2. 산술 연산자 (+, -, *, /)
    --컬럼에 산술 연산자를 사용하면 그 컬럼에 해당하는 모든 행에 산술이 진행된다.
    --SALARY * 12 -> 모든 행이 가지고 있는 SALARY *12
    
    
    SELECT SALARY, SALARY*10
      FROM employees; 
      
      --3. 비교 연산자 (=, >, >=, <, <=)
      
      
      --1. 부서 ID가 50 인 사람의 직원ID ,부서 ID 를 출력
      --2. 직원 테이블에서 급여가 5,000 이하인 사람들의 이름과 급여를 출력
      --3. 직원 테이블이 연봉이 50,000 이상인 사람들의 이름과 연봉을 출력
      
      --(단, 연봉은 'ANNSAL' 로 출력)
      -- 위에서 사용되는 개념 비교연산자, 산술연산자, WHERE 절, AS, SELECT문
      
      SELECT EMPLOYEE_ID, department_id
       FROM employees
    WHERE department_id = '50';
    
    SELECT LAST_NAME, FIRST_NAME, SALARY
      FROM employees
    WHERE SALARY <= '5000';
    
     SELECT LAST_NAME, FIRST_NAME, SALARY*12 AS ANNSAL
      FROM employees
    WHERE SALARY*12 >= '50000';
    
    -- 4. 등가 비교 연산자( !=, ^=, <>, NOT)
    --<> 기본적으로 해당 연산자를 가장 많이 사용함 , 성능차이는 없음
    
    SELECT *
     FROM EMPLOYEES
    WHERE department_id != '50';
    
    SELECT *
     FROM EMPLOYEES
    WHERE department_id ^= '50';    
    
     SELECT *
     FROM EMPLOYEES
    WHERE department_id <> '50';     
    
    SELECT *
     FROM EMPLOYEES
    WHERE NOT department_id = '50';    
    
    -- 실습
    -- 1)급여가 10000 미만이 아닌 직원의 ID와 이름을 출력
    -- 2) JOB_ID가 IT_PROG이 아닌 직원의 이름과 JOB_ID 출력
    
    SELECT EMPLOYEE_ID, LAST_NAME
      FROM employees
    WHERE NOT SALARY <  '10000'; 
    
    SELECT LAST_NAME, JOB_ID
      FROM employees
    WHERE JOB_ID <> 'IT_PROG' ;
    
    --5. 논리 연산자(AND, OR) : 조건식을 여러 개 사용하고 싶을 때
    --1) 부서 ID - 90 이고 급여가 5000 이상인 직원의 ID와 이름 출력
    
    SELECT EMPLOYEE_ID , LAST_NAME
      FROM employees
    WHERE department_id = '90'
        AND SALARY >= '5000';
        
    --2) 부서 ID가 100 이거나, 입사일이 16년 2월 2일 이후에 입사한 직원의 이름
    
    SELECT LAST_NAME
     FROM employees
   WHERE department_id = '100'
         OR hire_date >= '16-02-02';
         
         --날짜 데이터는 20XX 가능 , (/ -) 변환 가능
         
         
/*
      
    AND, OR 실습문제 (숙제) 
    1. 부서 ID가 100이거나, 50인 직원 중에서 
        연봉이 10000 이상인 직원의 ID, 이름, 그리고 연봉을 출력 (연봉 AnnSal로 출력) 
      * 단, AND가 OR보다 힘이 세다. AND 먼저 진행이 됨 
        만약에 OR를 먼저 진행하고 싶으면 괄호 안에 넣어야 함 
    2. 부서 ID가 100이거나 90인 직원 중, 직원 ID가 101인 사람의 이름과 연봉 출력 
    
*/
         
         -- 6. IS NULL, IS NOT NULL
         -- NULL 은 존재하지 않는 값이기 때문에 비교가 불가능하다
         -- NULL 값과 관련해서 사용할 수 있는 연산자는 IS NULL, IS NOT NULL 단 두 개 뿐
         
         
         -- 핸드폰 번호가 NULL 인 직원의 이름과 핸드폰번호를 출력
         
         SELECT LAST_NAME, PHONE_NUMBER
           FROM EMPLOYEES 
         WHERE phone_number IS NULL;
         
          SELECT LAST_NAME, PHONE_NUMBER
           FROM EMPLOYEES 
         WHERE phone_number IS NOT NULL ;       
         
         
         -- 7. IN / NOT IN
         -- IN 연산자 : OR 연산자
         --부서 ID가 30,50,90 인 대상의 정보를 출력하겠습니다. 
         
         SELECT *
          FROM employees
        WHERE department_id = 30
              OR department_id = 50
              OR department_id = 90;
              
       --IN 사용
       --IN 연산자 안에서 NULL은 무시된다. **IN (30, 50, 90, NULL)-NULL 안 나옴
              
         SELECT *
          FROM employees
        WHERE department_id IN (30, 50, 90) ;
        
        --NOT IN 연산자 : IN 뒤의 조건에 해당하지 않는 데이터를 출력
        --NOT은 부정의 의미 -> 부정은 반대로
        
         SELECT *
          FROM employees
        WHERE department_id NOT IN (30,50,90);        
        
        /*
        NOT IN 은 AND 연산자 이기 때문에 하나라도 FALSE가 나오면
        다른 행도 전부 FALSE 가 되어버림
        그래서 NOT IN 안에 NULL 값을 넣으면
        모든 값이 FALSE 가 되어버려서 아무 값도 나오지 않는다
        */  
                        
/*

    실습 문제 
    1. 매니저의 ID가 100이거나 120인 직원의 이름과 매니저 ID를 출력해라 (단, OR연산자는 사용X) 
    2. JOB_ID가 AD_VP 이거나 ST_MAN 인 사람의 이름과 JOB_ID 를 출력 (단, OR연산자 사용x) 
    3. 매니저 ID가 145,146,147,148,149가 아닌 직원의 이름과 매니저 ID 출력 (단, AND 연산자 X) 
    
*/

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
   
SELECT LAST_NAME, SALARY*12  AS AnnSal
  FROM EMPLOYEES 
 WHERE (DEPARTMENT_ID = '100' 
    OR DEPARTMENT_ID = '90')
   AND EMPLOYEE_ID = '101';




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
 
-- 8. BETWEEN : 범위 조건 연산자
-- 급여가 10,000 ~20,000 사이의 직원을 출력하시오.

SELECT LAST_NAME, SALARY
  FROM EMPLOYEES
  WHERE salary BETWEEN 10000 AND 19999;

SELECT LAST_NAME, HIRE_DATE
  FROM EMPLOYEES
  WHERE hire_date BETWEEN '05/01/01' AND '05/12/31';

--  9. LIKE  : 특정 조건을 검색할 때 
-- 9-1) %
-- 이름이 S로 시작하는 직원

SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE first_name LIKE 'S%';

-- 9-2) 이름이 s로 끝나는 직원 출력

SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE first_name LIKE '%s';
 
 -- 이름에 s 가 포함된 직원 출력
 
 SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE first_name LIKE '%s%'
       OR first_name LIKE '%S%';
       
-- 9-2) _ 

-- 직원 아이디가 1로 시작하는 3글자로 되어 있는 데이터 검색

 SELECT EMPLOYEE_ID 
  FROM EMPLOYEES
 WHERE employee_id LIKE '1__';
 
 /*실습문제

1. 핸드폰 번호에 650이 포함되어 있는 번호/ 이름 출력
2. 이름에 두번째 글자가 e인 직원 찾기 : 이름 출력 (FIRST_NAME)
   ex) Kelly, Renske 
3. 이름이 S로 시작하고, n으로 끝나는 직원의 이름을 출력  (FIRST_NAME)
*/

SELECT PHONE_NUMBER, LAST_NAME
  FROM EMPLOYEES
WHERE phone_number LIKE '%650%'; 

SELECT FIRST_NAME
  FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_e%';

SELECT FIRST_NAME
  FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'S%n' ;

--SELECT 가져올 컬럼 
--FROM 가져올 테이블 
--WHERE 조건 
--
--조건 OR 조건
--조건 AND 조건 
--IN (조건1, 조건2, 조건3)
--NOT IN (조건1, 조건2) 
--LIKE <- 안에 들어간 검색 

