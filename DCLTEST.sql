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
     
     
     
