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



  