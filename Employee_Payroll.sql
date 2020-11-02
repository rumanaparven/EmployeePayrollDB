
--uc2 create employee payroll tablle
create table employee_payroll(
id int NOT NULL identity(1,1) PRIMARY KEY,
name VARCHAR(50) NOT NULL,
salary DECIMAL(10,2) NOT NULL,
start_Date DATETIME NOT NULL ) ;

--uc3 insert values into the table
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
--uc4 retrieve data
select * from employee_payroll

--uc5 retrieve salary for particular employee
select salary from employee_payroll where name='Sagar'
select salary from employee_payroll where start_Date between cast('2018-01-01' as date) and GETDATE();


--uc6 add gender column and update rows
alter table employee_payroll ADD gender CHAR(1)
update employee_payroll set gender='M' where name='Akash' or name='Sagar';
update employee_payroll set gender='F' where name='Rumana' ;


--uc7 find sum avg min max etc for salary
select sum(salary) from employee_payroll
select sum(salary) from employee_payroll where gender='M' group by gender
select avg(salary) from employee_payroll where gender='M' group by gender
select avg(salary) from employee_payroll where gender='F' group by gender
select max(salary) from employee_payroll where gender='M' group by gender
select count(name) from employee_payroll where gender='M'

--uc8 expand employee payroll data
alter table employee_payroll ADD employee_phone varchar(15),address varchar(100),department varchar(100) 
alter table employee_payroll alter column department varchar(100) not null;
UPDATE employee_payroll 
SET department = 0
WHERE department IS NULL;

alter table employee_payroll add constraint df_address default 'India' for address
UPDATE employee_payroll 
SET address = 'India'
WHERE address IS NULL;

--uc9 expand employee payroll data
alter table employee_payroll ADD basic_pay decimal(10,2),deductions decimal(10,2),taxable_pay decimal(10,2),income_tax decimal(10,2),net_pay decimal(10,2)

--uc10 
update employee_payroll set department='abc' where name='Sagar'
insert into employee_payroll(name,salary,start_Date,gender,employee_phone,address,department) values
(
'Sagar', 60000, '2017-10-18','F',null,'India','xyz'
)

--uc11
create table department(
deptID int not null primary key,
deptName varchar(20) not null
)
select * from department

insert into department values(101,'Accounts and Finance')
insert into department values(102,'HR')
insert into department values(103,'Sales and Marketing')
insert into department values(104,'Product development')

create table employee(
empID int NOT NULL identity(1,1) PRIMARY KEY,
deptID int not null, 
name VARCHAR(50) NOT NULL,
gender char(1) not null,
salary DECIMAL(10,2) NOT NULL,
start_Date DATETIME NOT NULL ,
contactNo varchar(20),
address varchar(100) not null, 
FOREIGN KEY(deptID) REFERENCES department(deptID)
)
SELECT * FROM employee
insert into employee values
(
 101,'Akansha','F', 50000, '2020-10-18','9089234567','Mumbai'
)
insert into employee values
(
102,'Priya','F', 80000, '2019-10-18','7895467223','Kolkata'
)
insert into employee values
(
103,'Sagar','M', 50000, '2018-01-04','9330234556','Pune'
)
create table payroll(
empID int not null foreign key references employee(empID),
basic_pay decimal(10,2),
deductions decimal(10,2),
taxable_pay decimal(10,2),
income_tax decimal(10,2),
net_pay decimal(10,2))
SELECT * FROM payroll

insert into payroll values(
2,90000,5000,2000,1000,80000)

--uc12
select e.empID,e.name,d.deptName,e.salary,e.start_Date,e.address,p.basic_pay,p.income_tax from employee e join department d
on e.deptID=d.deptID join payroll p on e.empID=p.empID where e.name='Priya';

