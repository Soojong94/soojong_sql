/******************DDL**********************/

--DDL : ������ ���Ǿ�
    --  ���̺�� ���� ������ ������ �����ϴ� �� ����ϴ� ��ɾ�
    -- CREATE : ���ο� ��ü�� ������ �� ����ϴ� ��ɾ�
    
    --CREATE �� ���̺� �����ϴ� ���
    CREATE TABLE ���̺� �̸�(
    �÷��̸� �ڷ���(ũ��) (�⺻��) (NULL����)
    );

    CREATE TABLE ����(
    ����ID NUMBER(6) NOT NULL,
    �̸� VARCHAR2(20) ,
    �� VARCHAR2(25) NOT NULL,
    �̸��� VARCHAR2(25) NOT NULL,
    �ڵ��� VARCHAR2(20),
    �Ի��� DATE NOT NULL,
    ����ID VARCHAR2(10) NOT NULL,
    �޿� NUMBER(8,2),
    ��������� NUMBER(2),
    �Ŵ���ID NUMBER(6),
    �μ�ID NUMBER(4)
    );
    
    CREATE TABLE �μ�(
    �μ�ID NUMBER(4) NOT NULL,
    �μ��̸� VARCHAR2(30) NOT NULL,
    �Ŵ���ID NUMBER(6),
    ��ġID NUMBER(4)
    );
    
--���� ����
--PK (PRIMARY KEY) : �ߺ��Ұ� + NULL �Ұ� -> ���� �ĺ��� �� �մ� �÷�
--UK (UNIQUE KEY ) : �ߺ��Ұ� + NULL ����

--         �ߺ�      NULLABLE   ����
--PK (Primary Key)   X      X      �ֹι�ȣ,���,..
--UK (Unique Key)   X      O      email,��������

--NOT NULL : NULL �� ���� �� �ֳ� ���� 
--CHECK : ������ �����͸� �Է� �����ϰ� �� (EX. ��/�� , 1/2) 

--FK (Foreign Key) : �ܷ�Ű, �ٸ� ���̺��� �⺻ Ű�� �����ϴ� �Ӽ� (����)
--- PK�� ������ Table �̶�� Ī���� X (���X ������) 
--- �ٸ�, UK�� ��� �� 
    
-- ���������� �߰��ϴ� ����
-- ALTER TABLE ���̺�� ADD CONSTRAINT �������Ǹ� �������� (�÷�);

--1. PK �߰� ����
ALTER TABLE ����
ADD CONSTRAINT ����_����ID_PK PRIMARY KEY(����ID);

--2. UK �߰� ����(�̸���)
ALTER TABLE ����
ADD CONSTRAINT ����_�̸���_UK UNIQUE(�̸���);

--3. CHECK ����(�޿� 0 �ʰ�)
ALTER TABLE ����
ADD CONSTRAINT ����_�޿�_CK CHECK(�޿�>0);

-- 4. FK �߰� ����(�ܷ�Ű)
-- FK �� �ٸ� ���̺��� UK �� FK �� ���� ���� ����
-- ���� ���� ������ ���̺��� �÷��� PK, UK �� ������ �Ǿ� �־�߸� FK�� ���� ����
-- ALTER TABLE ���̺�� ADD CONSTRAINT �������Ǹ� ��������(�÷�) 
-- REFERENCES  ������ ���̺�(������ �÷�);
-- ���� ���̺� �ִ� �μ� ID�� FK�� ���
-- �μ� ���̺� �ִ� �μ� ID�� ����
    
    
-- 4-1) �μ� ID�� PK �� ����
ALTER TABLE �μ� ADD CONSTRAINT �μ�_�μ�ID_PK PRIMARY KEY(�μ�ID);
-- 4-2) ���� ���̺��� �μ� ID - �μ� ���̺� �μ� ID ����
ALTER TABLE ���� ADD CONSTRAINT ����_�μ�ID_FK FOREIGN KEY(�μ�ID)
            REFERENCES �μ�(�μ�ID);

-- 5. NOT NULL ����
ALTER TABLE ���� MODIFY �̸� NOT NULL;

-- 6. �������� ����
-- ALTER TABLE ���̺�� DROP CONSTRAINT �������Ǹ�
ALTER TABLE ���� DROP CONSTRAINT ����_�޿�_CK; 


--7. �������� ��ȸ
SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = '����';

--������ ���Ἲ 
--- ���Ἲ : �����Ϳ� ������ ���� ���� 
--- ���Ἲ ���� ������ ������ �����ͺ��̽��� ���Ἲ�� �����ϰ�, �ϰ��ǰ� �����ϰ� �ϴ� �� 
--
--- ���Ἲ ���������� ���� 
--1) ��ü ���Ἲ (Entity integrity) 
--- �⺻Ű ���� 
--- ���̺��� �⺻Ű�� �������Ѵ�. 
--- �⺻Ű�� Null���� ���� �� ���� 
--- �⺻Ű�� ���̺� ���� �ϳ��� ���� �� �� �ִ�. 
--- �ϳ��� ���̺� ���� �⺻Ű�� ������ �̸��� ���� �÷� ������ �� ���� 
--
--2) ���� ���Ἲ (Referential integrity) 
--- �ܷ�Ű ���� 
--- �ܷ�Ű�� ���� �����̼��� �⺻Ű ���� �����ؾ��Ѵ�. 
--  ( = �ܷ�Ű�� PK, UK �� ������ �� �ִ�) 
--- �ܷ�Ű �Ӽ��� ������ �� ���� ���� ���� �� ����. 
--  (������ �� ���� �� =/ PK, UK) 

--8. ���� ������ ���̺� ���� �ÿ� �߰�
CREATE TABLE ���������׽�Ʈ(   
    PK�׽�Ʈ NUMBER PRIMARY KEY,
    UK�׽�Ʈ NUMBER UNIQUE,
    NN�׽�Ʈ NUMBER NOT NULL,
    CK�׽�Ʈ NUMBER CHECK(CK�׽�Ʈ>0)
    );
    
--���̺� -> ������ ���콺 -> ���ΰ�ħ
--���������׽�Ʈ �巡�� -> SHIFT + F4 -> ���̺� ���� Ȯ��

-- 9. ���̺� ����
-- DROP TABLE ���̺�� : ���̺� ���� ���� (-�ȿ� �ִ� �����ͱ��� ����)

DROP TABLE ���������׽�Ʈ;
DROP TABLE �μ�; --�� ���ư�(���� ���̱� ������)

--DROP TABLE ���̺�� CASCADE CONSTRAINT(���̺�, ������, FK���� ���� ����)
--���� ��ζ�� �������� ������ ������ ->DROP TABLE

CREATE TABLE ���̹���α�(
    ��α׹�ȣ NUMBER(4),
    ��α����� VARCHAR2(100) NOT NULL,
    ��α׳��� VARCHAR2(4000) NOT NULL,
    ID  VARCHAR2(15)
);

CREATE TABLE ���̹�ȸ�� (
    ID VARCHAR2(15),
    �̸� VARCHAR2(12) NOT NULL,
    ��й�ȣ VARCHAR2(16) ,
    ������� DATE ,
    ���� VARCHAR2(3)
);

ALTER TABLE ���̹�ȸ�� ADD CONSTRAINT ���̹�ȸ��_ID_PK PRIMARY KEY(ID);

ALTER TABLE ���̹�ȸ�� ADD CONSTRAINT ���̹�ȸ��_����_CK CHECK (���� IN ('��' , '��'));

ALTER TABLE ���̹���α� ADD CONSTRAINT PK_���̹���α� PRIMARY KEY (��α׹�ȣ);

ALTER TABLE ���̹���α� ADD CONSTRAINT ���̹���α�_ID_FK FOREIGN KEY(ID)
            REFERENCES ���̹�ȸ��(ID);
            
ALTER TABLE ���̹���α� DROP CONSTRAINT ���̹���α�_FK ;

ALTER TABLE ���̹���α� ADD CONSTRAINT FK_���̹���α� FOREIGN KEY(ID)
            REFERENCES ���̹�ȸ��(ID);
            
            
            
            

