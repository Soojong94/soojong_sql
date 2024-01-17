/*************WHERE***********/

--  SELECT �� ����ߴ� �����ʹ� ��� �����͸� ���� �����Դ�
-- �ʿ��� �����͸� ����ϱ� ���� WHERE ���� ���

SELECT *
  FROM employees;
  
  SELECT *
    FROM DEPARTMENTS;
    
    --1. WHERE ��
    
    SELECT *
     FROM employees
    WHERE job_id = 'IT_PROG';
    
    -- ���� ���� �߿��� ���� ���̵� 105�� ����� ���� �̸��� ����ϰڽ��ϴ�. 
    
    SELECT LAST_NAME, FIRST_NAME
     FROM  employees
   WHERE employee_id = '105'  ;
 
    --2. ��� ������ (+, -, *, /)
    --�÷��� ��� �����ڸ� ����ϸ� �� �÷��� �ش��ϴ� ��� �࿡ ����� ����ȴ�.
    --SALARY * 12 -> ��� ���� ������ �ִ� SALARY *12
    
    
    SELECT SALARY, SALARY*10
      FROM employees; 
      
      --3. �� ������ (=, >, >=, <, <=)
      
      
      --1. �μ� ID�� 50 �� ����� ����ID ,�μ� ID �� ���
      --2. ���� ���̺��� �޿��� 5,000 ������ ������� �̸��� �޿��� ���
      --3. ���� ���̺��� ������ 50,000 �̻��� ������� �̸��� ������ ���
      
      --(��, ������ 'ANNSAL' �� ���)
      -- ������ ���Ǵ� ���� �񱳿�����, ���������, WHERE ��, AS, SELECT��
      
      SELECT EMPLOYEE_ID, department_id
       FROM employees
    WHERE department_id = '50';
    
    SELECT LAST_NAME, FIRST_NAME, SALARY
      FROM employees
    WHERE SALARY <= '5000';
    
     SELECT LAST_NAME, FIRST_NAME, SALARY*12 AS ANNSAL
      FROM employees
    WHERE SALARY*12 >= '50000';
    
    -- 4. � �� ������( !=, ^=, <>, NOT)
    --<> �⺻������ �ش� �����ڸ� ���� ���� ����� , �������̴� ����
    
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
    
    -- �ǽ�
    -- 1)�޿��� 10000 �̸��� �ƴ� ������ ID�� �̸��� ���
    -- 2) JOB_ID�� IT_PROG�� �ƴ� ������ �̸��� JOB_ID ���
    
    SELECT EMPLOYEE_ID, LAST_NAME
      FROM employees
    WHERE NOT SALARY <  '10000'; 
    
    SELECT LAST_NAME, JOB_ID
      FROM employees
    WHERE JOB_ID <> 'IT_PROG' ;
    
    --5. �� ������(AND, OR) : ���ǽ��� ���� �� ����ϰ� ���� ��
    --1) �μ� ID - 90 �̰� �޿��� 5000 �̻��� ������ ID�� �̸� ���
    
    SELECT EMPLOYEE_ID , LAST_NAME
      FROM employees
    WHERE department_id = '90'
        AND SALARY >= '5000';
        
    --2) �μ� ID�� 100 �̰ų�, �Ի����� 16�� 2�� 2�� ���Ŀ� �Ի��� ������ �̸�
    
    SELECT LAST_NAME
     FROM employees
   WHERE department_id = '100'
         OR hire_date >= '16-02-02';
         
         --��¥ �����ʹ� 20XX ���� , (/ -) ��ȯ ����
         
         
/*
      
    AND, OR �ǽ����� (����) 
    1. �μ� ID�� 100�̰ų�, 50�� ���� �߿��� 
        ������ 10000 �̻��� ������ ID, �̸�, �׸��� ������ ��� (���� AnnSal�� ���) 
      * ��, AND�� OR���� ���� ����. AND ���� ������ �� 
        ���࿡ OR�� ���� �����ϰ� ������ ��ȣ �ȿ� �־�� �� 
    2. �μ� ID�� 100�̰ų� 90�� ���� ��, ���� ID�� 101�� ����� �̸��� ���� ��� 
    
*/
         
         -- 6. IS NULL, IS NOT NULL
         -- NULL �� �������� �ʴ� ���̱� ������ �񱳰� �Ұ����ϴ�
         -- NULL ���� �����ؼ� ����� �� �ִ� �����ڴ� IS NULL, IS NOT NULL �� �� �� ��
         
         
         -- �ڵ��� ��ȣ�� NULL �� ������ �̸��� �ڵ�����ȣ�� ���
         
         SELECT LAST_NAME, PHONE_NUMBER
           FROM EMPLOYEES 
         WHERE phone_number IS NULL;
         
          SELECT LAST_NAME, PHONE_NUMBER
           FROM EMPLOYEES 
         WHERE phone_number IS NOT NULL ;       
         
         
         -- 7. IN / NOT IN
         -- IN ������ : OR ������
         --�μ� ID�� 30,50,90 �� ����� ������ ����ϰڽ��ϴ�. 
         
         SELECT *
          FROM employees
        WHERE department_id = 30
              OR department_id = 50
              OR department_id = 90;
              
       --IN ���
       --IN ������ �ȿ��� NULL�� ���õȴ�. **IN (30, 50, 90, NULL)-NULL �� ����
              
         SELECT *
          FROM employees
        WHERE department_id IN (30, 50, 90) ;
        
        --NOT IN ������ : IN ���� ���ǿ� �ش����� �ʴ� �����͸� ���
        --NOT�� ������ �ǹ� -> ������ �ݴ��
        
         SELECT *
          FROM employees
        WHERE department_id NOT IN (30,50,90);        
        
        /*
        NOT IN �� AND ������ �̱� ������ �ϳ��� FALSE�� ������
        �ٸ� �൵ ���� FALSE �� �Ǿ����
        �׷��� NOT IN �ȿ� NULL ���� ������
        ��� ���� FALSE �� �Ǿ������ �ƹ� ���� ������ �ʴ´�
        */  
                        
/*

    �ǽ� ���� 
    1. �Ŵ����� ID�� 100�̰ų� 120�� ������ �̸��� �Ŵ��� ID�� ����ض� (��, OR�����ڴ� ���X) 
    2. JOB_ID�� AD_VP �̰ų� ST_MAN �� ����� �̸��� JOB_ID �� ��� (��, OR������ ���x) 
    3. �Ŵ��� ID�� 145,146,147,148,149�� �ƴ� ������ �̸��� �Ŵ��� ID ��� (��, AND ������ X) 
    
*/

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
   
SELECT LAST_NAME, SALARY*12  AS AnnSal
  FROM EMPLOYEES 
 WHERE (DEPARTMENT_ID = '100' 
    OR DEPARTMENT_ID = '90')
   AND EMPLOYEE_ID = '101';




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
 
-- 8. BETWEEN : ���� ���� ������
-- �޿��� 10,000 ~20,000 ������ ������ ����Ͻÿ�.

SELECT LAST_NAME, SALARY
  FROM EMPLOYEES
  WHERE salary BETWEEN 10000 AND 19999;

SELECT LAST_NAME, HIRE_DATE
  FROM EMPLOYEES
  WHERE hire_date BETWEEN '05/01/01' AND '05/12/31';

--  9. LIKE  : Ư�� ������ �˻��� �� 
-- 9-1) %
-- �̸��� S�� �����ϴ� ����

SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE first_name LIKE 'S%';

-- 9-2) �̸��� s�� ������ ���� ���

SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE first_name LIKE '%s';
 
 -- �̸��� s �� ���Ե� ���� ���
 
 SELECT FIRST_NAME
  FROM EMPLOYEES
 WHERE first_name LIKE '%s%'
       OR first_name LIKE '%S%';
       
-- 9-2) _ 

-- ���� ���̵� 1�� �����ϴ� 3���ڷ� �Ǿ� �ִ� ������ �˻�

 SELECT EMPLOYEE_ID 
  FROM EMPLOYEES
 WHERE employee_id LIKE '1__';
 
 /*�ǽ�����

1. �ڵ��� ��ȣ�� 650�� ���ԵǾ� �ִ� ��ȣ/ �̸� ���
2. �̸��� �ι�° ���ڰ� e�� ���� ã�� : �̸� ��� (FIRST_NAME)
   ex) Kelly, Renske 
3. �̸��� S�� �����ϰ�, n���� ������ ������ �̸��� ���  (FIRST_NAME)
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

--SELECT ������ �÷� 
--FROM ������ ���̺� 
--WHERE ���� 
--
--���� OR ����
--���� AND ���� 
--IN (����1, ����2, ����3)
--NOT IN (����1, ����2) 
--LIKE <- �ȿ� �� �˻� 

