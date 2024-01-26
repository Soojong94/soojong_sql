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
FROM 상대개발자;

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



create table 상대개발자
(
Nick varchar(50) primary key ,
체력 number(3) not null,
지능 number(3) not null,
신앙력 number(3) not null,
마력 number(3) not null,
정신력 number(3) not null,
연봉 number(20) not null
)
;


INSERT INTO 상대개발자
values
( 'SBS' , 40, 20, 20,25,25,'10000');





drop table Character;
commit;