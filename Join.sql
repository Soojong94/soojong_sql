/************************JOIN*************************/

-- JOIN 여러 개의 테이블을 연결해서 사용하는 것
-- 필요한 데이터가 두 개 이상의 테이블에 나눠져 있을 때 데이터를 합쳐서 가져오고자 사용
--직원 ID 가 100인 직원의 부서이름을 출력
--직원 ID(직원 테이블) / 부서이름 (부서테이블)

--JOIN 문법을 모른다는 가정 하에 진행
--1. 직원 ID가 100인 직원을 찾는다 -> 부서 ID를 가져온다


SELECT DEPARTMENT_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID=100;

--2.  부서 ID가 90인 부서의 이름을 가져온다

SELECT DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE DEPARTMENT_ID = 90;

--만약 내가 JOIN 문법을 알고 있다면

SELECT D.DEPARTMENT_NAME
FROM EMPLOYEES  E , DEPARTMENTS  D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND E.EMPLOYEE_ID =100; 

/**********FROM************/
-- FROM 절에 테이블을 여러 개 사용 가능 + 각 테이블의 별칭을 지정
-- 내가 사용할 테이블1 이름 테이블1 별칭, 테이블2 이름 테이블 2 별칭
-- EX) EMPLOYEES E ,  DEPARTMENT D
-- 만약 테이블을 여러개 사용하는 경우 꼭! 어떤 테이블을 이용할건지
-- 명확하게 별칭으로 지정해줘야 함

SELECT  D.DEPARTMENT_ID
  FROM EMPLOYEES E, DEPARTMENTS D;
  
--  만약 한 테이블에만 있는 컬럼이라면 굳이 별칭 없이도 사용 가능
  
  
SELECT EMPLOYEE_ID
FROM EMPLOYEES E , DEPARTMENTS D;

--별칭을 주고나면 , 그 뒤에 오는 실행절들은 모두 그 별칭만 사용해야함

--오류(풀네임도 안 됨)
SELECT  DEPARTMENTS.DEPARTMENT_ID
  FROM EMPLOYEES E, DEPARTMENTS D;
  
  
-- [CROSS JOIN] : 조건 없이 모든 행을 JOIN 해서 출력
-- 카티션 곱

-- 1. 직원 테이블만 출력
SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID
FROM EMPLOYEES E;

-- 2. 부서 테이블만 출력
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME
  FROM DEPARTMENTS D;

-- 3. 두 테이블을 JOIN 해서 출력

SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D;
--108*27 개

-- [INNER JOIN] : 테이블 간의 교집합, JOIN 중에서 가장 일반적인 방법
-- JOIN 하세요 == INNER JOIN 하세요

--직원 아이디가 114번인 사람의 직원 ID, 이름, 부서 ID, 부서이름을 출력하세요
-- 내가 가져와야할 테이블이 두개 이상일 경우


--1) WHERE 조건절을 사용해서 INNER JOIN
--단점 ORACLE 에서만 사용 가능

SELECT E.EMPLOYEE_ID, FIRST_NAME , D.DEPARTMENT_ID, DEPARTMENT_NAME
FROM EMPLOYEES E , DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
   AND EMPLOYEE_ID = 114;
   
--   2)ANSI 문법을 사용
--   미국국립표준협회 ANSI에서 만든 문법, 모든 db에서 사용 가능->권장


--  SELECT 컬럼
--  FROM A테이블 INNER JOIN B 테이블
--     ON  (조건) ;

SELECT E.EMPLOYEE_ID, FIRST_NAME , D.DEPARTMENT_ID, DEPARTMENT_NAME
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON  (E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND EMPLOYEE_ID = 114);

-- 두 테이블에 모두 데이터가 있어야만 결과가 나온다
-- INNER JOIN 에서는 NULL  값이 나오지 않는다. 
-- WHY ? (직원-부서아이디 / 부서-부서아이디 )비교연산이 불가능하기 때문

--실습문제
--1 문제 답 2개 씩 / 오라클 문법/ 표준문법

--1. 직원 테이블과(EM) 직업 테이블 (JOBS) INNER JOIN 을 사용해서
--직원 ID와 직업 ID와 직업 TITLE 출력

SELECT E.EMPLOYEE_ID, J.JOB_ID, j.job_title, E.FIRST_NAME
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_ID
ORDER BY E.FIRST_NAME;

SELECT E.EMPLOYEE_ID, J.JOB_ID, j.job_title
FROM EMPLOYEES E INNER JOIN JOBS J
   ON E.JOB_ID = J.JOB_ID;

--2. 각 부서의 매니저 직원들 출럭
-- 부서 테이블과 직원 테이블에서 INNER JOIN 을 사용해서
--부서이름, 매니저ID, 직원 ID 를 출력

SELECT d.department_name, D.manager_id, e.employee_id
FROM DEPARTMENTS D, EMPLOYEES E
WHERE D.MANAGER_ID = E.EMPLOYEE_ID;

SELECT d.department_name, D.manager_id, e.employee_id
FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
ON D.MANAGER_ID = e.employee_id
ORDER BY E.EMPLOYEE_ID DESC;

-- 굉장히 ~~~~~~ 중요
-- 단, INNER JOIN 은 NULL 값을 출력하지 못하기 때문에
-- NULL 값을 포함해서 출력하고 싶을 때는 OUTER JOIN

/******************OUTER JOIN*********************/

-- 1. LEFT OUTER JOIN : 왼쪽에 있는 a테이블을 기준으로 OUTER JOIN
--SELECT 컬럼
--  FROM A테이블 별칭 LEFT OUTER JOIN B테이블 별칭
--     ON (조인조건);

-- 직원 테이블에 있는 직원 아이디, 부서 아이디, 부서 이름 출력

SELECT E.EMPLOYEE_ID, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D
   ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;
  
-- 2. RIGHT OUTER JOIN : 오른쪽에 있는 B테이블을 기준으로 OUTER JOIN

SELECT E.EMPLOYEE_ID, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E RIGHT OUTER JOIN DEPARTMENTS D
   ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;


-- FULL OUTER JOIN : 양쪽 테이블의 모든 값 (NULL 포함) 이 출력된다

SELECT E.EMPLOYEE_ID, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E FULL OUTER JOIN DEPARTMENTS D
   ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;


----------------ORACLE 문법 활용한 OUTER JOIN---------------------------
--위 문법으로 외우는 게 좋음

-- 1. LEFT OUTER JOIN-> 오른쪽에(+)
SELECT E.EMPLOYEE_ID, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E , DEPARTMENTS D
WHERE e.department_id = d.department_id(+);
   -- 2. RIGHT OUTER JOIN-> 왼쪽에(+)
SELECT E.EMPLOYEE_ID, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E , DEPARTMENTS D
WHERE e.department_id(+) = d.department_id;

-- 3. FULL OUTER JOIN은 단순 기호추가로는 불가능

-- 실습 
-- 1. 각 부서의 매니저 직원들을 출력하되, 부서 테이블을 기준으로 LEFT OUTER JOIN을 사용해서
--      부서 NAME, 매니저 ID와 직원 ID를 출력해라 (ANSI 문법만 사용) 

SELECT D.DEPARTMENT_NAME , D.MANAGER_ID, E.EMPLOYEE_ID
FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E
  ON  D.MANAGER_ID = E.EMPLOYEE_ID
    ORDER BY D.MANAGER_ID;

-- 2. 각 부서의 매니저 직원들을 출력하되, 부서 테이블을 기준으로 RIGHT OUTER JOIN을 사용해서 
--      부서 NAME, 매니저 ID, 직원 ID를 출력해라 (ANSI 문법) 

SELECT D.DEPARTMENT_NAME , D.MANAGER_ID, E.EMPLOYEE_ID
FROM DEPARTMENTS D  RIGHT OUTER JOIN EMPLOYEES E
  ON  D.MANAGER_ID = E.EMPLOYEE_ID
    ORDER BY D.MANAGER_ID;

-- 3. 각 부서의 매니저 직원들을 출력하되, 부서테이블을 기준으로 FULL OUTER JOIN을 사용해서
--   부서 NAME, 매니저 ID, 직원 ID를 출력해라 (ANSI문법) 

SELECT D.DEPARTMENT_NAME , D.MANAGER_ID, E.EMPLOYEE_ID
FROM EMPLOYEES E  FULL OUTER JOIN DEPARTMENTS D
  ON  D.MANAGER_ID = E.EMPLOYEE_ID
  ORDER BY D.MANAGER_ID;

-- *힌트 : A테이블을 기준으로? A테이블을 먼저 작성 
--      A테이블 LEFT OUTER JOIN B테이블 


--확인용
SELECT D.DEPARTMENT_NAME , D.MANAGER_ID, E.EMPLOYEE_ID
FROM EMPLOYEES E  INNER JOIN DEPARTMENTS D
  ON  D.MANAGER_ID = E.EMPLOYEE_ID
    ORDER BY D.MANAGER_ID;

-- 3개의 테이블 JOIN 하기
-- 부서 테이블, 위치 테이블, 나라 테이블 세개를 INNER JOIN 해서
--각 부서의 도시와 나라이름을 출력

SELECT D.DEPARTMENT_NAME, C.COUNTRY_NAME, CITY
  FROM DEPARTMENTS D,   LOCATIONS L , COUNTRIES C
WHERE D.LOCATION_ID =  L.LOCATION_ID
  AND L.COUNTRY_ID =C.COUNTRY_ID;


SELECT D.DEPARTMENT_NAME, C.COUNTRY_NAME, CITY
  FROM DEPARTMENTS D  INNER JOIN LOCATIONS L
  ON D.LOCATION_ID =  L.LOCATION_ID
  INNER JOIN COUNTRIES C
  ON L.COUNTRY_ID =C.COUNTRY_ID;
  
