/*********************************DCL*********************************/

--DCL : ������ ����� (���� �ο� , ���� ȸ�� , ���� ����)

-- 1. ����� ����
CONN SYSTEM/12345;
CREATE USER �����̸� IDENTIFIED BY ��й�ȣ;


-- 2. DB�� ������ �� �ִ� ���� ����
GRANT CREATE SESSION TO �����̸�;

--3. DB�� ������ �� �ִ� ���� ȸ��
REVOKE CREATE SESSION FROM �����̸�;

--4. ���̺� ���� ����
GRANT RESOURCE TO �����̸�;


--5. HR ���� ���� ���� �ֱ�
GRANT SELECT, UPDATE 
     ON �ٸ�����, ��ü
     TO �����̸�;
     
     CREATE TABLE TEST(
     TEST NUMBER);
     
     SELECT  *
     FROM TEST;
     
-- ��Ű��
-- �� �������� �����ϰ�, �̸��� ������ ����
-- ����Ŭ������ ������ ��Ű���� �������� �ʰ� ���

SELECT *
 FROM DCLTEST.TEST;
 
 --���� ��ζ��  ��Ű��.���̺�.�÷� ���·� �ۼ��ؾ�������
 --�ڵ����� ������ ������ ��Ű���� ���� �����ؼ� �׵��� �����ߴ� ����
 
 SELECT *
   FROM HR.EMPLOYEES;

--HR �������� ��ü ���� �ֱ�

-- GRANT SELECT, UPDATE
--    ON HR.EMPLOYEES
--     TO DCLTEST;

--------------------------------------------------

UPDATE HR.EMPLOYEES
      SET FIRST_NAME = '����'
 WHERE EMPLOYEE_ID = 207;
 
 