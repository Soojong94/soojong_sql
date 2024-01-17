/*********************GROUP BY**********************/

--GROUP BY : Ư�� �÷����� �׷�ȭ �� �� ���
--EX) �μ��� ��� ������ ���ϰ� �ʹ�

SELECT DEPARTMENT_ID, ROUND(AVG(SALARY))
  FROM EMPLOYEES
  GROUP BY DEPARTMENT_ID;
  
-- ���� �׷�ȭ �����ߴµ�, ������ �����Ͱ� ����ʹٸ�?
-- �� �� , ���� : �׷�ȭ�� �ϰ� �Ǹ� ���� ��µǴ� ���� ����
-- ��µ� �� �ִ� �÷��� ����

--����Ǵ� ���� : FROM ->GROUP BY->SELECT
--2��° ����Ǵ� GROUP BY ���� ���� ������ 108�� -> 12��

--�̹� �׷�ȭ ��Ų ���� ������ ���� ���� ������ �� �±� ������ SELECT�� ���� ����

SELECT DEPARTMENT_ID, ROUND(AVG(SALARY))
  FROM EMPLOYEES
  GROUP BY DEPARTMENT_ID;
  
  --��, ���� �Լ��� ��� ����
  SELECT DEPARTMENT_ID, ROUND(AVG(SALARY)) , COUNT (*)
  FROM EMPLOYEES
  GROUP BY DEPARTMENT_ID;
  
  
--  ���� ���̺��� �޿��� ����, �հ�, �ּ� �޿�, �ִ� �޿�, �޿��� ��� ���� "�μ���"�� ���غ���
SELECT DEPARTMENT_ID, 
        COUNT(SALARY), 
        SUM(SALARY), 
        MIN(SALARY), 
        MAX(SALARY),  
        ROUND(AVG(SALARY))
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

--������ �Լ� :  1->1 �Լ��� �ԷµǴ� ���� ���� 1 , ��� �� 1
--EX) UPPER , LOWER...

--������ �Լ� : N ->1 �Լ��� �ԷµǴ� ���� ���� N, ��� �� 1
--EX) SUM, AVG...

--COUNT(*) = NULL ���� 
--COUNT (�÷�) = NULL ������
SELECT COUNT(DEPARTMENT_ID), COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

--�ǽ�

-- 1 . ����ǥ ���̺��� �л� ���� ��� ���� ���(�л�ID , ��� ����)
-- ��, �Ҽ��� 1�� �ڸ����� ���
SELECT �л�ID, ROUND(AVG(����),1) AS �������
FROM ����ǥ
GROUP BY �л�ID;

--2. ����ǥ ���̺��� ���񺰷� �ְ� ����, ���� ������ ���(�ְ� ����, ��������)
SELECT MAX(����) AS �ְ��� , MIN(����) AS ��������
FROM ����ǥ
GROUP BY ����;

--3. ������ ���� ���̺��� �� ���� ����� �ִ��� ���(��, ���� �ο���)
SELECT ��, COUNT(*) AS �����ο���
FROM ����������
GROUP BY ��;

--4. ����ǥ ���̺��� �л� ���� JAVA + DATABASE ������ ��� ���(�л�ID, ��� ����)
--��Ʈ JAVA+D ��� �� Ư�� ���� ������ ����
--�� ������ 1�� �ڸ����� �ݿø�

SELECT �л�ID , ROUND(AVG(����),-1) AS ��ռ���
FROM ����ǥ 
WHERE ���� <> 'PYTHON'
GROUP BY �л�ID;



/************************HAVING****************************/
-- HAVING : GROUP BY ���� ���ؼ� �׷�ȭ �� ��� ��, ���ϴ� ����� ���͸� ���ִ� ����
-- HAVING ���� GROUP BY ���� �ִ� �÷����θ� ��� ����

-- ����ǥ ���̺���
-- �л���
--�л� ID , ������ ��� ���� ���

SELECT �л�ID, ROUND(AVG(����))
FROM ����ǥ
WHERE ���� <> 'PYTHON'
GROUP BY �л�ID
HAVING AVG(����)>80
ORDER BY �л�ID;

-- ����ǥ ���̺��� 
-- �л� �� 
-- ���̽� ������ �����ϰ� 
-- �� ����� 80 �̻��� �л�ID, ���� ��� ����Ұ��� 
-- ��, �л� �̸� ������� 

SELECT �л�ID , ROUND(AVG(����))
FROM ����ǥ
WHERE ���� <> 'PYTHON'
GROUP BY �л�ID
HAVING AVG(����)>80
ORDER BY �л�ID;

-- �ǽ� 
-- 1) ������ �������� �Ҽӵ� ���� �ο� ���� 3�� �̻��� ���� ��� 

SELECT �� , COUNT(*)
FROM ����������
GROUP BY ��
HAVING COUNT(*)>=3;

-- 2) ���� (EMPLOYEES) ���̺��� �μ� �� �ְ� ������ 100,000 �̻��� �μ��� ID �� ���

SELECT DEPARTMENT_ID, MAX(SALARY*12) AS ����
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX (SALARY*12) > 100000;


-- 3) ����ǥ ���̺��� �л� �� ��� ������ ����ϵ�, NULL�� �ƴ� ���� ��� 
--  ��, ������ 1�� �ڸ������� ǥ�� 

SELECT �л�ID ,  ROUND(AVG(����)) AS  ��ռ���
FROM ����ǥ
GROUP BY �л�ID
HAVING AVG(����) IS NOT NULL
ORDER BY  ��ռ��� DESC;

//////////////////////////////*ORDER BY*///////////////////////////////////////////

--ORDER BY �����÷� (ASC) - �������� ���� ASC�� DEFAULT ���̱� ������ ��������
--ORDER BY �����÷� (DESC) - �������� ����


SELECT *
FROM ����ǥ
ORDER BY �л�ID, ���� DESC;


--SELECT ���� �Էµ��� ���� �÷��̶� �������� ������ �� �ִ�.  
SELECT EMPLOYEE_ID
  FROM EMPLOYEES
  ORDER BY SALARY;
  
--GROUP BY �� ��õ� ��쿡�� GROUP BY �� ������ �÷��� ���Ŀ� ��밡��
--������� >GROUPBY->HAVING->SELECT->ORDER BY ������ ������ �Ǳ� ������
-- ORDER BY �� ����� �� ����.

SELECT DEPARTMENT_ID 
  FROM EMPLOYEES
  WHERE DEPARTMENT_ID IS NOT NULL
  GROUP BY DEPARTMENT_ID
  ORDER BY DEPARTMENT_ID;
  
  SELECT SALARY*12 AS ����
  FROM EMPLOYEES
  ORDER BY ����
  
  