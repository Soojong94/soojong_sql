/************************JOIN*************************/

-- JOIN ���� ���� ���̺��� �����ؼ� ����ϴ� ��
-- �ʿ��� �����Ͱ� �� �� �̻��� ���̺� ������ ���� �� �����͸� ���ļ� ���������� ���
--���� ID �� 100�� ������ �μ��̸��� ���
--���� ID(���� ���̺�) / �μ��̸� (�μ����̺�)

--JOIN ������ �𸥴ٴ� ���� �Ͽ� ����
--1. ���� ID�� 100�� ������ ã�´� -> �μ� ID�� �����´�


SELECT DEPARTMENT_ID
FROM EMPLOYEES
WHERE EMPLOYEE_ID=100;

--2.  �μ� ID�� 90�� �μ��� �̸��� �����´�

SELECT DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE DEPARTMENT_ID = 90;

--���� ���� JOIN ������ �˰� �ִٸ�

SELECT D.DEPARTMENT_NAME
FROM EMPLOYEES  E , DEPARTMENTS  D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND E.EMPLOYEE_ID =100; 

/**********FROM************/
-- FROM ���� ���̺��� ���� �� ��� ���� + �� ���̺��� ��Ī�� ����
-- ���� ����� ���̺�1 �̸� ���̺�1 ��Ī, ���̺�2 �̸� ���̺� 2 ��Ī
-- EX) EMPLOYEES E ,  DEPARTMENT D
-- ���� ���̺��� ������ ����ϴ� ��� ��! � ���̺��� �̿��Ұ���
-- ��Ȯ�ϰ� ��Ī���� ��������� ��

SELECT  D.DEPARTMENT_ID
  FROM EMPLOYEES E, DEPARTMENTS D;
  
--  ���� �� ���̺��� �ִ� �÷��̶�� ���� ��Ī ���̵� ��� ����
  
  
SELECT EMPLOYEE_ID
FROM EMPLOYEES E , DEPARTMENTS D;

--��Ī�� �ְ��� , �� �ڿ� ���� ���������� ��� �� ��Ī�� ����ؾ���

--����(Ǯ���ӵ� �� ��)
SELECT  DEPARTMENTS.DEPARTMENT_ID
  FROM EMPLOYEES E, DEPARTMENTS D;
  
  
-- [CROSS JOIN] : ���� ���� ��� ���� JOIN �ؼ� ���
-- īƼ�� ��

-- 1. ���� ���̺� ���
SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID
FROM EMPLOYEES E;

-- 2. �μ� ���̺� ���
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME
  FROM DEPARTMENTS D;

-- 3. �� ���̺��� JOIN �ؼ� ���

SELECT E.EMPLOYEE_ID, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D;
--108*27 ��

-- [INNER JOIN] : ���̺� ���� ������, JOIN �߿��� ���� �Ϲ����� ���
-- JOIN �ϼ��� == INNER JOIN �ϼ���

--���� ���̵� 114���� ����� ���� ID, �̸�, �μ� ID, �μ��̸��� ����ϼ���
-- ���� �����;��� ���̺��� �ΰ� �̻��� ���


--1) WHERE �������� ����ؼ� INNER JOIN
--���� ORACLE ������ ��� ����

SELECT E.EMPLOYEE_ID, FIRST_NAME , D.DEPARTMENT_ID, DEPARTMENT_NAME
FROM EMPLOYEES E , DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
   AND EMPLOYEE_ID = 114;
   
--   2)ANSI ������ ���
--   �̱�����ǥ����ȸ ANSI���� ���� ����, ��� db���� ��� ����->����


--  SELECT �÷�
--  FROM A���̺� INNER JOIN B ���̺�
--     ON  (����) ;

SELECT E.EMPLOYEE_ID, FIRST_NAME , D.DEPARTMENT_ID, DEPARTMENT_NAME
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON  (E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND EMPLOYEE_ID = 114);

-- �� ���̺� ��� �����Ͱ� �־�߸� ����� ���´�
-- INNER JOIN ������ NULL  ���� ������ �ʴ´�. 
-- WHY ? (����-�μ����̵� / �μ�-�μ����̵� )�񱳿����� �Ұ����ϱ� ����

--�ǽ�����
--1 ���� �� 2�� �� / ����Ŭ ����/ ǥ�ع���

--1. ���� ���̺��(EM) ���� ���̺� (JOBS) INNER JOIN �� ����ؼ�
--���� ID�� ���� ID�� ���� TITLE ���

SELECT E.EMPLOYEE_ID, J.JOB_ID, j.job_title, E.FIRST_NAME
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_ID
ORDER BY E.FIRST_NAME;

SELECT E.EMPLOYEE_ID, J.JOB_ID, j.job_title
FROM EMPLOYEES E INNER JOIN JOBS J
   ON E.JOB_ID = J.JOB_ID;

--2. �� �μ��� �Ŵ��� ������ �ⷰ
-- �μ� ���̺�� ���� ���̺��� INNER JOIN �� ����ؼ�
--�μ��̸�, �Ŵ���ID, ���� ID �� ���

SELECT d.department_name, D.manager_id, e.employee_id
FROM DEPARTMENTS D, EMPLOYEES E
WHERE D.MANAGER_ID = E.EMPLOYEE_ID;

SELECT d.department_name, D.manager_id, e.employee_id
FROM DEPARTMENTS D INNER JOIN EMPLOYEES E
ON D.MANAGER_ID = e.employee_id
ORDER BY E.EMPLOYEE_ID DESC;

-- ������ ~~~~~~ �߿�
-- ��, INNER JOIN �� NULL ���� ������� ���ϱ� ������
-- NULL ���� �����ؼ� ����ϰ� ���� ���� OUTER JOIN

/******************OUTER JOIN*********************/

-- 1. LEFT OUTER JOIN : ���ʿ� �ִ� a���̺��� �������� OUTER JOIN
--SELECT �÷�
--  FROM A���̺� ��Ī LEFT OUTER JOIN B���̺� ��Ī
--     ON (��������);

-- ���� ���̺� �ִ� ���� ���̵�, �μ� ���̵�, �μ� �̸� ���

SELECT E.EMPLOYEE_ID, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D
   ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;
  
-- 2. RIGHT OUTER JOIN : �����ʿ� �ִ� B���̺��� �������� OUTER JOIN

SELECT E.EMPLOYEE_ID, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E RIGHT OUTER JOIN DEPARTMENTS D
   ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;


-- FULL OUTER JOIN : ���� ���̺��� ��� �� (NULL ����) �� ��µȴ�

SELECT E.EMPLOYEE_ID, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E FULL OUTER JOIN DEPARTMENTS D
   ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;


----------------ORACLE ���� Ȱ���� OUTER JOIN---------------------------
--�� �������� �ܿ�� �� ����

-- 1. LEFT OUTER JOIN-> �����ʿ�(+)
SELECT E.EMPLOYEE_ID, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E , DEPARTMENTS D
WHERE e.department_id = d.department_id(+);
   -- 2. RIGHT OUTER JOIN-> ���ʿ�(+)
SELECT E.EMPLOYEE_ID, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E , DEPARTMENTS D
WHERE e.department_id(+) = d.department_id;

-- 3. FULL OUTER JOIN�� �ܼ� ��ȣ�߰��δ� �Ұ���

-- �ǽ� 
-- 1. �� �μ��� �Ŵ��� �������� ����ϵ�, �μ� ���̺��� �������� LEFT OUTER JOIN�� ����ؼ�
--      �μ� NAME, �Ŵ��� ID�� ���� ID�� ����ض� (ANSI ������ ���) 

SELECT D.DEPARTMENT_NAME , D.MANAGER_ID, E.EMPLOYEE_ID
FROM DEPARTMENTS D LEFT OUTER JOIN EMPLOYEES E
  ON  D.MANAGER_ID = E.EMPLOYEE_ID
    ORDER BY D.MANAGER_ID;

-- 2. �� �μ��� �Ŵ��� �������� ����ϵ�, �μ� ���̺��� �������� RIGHT OUTER JOIN�� ����ؼ� 
--      �μ� NAME, �Ŵ��� ID, ���� ID�� ����ض� (ANSI ����) 

SELECT D.DEPARTMENT_NAME , D.MANAGER_ID, E.EMPLOYEE_ID
FROM DEPARTMENTS D  RIGHT OUTER JOIN EMPLOYEES E
  ON  D.MANAGER_ID = E.EMPLOYEE_ID
    ORDER BY D.MANAGER_ID;

-- 3. �� �μ��� �Ŵ��� �������� ����ϵ�, �μ����̺��� �������� FULL OUTER JOIN�� ����ؼ�
--   �μ� NAME, �Ŵ��� ID, ���� ID�� ����ض� (ANSI����) 

SELECT D.DEPARTMENT_NAME , D.MANAGER_ID, E.EMPLOYEE_ID
FROM EMPLOYEES E  FULL OUTER JOIN DEPARTMENTS D
  ON  D.MANAGER_ID = E.EMPLOYEE_ID
  ORDER BY D.MANAGER_ID;

-- *��Ʈ : A���̺��� ��������? A���̺��� ���� �ۼ� 
--      A���̺� LEFT OUTER JOIN B���̺� 


--Ȯ�ο�
SELECT D.DEPARTMENT_NAME , D.MANAGER_ID, E.EMPLOYEE_ID
FROM EMPLOYEES E  INNER JOIN DEPARTMENTS D
  ON  D.MANAGER_ID = E.EMPLOYEE_ID
    ORDER BY D.MANAGER_ID;

-- 3���� ���̺� JOIN �ϱ�
-- �μ� ���̺�, ��ġ ���̺�, ���� ���̺� ������ INNER JOIN �ؼ�
--�� �μ��� ���ÿ� �����̸��� ���

SELECT D.DEPARTMENT_NAME, C.COUNTRY_NAME, CITY
  FROM DEPARTMENTS D,   LOCATIONS L , COUNTRIES C
WHERE D.LOCATION_ID =  L.LOCATION_ID
  AND L.COUNTRY_ID =C.COUNTRY_ID;


SELECT D.DEPARTMENT_NAME, C.COUNTRY_NAME, CITY
  FROM DEPARTMENTS D  INNER JOIN LOCATIONS L
  ON D.LOCATION_ID =  L.LOCATION_ID
  INNER JOIN COUNTRIES C
  ON L.COUNTRY_ID =C.COUNTRY_ID;
  
