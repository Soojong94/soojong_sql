/******************��ü*******************/

-- VIEW  : ������ ���̺�, ���̺��� ��ȸ�ϴ� SELECT �� ��ü�� ������ ��ü

CREATE VIEW ���̹�ȸ������LITE AS
SELECT ID, �̸�
  FROM ���̹�ȸ��;
  
  
  SELECT *
   FROM "���̹�ȸ������LITE";
   
   DROP VIEW ���̹�ȸ������LITE;
   
   -- �ǽ�����
--   1. �μ���(GROUP BY) �ְ� �޿� (MAX) �� �޴� ������ �μ�ID�� �ְ� �޿��� ����ϼ���


CREATE VIEW �μ����ְ�޿� AS
SELECT DEPARTMENT_ID, MAX(SALARY)AS �ְ�޿�
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;
   
--   2. 1�� SELECT ���� �μ��� �ְ�޿���� VIEW �� ����
--   3. VIEW ���

SELECT E.FIRST_NAME, DMAX.�ְ�޿�
  FROM EMPLOYEES E, �μ����ְ�޿� DMAX
 WHERE E.DEPARTMENT_ID = DMAX.DEPARTMENT_ID ;
 
--  ������ : Ư�� ��Ģ�� �´� ���� ���ڸ� �����ϴ� ��ü
--  ��� ����ǥó�� ����ؼ� ���� ��ȣ�� ������ִ� ����
--  INSERT �� �� ���� ���� �ʴ��� ����ؼ� �ڵ����� �þ�� �ο��Ǵ� ��ȣ
-- �ַ� PK�� �÷�ó�� ������ ���� ���� �� �����

CREATE SEQUENCE NUM1;

CREATE TABLE �⼮��(
        �̸� VARCHAR2(12),
        ������ȣ NUMBER
);

INSERT INTO �⼮��
VALUES (
 '�����', NUM1.NEXTVAL);
 
 INSERT INTO �⼮�� VALUES(
   '����ȣ', NUM1.NEXTVAL);
   
   INSERT INTO �⼮�� VALUES(
    '������', NUM1.NEXTVAL
    
);

INSERT INTO �⼮�� VALUES(
    '���ڿ�', NUM1.NEXTVAL
);


INSERT INTO �⼮�� VALUES(
    '�赿��', NUM1.NEXTVAL
);


INSERT INTO �⼮�� VALUES(
    '������',NUM1.NEXTVAL);
    
SELECT *
FROM �⼮��;


-- ������ 

CREATE SEQUENCE NUM2
START WITH 0
INCREMENT BY 2
MAXVALUE 100
MINVALUE 0
NOCYCLE; 

CREATE TABLE �������׽�Ʈ2(
    ������ NUMBER);
    
INSERT INTO  �������׽�Ʈ2 VALUES (NUM2.NEXTVAL);

SELECT *
  FROM �������׽�Ʈ2;
  
  
--  ROWNUM : �ӽ����ȣ
-- �Խ��� ��ȣ, �ӽ÷� �ʿ��� ��ȣ�� �����ؾ��� �� ���

-- ROWNUM �� �ӽ÷� �߱��ϴ� ��ȣ�̱� ������ 1�� ������ ���

SELECT ROWNUM, EMPLOYEE_ID , FIRST_NAME
  FROM EMPLOYEES
  WHERE ROWNUM <=5;
  
  -- �޿��� ���� ����
  
  SELECT FIRST_NAME , SALARY
    FROM EMPLOYEES
WHERE SALARY IS NOT NULL
AND ROWNUM <=5
ORDER BY SALARY DESC;
  
-- �Խ����� ����¡ ó��, ���� ������ ����, ���� ������ ���� ...


