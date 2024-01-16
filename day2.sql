/*********** where ***********/

-- �츮�� �������� SELECT�� ����ߴ� �����ʹ� ��� �����͸� ���� �����Ծ������ 
-- �츮�� �������� �ʿ��� �����͸� ����ϱ� ���ؼ� WHERE ���� ��� 

SELECT * 
  FROM EMPLOYEES; 
  
SELECT * 
  FROM DEPARTMENTS; 
  
-- 1. WHERE �� 
SELECT *
  FROM EMPLOYEES 
 WHERE JOB_ID = 'IT_PROG'; 
 
 -- ���� ���� �߿��� ���� ���̵� 105�� ����� ���� �̸��� ����ϰڽ��ϴ�. 
SELECT FIRST_NAME, LAST_NAME 
  FROM EMPLOYEES 
 WHERE EMPLOYEE_ID = 105;
 
-- 2. ��� ������ (+, -, *, / ) 
-- �÷��� ��� �����ڸ� ����ϸ� �� �÷��� �ش��ϴ� ��� �࿡ ����� ����ȴ�. 
-- SALARY * 12 => ��� ���� ������ �ִ� SALARY * 12 

SELECT SALARY, SALARY*10 
  FROM EMPLOYEES;
 
-- 3. �� ������ (=, >, >=, < , <=) 

-- 1. �μ� ID�� 50�� ����� ���� ID, �μ� ID �� ��� 
SELECT EMPLOYEE_ID, DEPARTMENT_ID 
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 50; 

-- 2. ���� ���̺��� �޿��� 5000 ������ ������� �̸��� �޿��� ��� 
SELECT LAST_NAME, SALARY 
  FROM EMPLOYEES 
 WHERE SALARY <= 5000; 

-- 3. ���� ���̺��� ����(!!) 50000 �̻��� ������� �̸��� ������ ��� 
--     (��, ������ 'ANNSAL'�� ���) 
SELECT LAST_NAME, SALARY*12 AS ANNSAL
  FROM EMPLOYEES
 WHERE SALARY*12 >= 50000; 


-- * HINT : ������ ���Ǵ� ���� �񱳿�����, ���������, WHERE��, AS, SELECT��
 
-- 4. � �� ������ (!=, ^=, <>, NOT) 
-- <> �⺻������ �ش� �����ڸ� ���� ���� ����� 
-- �⺻������ ���� ���̴� ���� ������ �����ڴ� 

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

-- �ǽ� 
-- 1) �޿��� 10000 �̸��� �ƴ� ������ ID�� �̸��� ��� (10000 �̻��� ����) 
SELECT EMPLOYEE_ID, LAST_NAME
  FROM EMPLOYEES 
 WHERE SALARY >= 10000;

-- 2) JOB_ID�� IT_PROG�� �ƴ� ������ �̸��� JOB_ID�� ����ض� 
SELECT LAST_NAME, JOB_ID 
  FROM EMPLOYEES 
 WHERE JOB_ID <> 'IT_PROG';


-- 5. �� ������ (AND, OR) : ���ǽ��� ������ ����ϰ� ���� �� 

-- 1) �μ� ID = 90 �̰� �޿��� 5000 �̻��� ������ ID�� �̸� ��� (AND)
SELECT EMPLOYEE_ID, LAST_NAME
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 90
   AND SALARY >= 5000;

-- 2) �μ� ID�� 100 �̰ų�, �Ի����� 16�� 02�� 02�� ���Ŀ� �Ի��� ������ �̸� (OR) 
SELECT LAST_NAME
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID = 100 
    OR HIRE_DATE >= '16-02-02'; 
-- ��¥ �����ʹ� 20XX ����, / - ��ȯ ���� 



 
-- 6.  IS NULL, IS NOT NULL 
-- NULL�� �������� �ʴ� ���̱⶧���� �񱳰� �Ұ����ϴ� 
-- NULL ���� �����ؼ� ����� �� �ִ� �����ڴ� IS NULL, IS NOT NULL �� �ΰ� ��! 

-- �ڵ��� ��ȣ�� NULL �� ������ �̸��� �ڵ�����ȣ�� ��� 
SELECT LAST_NAME, PHONE_NUMBER 
  FROM EMPLOYEES
 WHERE PHONE_NUMBER IS NULL;
 
SELECT LAST_NAME, PHONE_NUMBER 
  FROM EMPLOYEES
 WHERE PHONE_NUMBER IS NOT NULL;


-- 7. IN / NOT IN 
-- IN ������ : OR ������ 

-- �μ� ID�� 30,50,90�� ����� ������ ����ϰڽ��ϴ�. 

SELECT *
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID = 30
    OR DEPARTMENT_ID = 50
    OR DEPARTMENT_ID = 90;

-- ���� ����, IN ��� 
-- ** IN������ �ȿ��� NULL �� ���õȴ�. 
SELECT * 
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (30,50,90, NULL);
 
 
 
 /*
    AND, OR �ǽ����� (����) 
    1. �μ� ID�� 100�̰ų�, 50�� ���� �߿��� 
        ������ 10000 �̻��� ������ ID, �̸�, �׸��� ������ ��� (���� AnnSal�� ���) 
      * ��, AND�� OR���� ���� ����. AND ���� ������ �� 
        ���࿡ OR�� ���� �����ϰ� ������ ��ȣ �ȿ� �־�� �� 
    2. �μ� ID�� 100�̰ų� 90�� ���� ��, ���� ID�� 101�� ����� �̸��� ���� ��� 
    
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
    �ǽ� ���� 
    1. �Ŵ����� ID�� 100�̰ų� 120�� ������ �̸��� �Ŵ��� ID�� ����ض� (��, OR�����ڴ� ���X) 
    2. JOB_ID�� AD_VP �̰ų� ST_MAN �� ����� �̸��� JOB_ID �� ��� (��, OR������ ���x) 
    3. �Ŵ��� ID�� 145,146,147,148,149�� �ƴ� ������ �̸��� �Ŵ��� ID ��� (��, AND ������ X) 
    
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
 






