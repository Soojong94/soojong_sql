create table member 
(
ID varchar2(50) primary key ,
PW varchar2(20) not null
)
;

INSERT INTO member
VALUES('ColdWeahter', '1234' );

commit;

SELECT *
FROM ��밳����;

create table Character
(

NickName varchar(50) ,
Health number(3) not null,
Intelligence number(3) not null,
FaithPower number(3) not null,
MagicPower number(3) not null,
Mentality number(3) not null,
Salary number(3)

)
;



create table ��밳����
(
Nick varchar(50) primary key ,
ü�� number(3) not null,
���� number(3) not null,
�žӷ� number(3) not null,
���� number(3) not null,
���ŷ� number(3) not null,
���� number(20) not null
)
;


INSERT INTO ��밳����
values
( 'SBS' , 40, 20, 20,25,25,'10000');





drop table Character;
commit;