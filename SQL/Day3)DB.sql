
--create table dept( dno int, dname varchar(20),location varchar(20))
--create table emp( empid int, emp_name varchar(50),salary int, hiredat date, job varchar(20), dno int)
--drop table emp 
--sp_help
--sp_helpconstraint dept
--create table dept( dno int constraint dno_pk primary key, dname varchar(20) not null constraint dname_uq unique,location varchar(20) constraint loc_chk check(location in('S', 'N', 'E', 'W')))
--create table emp( empid int constraint empid_pk primary key, emp_name varchar(50) not null,salary int check(salary>=7500), job varchar(20) constraint job_uq unique ,hiredat date default getdate(), dno int constraint dno_fk references dept(dno))
--sp_help emp
--alter table emp add email_id varchar(20) unique
--alter table emp  ALTER COLUMN address varchar(30) not null
--insert into dept values(35,'MKT','E')
select * from emp
select * from dept
--insert into emp values(103,'xyz',10000,'ACC',DEFAULT, 35,'rts','amfd@af.com')

--sp_rename 'emp.hiredat' , 'joindate'
--alter table emp drop constraint UQ__emp__3FEF8767A46F61EF
--update emp set email_id='s@A.com' where empid=103
--sp_help emp

