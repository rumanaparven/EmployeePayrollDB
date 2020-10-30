create table employee_payroll(

id int NOT NULL identity(1,1) PRIMARY KEY,
name VARCHAR(50) NOT NULL,
salary DECIMAL(10,2) NOT NULL,
start_Date DATETIME NOT NULL ) ;

insert into employee_payroll values
(
'Akash', 50000, '2020-10-18'
)
select * from employee_payroll

insert into employee_payroll values
(
'Sagar', 60000, '2017-10-18'
)
insert into employee_payroll values
(
'Rumana', 50000, '2018-10-18'
)

select salary from employee_payroll where name='Sagar'
select salary from employee_payroll where start_Date between cast('2018-01-01' as date) and GETDATE();

select * from employee_payroll


alter table employee_payroll ADD gender CHAR(1)
select * from employee_payroll


update employee_payroll set gender='M' where name='Akash' or name='Sagar';
update employee_payroll set gender='F' where name='Rumana' ;

select * from employee_payroll

select sum(salary) from employee_payroll
select sum(salary) from employee_payroll where gender='M' group by gender
select avg(salary) from employee_payroll where gender='M' group by gender
select avg(salary) from employee_payroll where gender='F' group by gender
select max(salary) from employee_payroll where gender='M' group by gender
select count(name) from employee_payroll where gender='M'

alter table employee_payroll ADD employee_phone varchar(15),address varchar(100),department varchar(100) 

select * from employee_payroll
alter table employee_payroll alter column department varchar(100) not null;
UPDATE employee_payroll 
SET department = 0
WHERE department IS NULL;

alter table employee_payroll add constraint df_address default 'India' for address
UPDATE employee_payroll 
SET address = 'India'
WHERE address IS NULL;

select * from employee_payroll

alter table employee_payroll ADD basic_pay decimal(10,2),deductions decimal(10,2),taxable_pay decimal(10,2),income_tax decimal(10,2),net_pay decimal(10,2)
