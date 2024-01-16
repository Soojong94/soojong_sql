/******************�Լ� (function)******************/

/*
Q. �Լ���?
A . Ư���� ��� ���� ��� ���� �����͸� �Է��� �� �ִ� Ư�� ��ɾ�
(�ͼ��� -  �������ֽ�)

�����Լ� (BUILT-IN FUNCTION)
����� ���� �Լ� (USER-DEFINED FUNCTION)

*/

-- 1. ���� �Լ�
-- 1-1) UPPER  : �빮�ڷ� ��ȯ���ִ� �Լ�
-- 1-2) LOWER : �ҹ��ڷ� ��ȯ���ִ� �Լ�

SELECT FIRST_NAME, UPPER (FIRST_NAME)  AS "UFIRSTNAME",  LOWER (email) AS "EMAIL" 
  FROM EMPLOYEES;

-- 1-3) length :  ���ڿ� ����

SELECT FIRST_NAME , LENGTH (FIRST_NAME)
FROM EMPLOYEES
WHERE LENGTH (FIRST_NAME) >= 8;

-- 1-4) SUBSTR : ���ڿ� ����
-- SUBSTR (������,  ������ġ) : ������ġ���� ������ ����
-- SUBSTR (������, ������ġ, ������ ����) : ���� ��ġ���� ������ ���̸�ŭ ����


--EX ) SUBSTR(�������, 3 , 2 )
        
        
SELECT JOB_ID, SUBSTR ( JOB_ID, 1 , 2 ) AS �α���
 FROM employees;

-- �Ի��Ͽ��� �Ի����� ����, ��, ���� ��� 
-- �Ի��� | ���� | �� | ��
-- (��, ��Ī�� ���� �� �Ϸ� ǥ��)

SELECT HIRE_DATE,
        SUBSTR (HIRE_DATE , 1 , 2 ) AS ���� ,
        SUBSTR (HIRE_DATE , 4 , 2 ) AS ��,  
        SUBSTR (HIRE_DATE , 7 , 2 ) AS ��
  FROM EMPLOYEES ; 

-- 1-5) REPLACE : ���ڿ� ��ü
-- REPLACE (������, �ٲٰ� ���� ���� ���ڿ�, �ٲ� ���ο� ���ڿ�)

SELECT HIRE_DATE , 
REPLACE (HIRE_DATE, '/' ,'-') AS ������,
REPLACE (hire_date, '/', '') AS ����
FROM EMPLOYEES ;


-- 1-6) CONCAT : ���ڿ� ��ġ��

SELECT CONCAT ('�Ի� ��¥�� ' , HIRE_DATE) AS �ȳ�����
 FROM employees;
 
 SELECT CONCAT ('�Ի� ��¥�� ' , CONCAT (HIRE_DATE, '�Դϴ�')) AS �ȳ�����
 FROM employees;
 
-- 1-7) ���ڿ��� ������ �� �ִ� ������ ||

SELECT REPLACE ('�Ի� ��¥��'  || HIRE_DATE || '�Դϴ�' , '/' , '-') AS �ȳ�����_���ڿ�����
 FROM employees;
 
-- 1-8) TRIM : ���ڿ��� ���� OR ������ ���� 

-- DUAL ���̺� : �ְ� ���� �������� SYS  ������ ���̺��, �ӽ� �����̳�
-- �Լ��� ��� ���� Ȯ���� �뵵�� ���Ǵ� ���� ���̺�
 
 SELECT 'HELLO' AS �λ縻,
   TRIM ( 'H' FROM 'HELLO') AS H������
  FROM DUAL;
  
  SELECT '[' || ' '|| '����' ||' ' || ']' AS "�������� ��",
                '[' ||TRIM(' '|| '����' ||' ')|| ']' AS "�������� ��"
FROM DUAL;

-- ���ڿ� ���� : TRIM (������ ���� FROM ���ڿ�)

-- ���� ���� ���� LEADING
-- ������ ���� ���� TRAILING

SELECT '1����1' AS ������
  ,  TRIM (LEADING '1' FROM '1����1' ) AS ���ʱ�������
  ,  TRIM (TRAILING '1' FROM '1����1') AS �����ʱ�������
  ,  TRIM (BOTH '1' FROM '1����1') AS ���ʱ������� 
  ,  REPLACE ( '1����1' , '1', '') AS "1����"
--  , TRANSLATE  ( '1����1' , '1', ' ' ) AS "TRANSLATE"
  FROM DUAL;
  
  SELECT *
  FROM DUAL;
  
  
--  �����Լ�
-- 2-1)MOD : �������� ��ȯ�ϴ� �Լ�
--      MOD (������ �� ���� , ���� ����)
--      Ȧ¦�� ������ �� ���� ���

SELECT MOD(15,6) AS ������, MOD (15,2) AS �˰�
FROM DUAL;


-- 2-2 ) ROUND : �ݿø��ϴ� �Լ�
--        ROUND (����, �ݿø��� ��ġ-����)
--        ��ġ�� �������� ������ �Ҽ��� ù��° �ڸ����� �ݿø��� ����
    
SELECT ROUND (15.115641   ),
           ROUND (15.7894 ,1 )
FROM DUAL;
 
--  2-3) TRUNC : ���� �Լ�
--        TRUNC  (���� , ���� ��ġ-����)

SELECT ROUND (15.115641 ,1  ), TRUNC (15.115641 ,1  ),
           ROUND (15.7894 ,1 ) , TRUNC (15.7894 ,1 )
FROM DUAL;
 
-- 3. ��¥�Լ�
-- 3-1 ) SYSDATE
-- ��¥ ���� �ٲٴ� ��� : ���� > ȯ�漳�� > �����ͺ��̽� > NLS > ��¥ ���� ����

SELECT SYSDATE AS ����,
           SYSDATE +1 AS �Ϸ����,
          SYSDATE+1/24 AS �ѽð�����,
          SYSDATE + 1/24/60 AS �Ϻд���,
          ADD_MONTHS (SYSDATE,1) AS "1������",
          ADD_MONTHS (SYSDATE,-1) AS "1������"
         
FROM DUAL;

-- 4. ����ȯ�Լ�
-- 4-1) ���� �����ͷ� ��ȯ (���� ����) : TO_CHAR
SELECT SYSDATE,
         TO_CHAR (SYSDATE, 'YY/MM/DD/DAY') AS ���ڽ�
         FROM DUAL;



-- 4-2) ���� �����ͷ� ��ȯ (���� ����)

SELECT TO_NUMBER ('1')-1
  FROM DUAL;

--4-3) ��¥ �����ͷ� ��ȯ
SELECT  TO_DATE ('2023.05.04' , 'YYYY/MM/DD')
  FROM DUAL;

/*

    ����ȯ �Լ� : ����� ����ȯ
    �Ͻ��� ����ȯ : ���� ����ȯ �Լ��� ������� �ʰ� �ڵ����� ����ȯ ����
    �켱���� : ��¥�� > ������ > ������
    �켱������ ���� ���������� ����ȯ�� �����Ѵ�.
    
*/

--  5 . NULL �Լ� : NULL �� �ٸ� ���� ��ü
--  NULL �� ������� NULL ��ȯ
--  NULL �� �񱳿��� FALSE ��ȯ

--  5-1) NVL(NULL �˻�, NULL�϶� �ٲ� ��)
-- �������� ���� ���

-- 5-2) NVEL2(NULL �˻� , NULL�� �ƴ� ��, NULL �� ��)

SELECT FIRST_NAME, NVL(FIRST_NAME, '����')
FROM employees
WHERE first_name IS NULL;

SELECT FIRST_NAME, NVL2(FIRST_NAME, '����', '����')
FROM employees;

-- ���� ���̺��� �Ŵ����� �ִ� ���� ->'����'
--                       �Ŵ����� ���� ���� -> '�Ŵ���'

SELECT FIRST_NAME , MANAGER_ID , NVL2 (MANAGER_ID, '����', '�Ŵ���') AS ����
  FROM EMPLOYEES;
 
-- 6. DECODE (�������� ���� ����)
/*
    DECODE( �˻���, 
                ��1 , ��ġ �� ��ȯ��,
                ��2 , ��ġ �� ��ȯ��,
                .....
                ��N, ��ġ�� ��ȯ��)

*/


SELECT DEPARTMENT_ID,  SALARY,
            DECODE (department_id,
            100, SALARY*2,
            90, salary * 1.9,
            80, salary*1.8
            ) AS �����λ�
FROM EMPLOYEES;


--7. �׷��Լ�
-- SUM : �հ�
-- COUNT : ������ ����
-- MAX :  �ִ밪
-- MIN : �ּҰ�
-- AVG : ��հ�

--�޿� ����
SELECT SUM(SALARY)
FROM EMPLOYEES;

--������ ����
SELECT COUNT (EMPLOYEE_ID) , COUNT(*)
FROM employees;

--���� ���� �޿� , ���� �޿�, �޿��� ���
SELECT MAX(SALARY) , MIN(SALARY) , ROUND(AVG(SALARY))
FROM employees;







