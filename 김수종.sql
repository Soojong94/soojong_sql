--7��--

SELECT JOB_ID , AVG(SALARY) AS ��տ���
  FROM EMPLOYEES 
 GROUP BY JOB_ID 
HAVING AVG(SALARY) > 13000 ;
  
--8��--  
SELECT EMPLOYEE_ID, EMAIL, SALARY
FROM (
    SELECT *
    FROM EMPLOYEES
    WHERE SALARY IS NOT NULL
    ORDER BY SALARY DESC
)
WHERE ROWNUM <= 5;

--9��--
SELECT E.EMPLOYEE_ID , E.EMAIL , E.SALARY,  D. DEPARTMENT_NAME , D. LOCATION_ID 
FROM EMPLOYEES E  INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID  = D.DEPARTMENT_ID 
AND SALARY >=14000;

--10��--
SELECT A.DEPARTMENT_ID 
     , A.DEPARTMENT_NAME 
     , A.MANAGER_ID 
     , B.FIRST_NAME 
     , B.LAST_NAME 
  FROM DEPARTMENTS A INNER JOIN
      EMPLOYEES B 
 ON A.MANAGER_ID = B.EMPLOYEE_ID(+)
   AND A.LOCATION_ID = 1700 ;
   

--11��--
--11-(1)--
   CREATE TABLE TB_STUDENT
    (
   STUDENT_ID NUMBER NOT NULL,
   STUDENT_NAME VARCHAR2(50) NOT NULL,
   AGE NUMBER ,
   MAJOR_ID VARCHAR2(50)
   ); 
   ALTER TABLE TB_STUDENT MODIFY AGE DEFAULT 20;
 
      CREATE TABLE TB_MAJOR
    (
   MAJOR_ID VARCHAR2(50) NOT NULL,
   MAJOR_NAME VARCHAR2(100) NOT NULL,
   INST_DY VARCHAR2(8) NOT NULL
   );
   
--11-(2)--
ALTER TABLE TB_STUDENT ADD CONSTRAINT PK_STUDENT PRIMARY KEY (STUDENT_ID);
 
--11-(3)--
ALTER TABLE TB_MAJOR ADD CONSTRAINT PK_MAJOR PRIMARY KEY (MAJOR_ID);

--11-(4)--
   INSERT INTO TB_MAJOR
          VALUES(
            'M0001', '�������а�', '19960201'
            );
    INSERT INTO TB_MAJOR
          VALUES(
            'M0002', '�濵�а�', '20000302'
            );
            
--11-(5)--   
 INSERT INTO TB_STUDENT
     VALUES(
             1000, '��ö��', 20,  'M0001'
            );
INSERT INTO TB_STUDENT
     VALUES(
             2000, 'ȫ�浿', 21, 'M0002'
            );
--11-(6)--         
UPDATE  TB_MAJOR 
SET        MAJOR_NAME = '�ΰ��������հ�'
WHERE   MAJOR_NAME = '�������а�' ;

--11-(7)--
DELETE TB_STUDENT
WHERE STUDENT_ID = 1000;