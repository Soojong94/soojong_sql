/*********************GROUP BY**********************/

--GROUP BY : 특정 컬럼으로 그룹화 할 때 사용
--EX) 부서별 평균 월급을 구하고 싶다

SELECT DEPARTMENT_ID, ROUND(AVG(SALARY))
  FROM EMPLOYEES
  GROUP BY DEPARTMENT_ID;
  
-- 만약 그룹화 진행했는데, 원본의 데이터가 보고싶다면?
-- 안 됨 , 이유 : 그룹화를 하게 되면 실제 출력되는 행이 감소
-- 출력될 수 있는 컬럼이 제한

--실행되는 순서 : FROM ->GROUP BY->SELECT
--2번째 실행되는 GROUP BY 에서 행의 개수가 108개 -> 12개

--이미 그룹화 시킨 행의 개수가 기존 행의 개수와 안 맞기 때문에 SELECT에 제한 생김

SELECT DEPARTMENT_ID, ROUND(AVG(SALARY))
  FROM EMPLOYEES
  GROUP BY DEPARTMENT_ID;
  
  --단, 집계 함수는 사용 가능
  SELECT DEPARTMENT_ID, ROUND(AVG(SALARY)) , COUNT (*)
  FROM EMPLOYEES
  GROUP BY DEPARTMENT_ID;
  
  
--  직원 테이블에서 급여의 개수, 합계, 최소 급여, 최대 급여, 급여의 평균 값을 "부서별"로 구해보자
SELECT DEPARTMENT_ID, 
        COUNT(SALARY), 
        SUM(SALARY), 
        MIN(SALARY), 
        MAX(SALARY),  
        ROUND(AVG(SALARY))
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

--단일행 함수 :  1->1 함수의 입력되는 행의 개수 1 , 결과 값 1
--EX) UPPER , LOWER...

--다중행 함수 : N ->1 함수의 입력되는 행의 개수 N, 결과 값 1
--EX) SUM, AVG...

--COUNT(*) = NULL 포함 
--COUNT (컬럼) = NULL 미포함
SELECT COUNT(DEPARTMENT_ID), COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

--실습

-- 1 . 성적표 테이블에서 학생 별로 평균 점수 출력(학생ID , 평균 점수)
-- 단, 소수점 1의 자리까지 출력
SELECT 학생ID, ROUND(AVG(성적),1) AS 평균점수
FROM 성적표
GROUP BY 학생ID;

--2. 성적표 테이블에서 과목별로 최고 성적, 최저 성적을 출력(최고 성적, 최저성적)
SELECT MAX(성적) AS 최고성적 , MIN(성적) AS 최저성적
FROM 성적표
GROUP BY 과목;

--3. 수강생 정보 테이블에서 각 팀에 몇명이 있는지 출력(팀, 팀별 인원수)
SELECT 팀, COUNT(*) AS 팀별인원수
FROM 교육생정보
GROUP BY 팀;

--4. 성적표 테이블에서 학생 별로 JAVA + DATABASE 성적의 평균 출력(학생ID, 평균 성적)
--힌트 JAVA+D 라는 건 특정 과목만 제외한 점수
--단 성적은 1의 자리에서 반올림

SELECT 학생ID , ROUND(AVG(성적),-1) AS 평균성적
FROM 성적표 
WHERE 과목 <> 'PYTHON'
GROUP BY 학생ID;



/************************HAVING****************************/
-- HAVING : GROUP BY 절을 통해서 그룹화 된 결과 중, 원하는 결과를 필터링 해주는 문법
-- HAVING 절은 GROUP BY 절에 있는 컬럼으로만 사용 가능

-- 성적표 테이블에서
-- 학생별
--학생 ID , 성적의 평균 값을 출력

SELECT 학생ID, ROUND(AVG(성적))
FROM 성적표
WHERE 과목 <> 'PYTHON'
GROUP BY 학생ID
HAVING AVG(성적)>80
ORDER BY 학생ID;

-- 성적표 테이블에서 
-- 학생 별 
-- 파이썬 성적은 제외하고 
-- 그 결과가 80 이상인 학생ID, 성적 평균 출력할거임 
-- 단, 학생 이름 순서대로 

SELECT 학생ID , ROUND(AVG(성적))
FROM 성적표
WHERE 과목 <> 'PYTHON'
GROUP BY 학생ID
HAVING AVG(성적)>80
ORDER BY 학생ID;

-- 실습 
-- 1) 교육생 정보에서 소속된 팀의 인원 수가 3명 이상인 팀만 출력 

SELECT 팀 , COUNT(*)
FROM 교육생정보
GROUP BY 팀
HAVING COUNT(*)>=3;

-- 2) 직원 (EMPLOYEES) 테이블에서 부서 별 최고 연봉이 100,000 이상인 부서의 ID 만 출력

SELECT DEPARTMENT_ID, MAX(SALARY*12) AS 연봉
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX (SALARY*12) > 100000;


-- 3) 성적표 테이블에서 학생 별 평균 성적을 출력하되, NULL이 아닌 값만 출력 
--  단, 성적은 1의 자리까지만 표시 

SELECT 학생ID ,  ROUND(AVG(성적)) AS  평균성적
FROM 성적표
GROUP BY 학생ID
HAVING AVG(성적) IS NOT NULL
ORDER BY  평균성적 DESC;

//////////////////////////////*ORDER BY*///////////////////////////////////////////

--ORDER BY 기준컬럼 (ASC) - 오름차순 정렬 ASC가 DEFAULT 값이기 때문에 생략가능
--ORDER BY 기준컬럼 (DESC) - 내림차순 정렬


SELECT *
FROM 성적표
ORDER BY 학생ID, 과목 DESC;


--SELECT 절에 입력되지 않은 컬럼이라도 기준으로 정렬할 수 있다.  
SELECT EMPLOYEE_ID
  FROM EMPLOYEES
  ORDER BY SALARY;
  
--GROUP BY 가 명시된 경우에는 GROUP BY 에 한정된 컬럼만 정렬에 사용가능
--실행순서 >GROUPBY->HAVING->SELECT->ORDER BY 순으로 실행이 되기 때문에
-- ORDER BY 에 사용할 수 없다.

SELECT DEPARTMENT_ID 
  FROM EMPLOYEES
  WHERE DEPARTMENT_ID IS NOT NULL
  GROUP BY DEPARTMENT_ID
  ORDER BY DEPARTMENT_ID;
  
  SELECT SALARY*12 AS 연봉
  FROM EMPLOYEES
  ORDER BY 연봉
  
  