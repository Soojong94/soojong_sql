/******************��������*****************/
--SQL ���ο��� ���Ǵ� SELECT
--Q. �̸��� SHELLI �� ���� ���� �޿��� ���� �������� ���

--1. �̸��� SHELLI �� ������ �޿��� ����
SELECT SALARY
FROM EMPLOYEES
WHERE FIRST_NAME = 'Shelli';

--2. �� ������ �޿����� ���� �޿��� �޴� ���� ���
SELECT FIRST_NAME , SALARY
  FROM EMPLOYEES
WHERE SALARY < 2900;

-- �������� ���
SELECT FIRST_NAME , SALARY
  FROM EMPLOYEES
WHERE SALARY < 
(
SELECT SALARY
FROM EMPLOYEES
WHERE FIRST_NAME = 'Shelli' 
);



