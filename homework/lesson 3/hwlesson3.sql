-- Homework lesson 3

create database hwlesson3

create table iam_roles 
(
	db_id int primary key,
	id int not null,
	name varchar(50),
	type varchar(50),
	actions varchar(50)
)

create table iam_policies 
(
	db_id int primary key,
	id int not null,
	name varchar(50),
	type varchar(50)
)

create table iam_members 
(
	db_id int primary key,
	id int not null,
	name varchar(50)
)

create table iam_policy_members 
(
	member_id int foreign key references iam_members(db_id),
	policy_id int foreign key references iam_policies(db_id)
)

create table iam_statements 
(
	db_id int primary key,
	id int not null,
	effect varchar(50),
	actions varchar(50),
	resources varchar(50),
	policy_id int foreign key references iam_policies(db_id),
	role_id int foreign key references iam_roles(db_id)
)

create table iam_projects 
(
	db_id int primary key,
	id int not null,
	name varchar (50),
	type varchar(50)
)

create table iam_role_projects (
	role_id int foreign key references iam_roles(db_id),
	project_id int foreign key references iam_projects(db_id)
)

create table iam_statement_projects 
(
	statement_id int foreign key references iam_statements(db_id),
	project_id int foreign key references iam_projects(db_id)
)

create table iam_policy_projects 
(
	policy_id int foreign key references iam_policies(db_id),
	project_id int foreign key references iam_projects (db_id)
)

create table iam_staged_project_rules (
	db_id int primary key,
	id int not null,
	name varchar(50),
	type varchar(50),
	deleted bit,
	project_id int foreign key references iam_projects(db_id)
)

create table iam_projects_graveyard 
(
	db_id int primary key,
	id int not null
)

create table iam_project_rules 
(
	db_id int primary key,
	id int not null,
	name varchar(50),
	type varchar(50),
	project_id int foreign key references iam_projects (db_id)
)

create table iam_staged_rule_conditions 
(
	db_id int primary key,
	rule_db_id int foreign key references iam_staged_project_rules(db_id),
	value varchar(50),
	attribute varchar(50),
	operator varchar(50)
)

create table iam_rule_conditions 
(
	db_id int primary key,
	rule_db_id int foreign key references iam_project_rules (db_id),
	value varchar(50),
	attribute varchar(50),
	operator varchar(50)
)

