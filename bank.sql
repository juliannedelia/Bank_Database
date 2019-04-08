create database bank;
use bank;


create table if not exists account
(
	account_number char(5) not null primary key,
	branch_name varchar(10),
	balance double
);

insert into account values('A-101', 'Downtown',   500);
insert into account values('A-102', 'Perryridge', 400);
insert into account values('A-201', 'Brighton',   900);
insert into account values('A-215', 'Mianus',     700);
insert into account values('A-217', 'Brighton',   750);
insert into account values('A-222', 'Redwood',    700);
insert into account values('A-305', 'Round Hill', 350);

create table if not exists branch
(
	branch_name varchar(10) not null primary key,
	branch_city varchar(10),
	assets double
);

insert into branch values('Brighton',   'Brooklyn',    7100000);
insert into branch values('Downtown',   'Brooklyn',    9000000);
insert into branch values('Mianus',     'Horseneck',    400000);
insert into branch values('North Town', 'Rye',         3700000);
insert into branch values('Perryridge', 'Horseneck',   1700000);
insert into branch values('Pownal',     'Bennington',   300000);
insert into branch values('Redwood',    'Palo Alto',   2100000);
insert into branch values('Round Hill', 'Horseneck',   8000000);

create table if not exists customer
(
	customer_name varchar(20) not null primary key,
	customer_street varchar(20),
	customer_city varchar(10)
);

insert into customer values('Adams',    'Spring',     'Pittsfield');
insert into customer values('Brooks',   'Senator',    'Brooklyn');
insert into customer values('Curry',    'North',      'Rye');
insert into customer values('Glenn',    'Sand Hill',  'Woodside');
insert into customer values('Green',    'Walnut',     'Stamford');
insert into customer values('Hayes',    'Main',       'Harrison');
insert into customer values('Johnson',  'Alma',       'Palo Alto');
insert into customer values('Jones',    'Main',       'Harrison');
insert into customer values('Lindsay',  'Park',       'Pittsfield');
insert into customer values('Smith',    'North',      'Rye');
insert into customer values('Turner',   'Putnam',     'Stamford');
insert into customer values('Williams', 'Nassau',     'Princeton');

create table if not exists loan
(
	loan_number varchar(5) not null primary key,
	branch_name varchar(10),
	amount double
);

insert into loan values('L-11', 'Round Hill',    900);
insert into loan values('L-14', 'Downtown',     1500);
insert into loan values('L-15', 'Perryridge',   1500);
insert into loan values('L-16', 'Perryridge',   1300);
insert into loan values('L-17', 'Downtown',     1000);
insert into loan values('L-23', 'Redwood',      2000);
insert into loan values('l-93', 'Mianus',        500);

create table if not exists depositor
(
	customer_name varchar(20) not null,
	account_number char(5) not null,
	primary key(customer_name, account_number)
);

insert into depositor values('Hayes',    'A-102');
insert into depositor values('Johnson',  'A-102');
insert into depositor values('Johnson',  'A-201');
insert into depositor values('Jones',    'A-217');
insert into depositor values('Lindsay',  'A-222');
insert into depositor values('Smith',    'A-215');
insert into depositor values('Turner',   'A-305');

create table if not exists borrower
(
	customer_name varchar(20) not null,
	loan_number varchar(5) not null,
	primary key(customer_name, loan_number)
);

insert into borrower values('Adams',     'L-16');
insert into borrower values('Curry',     'L-93');
insert into borrower values('Hayes',     'L-15');
insert into borrower values('Jackson',   'L-14');
insert into borrower values('Jones',     'L-17');
insert into borrower values('Smith',     'L-11');
insert into borrower values('Smith',     'L-23');
insert into borrower values('Williams',  'L-17');


create table if not exists employee
(
	employee_name varchar(20) not null,
	branch_name varchar(10) not null,
	salary double,
	primary key(employee_name,branch_name)
);

insert into employee values('Adams',     'Perryridge',  1500);
insert into employee values('Brown',     'Perryridge',  1300);
insert into employee values('Gopal',     'Perryridge',  5300);
insert into employee values('Johnson',   'Downtown',    1500);
insert into employee values('Loreena',   'Downtown',    1300);
insert into employee values('Peterson',  'Downtown',    2500);
insert into employee values('Rao',       'Austin',      1500);
insert into employee values('Sato',      'Austin',      1600);


select * from employee;
select * from employee where branch_name="Austin";
select salary from branch where branch_name="Austin";

select employee_name, salary
from employee, branch
where employee.branch_name = branch.branch_name 
and branch_city = "Perryridge";

select * from branch;

select * from employee;
select * from loan;

select branch.branch_name = loan.branch_name, assets
from branch, loan
where branch.branch_name=loan.branch_name
and amount > 1000;
select * from loan;
select * from branch;
select * from employee;


delete from loan
where amount < 1000;
select * from loan;
