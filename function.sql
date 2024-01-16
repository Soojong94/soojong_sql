/******************함수 (function)******************/

/*
Q. 함수란?
A . 특정한 결과 값을 얻기 위해 데이터를 입력할 수 있는 특수 명령어
(믹서기 -  오렌지주스)

내장함수 (BUILT-IN FUNCTION)
사용자 정의 함수 (USER-DEFINED FUNCTION)

*/

-- 1. 문자 함수
-- 1-1) UPPER  : 대문자로 변환해주는 함수
-- 1-2) LOWER : 소문자로 변환해주는 함수

SELECT FIRST_NAME, UPPER (FIRST_NAME)  AS "UFIRSTNAME",  LOWER (email) AS "EMAIL" 
  FROM EMPLOYEES;

-- 1-3) length :  문자열 길이

SELECT FIRST_NAME , LENGTH (FIRST_NAME)
FROM EMPLOYEES
WHERE LENGTH (FIRST_NAME) >= 8;

-- 1-4) SUBSTR : 문자열 추출
-- SUBSTR (데이터,  시작위치) : 시작위치부터 끝까지 추출
-- SUBSTR (데이터, 시작위치, 추출할 길이) : 시작 위치부터 추출할 길이만큼 추출


--EX ) SUBSTR(생년월일, 3 , 2 )
        
        
SELECT JOB_ID, SUBSTR ( JOB_ID, 1 , 2 ) AS 두글자
 FROM employees;

-- 입사일에서 입사일의 연도, 월, 일을 출력 
-- 입사일 | 연도 | 월 | 일
-- (단, 명칭은 연도 월 일로 표현)

SELECT HIRE_DATE,
        SUBSTR (HIRE_DATE , 1 , 2 ) AS 연도 ,
        SUBSTR (HIRE_DATE , 4 , 2 ) AS 월,  
        SUBSTR (HIRE_DATE , 7 , 2 ) AS 일
  FROM EMPLOYEES ; 

-- 1-5) REPLACE : 문자열 대체
-- REPLACE (데이터, 바꾸고 싶은 기존 문자열, 바꿀 새로운 문자열)

SELECT HIRE_DATE , 
REPLACE (HIRE_DATE, '/' ,'-') AS 하이픈,
REPLACE (hire_date, '/', '') AS 제거
FROM EMPLOYEES ;


-- 1-6) CONCAT : 문자열 합치기

SELECT CONCAT ('입사 날짜는 ' , HIRE_DATE) AS 안내문구
 FROM employees;
 
 SELECT CONCAT ('입사 날짜는 ' , CONCAT (HIRE_DATE, '입니다')) AS 안내문구
 FROM employees;
 
-- 1-7) 문자열을 연결할 수 있는 연산자 ||

SELECT REPLACE ('입사 날짜는'  || HIRE_DATE || '입니다' , '/' , '-') AS 안내문구_문자열연결
 FROM employees;
 
-- 1-8) TRIM : 문자열을 삭제 OR 공백을 제거 

-- DUAL 테이블 : 최고 권한 관리자인 SYS  소유의 테이블로, 임시 연산이나
-- 함수의 결과 값을 확인할 용도로 사용되는 더미 테이블
 
 SELECT 'HELLO' AS 인사말,
   TRIM ( 'H' FROM 'HELLO') AS H제거후
  FROM DUAL;
  
  SELECT '[' || ' '|| '공백' ||' ' || ']' AS "공백제거 전",
                '[' ||TRIM(' '|| '공백' ||' ')|| ']' AS "공백제거 후"
FROM DUAL;

-- 문자열 제거 : TRIM (제거할 문자 FROM 문자열)

-- 왼쪽 문자 제거 LEADING
-- 오른쪽 문자 제거 TRAILING

SELECT '1문자1' AS 제거전
  ,  TRIM (LEADING '1' FROM '1문자1' ) AS 왼쪽글자제거
  ,  TRIM (TRAILING '1' FROM '1문자1') AS 오른쪽글자제거
  ,  TRIM (BOTH '1' FROM '1문자1') AS 양쪽글자제거 
  ,  REPLACE ( '1문자1' , '1', '') AS "1제거"
--  , TRANSLATE  ( '1문자1' , '1', ' ' ) AS "TRANSLATE"
  FROM DUAL;
  
  SELECT *
  FROM DUAL;
  
  
--  숫자함수
-- 2-1)MOD : 나머지를 반환하는 함수
--      MOD (나눗셈 될 숫자 , 나눌 숫자)
--      홀짝을 구분할 때 많이 사용

SELECT MOD(15,6) AS 말미잘, MOD (15,2) AS 똥개
FROM DUAL;


-- 2-2 ) ROUND : 반올림하는 함수
--        ROUND (숫자, 반올림할 위치-선택)
--        위치를 지정하지 않으면 소수점 첫번째 자리에서 반올림을 수행
    
SELECT ROUND (15.115641   ),
           ROUND (15.7894 ,1 )
FROM DUAL;
 
--  2-3) TRUNC : 버림 함수
--        TRUNC  (숫자 , 버림 위치-선택)

SELECT ROUND (15.115641 ,1  ), TRUNC (15.115641 ,1  ),
           ROUND (15.7894 ,1 ) , TRUNC (15.7894 ,1 )
FROM DUAL;
 
-- 3. 날짜함수
-- 3-1 ) SYSDATE
-- 날짜 형식 바꾸는 방법 : 도구 > 환경설정 > 데이터베이스 > NLS > 날짜 형식 변경

SELECT SYSDATE AS 지금,
           SYSDATE +1 AS 하루더함,
          SYSDATE+1/24 AS 한시간더함,
          SYSDATE + 1/24/60 AS 일분더함,
          ADD_MONTHS (SYSDATE,1) AS "1개월후",
          ADD_MONTHS (SYSDATE,-1) AS "1개월전"
         
FROM DUAL;

-- 4. 형변환함수
-- 4-1) 문자 데이터로 변환 (많이 쓰임) : TO_CHAR
SELECT SYSDATE,
         TO_CHAR (SYSDATE, 'YY/MM/DD/DAY') AS 문자식
         FROM DUAL;



-- 4-2) 숫자 데이터로 변환 (많이 쓰임)

SELECT TO_NUMBER ('1')-1
  FROM DUAL;

--4-3) 날짜 데이터로 변환
SELECT  TO_DATE ('2023.05.04' , 'YYYY/MM/DD')
  FROM DUAL;

/*

    형변환 함수 : 명시적 형변환
    암시적 형변환 : 내가 형변환 함수를 사용하지 않고도 자동으로 형변환 진행
    우선순위 : 날짜형 > 숫자형 > 문자형
    우선순위가 낮은 문자형부터 형변환을 진행한다.
    
*/

--  5 . NULL 함수 : NULL 에 다른 값을 대체
--  NULL 에 산술연산 NULL 반환
--  NULL 에 비교연산 FALSE 반환

--  5-1) NVL(NULL 검사, NULL일때 바꿀 값)
-- 현업에서 많이 사용

-- 5-2) NVEL2(NULL 검사 , NULL이 아닐 때, NULL 일 때)

SELECT FIRST_NAME, NVL(FIRST_NAME, '없음')
FROM employees
WHERE first_name IS NULL;

SELECT FIRST_NAME, NVL2(FIRST_NAME, '있음', '없음')
FROM employees;

-- 직원 테이블에서 매니저가 있는 직원 ->'직원'
--                       매니저가 없는 직원 -> '매니저'

SELECT FIRST_NAME , MANAGER_ID , NVL2 (MANAGER_ID, '직원', '매니저') AS 직급
  FROM EMPLOYEES;
 
-- 6. DECODE (현업에서 많이 쓰임)
/*
    DECODE( 검사대상, 
                비교1 , 일치 시 반환값,
                비교2 , 일치 시 반환값,
                .....
                비교N, 일치시 반환값)

*/


SELECT DEPARTMENT_ID,  SALARY,
            DECODE (department_id,
            100, SALARY*2,
            90, salary * 1.9,
            80, salary*1.8
            ) AS 연봉인상
FROM EMPLOYEES;


--7. 그룹함수
-- SUM : 합계
-- COUNT : 데이터 개수
-- MAX :  최대값
-- MIN : 최소값
-- AVG : 평균값

--급여 총합
SELECT SUM(SALARY)
FROM EMPLOYEES;

--직원의 숫자
SELECT COUNT (EMPLOYEE_ID) , COUNT(*)
FROM employees;

--가장 높은 급여 , 낮은 급여, 급여의 평균
SELECT MAX(SALARY) , MIN(SALARY) , ROUND(AVG(SALARY))
FROM employees;







