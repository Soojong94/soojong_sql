/******************서브쿼리*****************/
--SQL 내부에서 사용되는 SELECT
--Q. 이름이 SHELLI 인 직원 보다 급여가 낮은 직원들을 출력

--1. 이름이 SHELLI 인 직원의 급여를 추출
SELECT SALARY
FROM EMPLOYEES
WHERE FIRST_NAME = 'Shelli';

--2. 그 직원의 급여보다 낮은 급여를 받는 직원 출력
SELECT FIRST_NAME , SALARY
  FROM EMPLOYEES
WHERE SALARY < 2900;

-- 서브쿼리 사용
SELECT FIRST_NAME , SALARY
  FROM EMPLOYEES
WHERE SALARY < 
(
SELECT SALARY
FROM EMPLOYEES
WHERE FIRST_NAME = 'Shelli' 
);



