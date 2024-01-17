-- �ּ� ó�� ��ȣ 
-- SQL������ ��ҹ��ڸ� �������� �ʴ´�. 
-- ���⳪ �ٹٲ� ���� ��ɾ� ���࿡ ������ ���� �ʴ´�. 
-- SQL ���� ������ �� �����ݷ� (;) �� ���� �Ѵ�.
-- ������ CTRL + ENTER , F9 

/* ���� �� �ּ�ó�� */ 

/* *************** SELECT **************** */
-- �����͸� �˻��ϰų� ��ȸ�� �� ����ϴ� SQL QUERY ���� 

-- 1. ��ü ��ȸ (���) 
-- * : �ֽ��͸���ũ => '��ü' 
-- ������ ����, � �÷������� �̿��ϴ��� �Ѵ��� ���Ⱑ ��Ʊ� ������ �ǹ������� ���� ���X 

SELECT * 
  FROM EMPLOYEES; 
  
-- �ǽ� : �μ� ���̺� �ִ� ��ü ������ ����ϱ� (DEPARTMENTS)
SELECT *
  FROM DEPARTMENTS;
  
  -- 2. ���ϴ� �÷��� ����ϱ�
 /*
    SELECT �÷�1, �÷�,2 �÷�3
    FROM ���̺�
 */
 
 SELECT employee_id, employees_seq.nextval
   FROM EMPLOYEES;
 
 /*
    �ǽ� 
    1) ���� ���̺��� ���� ID, �̸�, �Ի��� ��� 
    2) �μ� ���̺��� �μ� ID, �μ���, �ٹ��� ID�� ��� 
    
    ���� Ǯ������ �� ��ȣ�� ���忡 üũ!  
*/
  
  SELECT employee_id, first_name, last_name, hire_date
    FROM employees;

  SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID
    FROM DEPARTMENTS;
        
-- 3. DISTINCT �� �̿��ؼ� �ߺ� ����
-- �÷��� 1���� ��� �ش� �÷��� �ߺ��� �����Ѵ�
-- �׷��� �÷��� �������� ��� �÷�+�÷� ���� �ߺ��� ���� ����
-- �׷��� �Ѱ��� �÷��� �ٸ� ���, �ߺ����� ��µǱ⵵ �Ѵ�

SELECT DISTINCT DEPARTMENT_ID
  FROM EMPLOYEES;

/* �ǽ�
  1. ���� ���̺��� �Ի����� ��� -> ���� ������ Ȯ��, ���� �ּ�
  2. ���� ���̺��� �Ի��� �ߺ����� ��� -> ���� ������ Ȯ��, ���� �ּ�
  
*/
  SELECT HIRE_DATE
    FROM EMPLOYEES;
  --107��
  
  SELECT DISTINCT HIRE_DATE
    FROM EMPLOYEES;
   --98��
 
 -- 4. ��Ī �����ϱ�
 -- 4-1. �÷� �̸��� �ʹ� ��ų�, �ٸ��� ǥ���� ���
 
SELECT EMPLOYEE_ID ����������ȣ1
FROM employees;
   
SELECT EMPLOYEE_ID "����������ȣ2"
FROM employees;
   
SELECT EMPLOYEE_ID AS ����������ȣ3
FROM employees;
   
SELECT EMPLOYEE_ID AS "����������ȣ4"
FROM employees;
   
   -- 4-2. ���� ���� �÷��� �����ؼ� ����� ���
   
   SELECT SALARY AS ����
   ,SALARY*12 AS ����
     FROM EMPLOYEES;
     
     /* ���� ���̺��� �Ի���, �Ի� ������ ����� ��
     
     �Ի����� "�Ի���" �� ǥ��
     �Ի� ��������  "��༭ �ۼ���"�� ǥ��
     ��, 4���� ǥ�������� ��� �ۼ�
     
     */
     
     SELECT HIRE_DATE �Ի���, HIRE_DATE+1 "��༭ �ۼ���"
       FROM EMPLOYEES;
       
       SELECT HIRE_DATE AS �Ի���, HIRE_DATE+1 AS "��༭ �ۼ���"
       FROM EMPLOYEES;
 
 /* ��Ī ���� ���� ����
 
1. ��Ī���� ���⸦ ����� �� ����
2. ���ڷ� �����ؾߵ�
3. ����� �Ұ�(������ ����ϰ� �ִ� ���� Ű����)
4. Ư������ $, _, # �� ���� ����

*/
 
 -- 5.  NULL 
 SELECT SALARY*12 AS ����
   FROM EMPLOYEES;
 INSERT INTO EMPLOYEES
 (  employee_id, last_name, EMAIL, hire_date, job_id )
 VALUES (
 207, '��' , 'PARK' , SYSDATE, 'IT_PROG'
 ); 
   
 
 
 
 
 
 
 
 
 
 
 
  