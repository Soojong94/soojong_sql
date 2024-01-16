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



  