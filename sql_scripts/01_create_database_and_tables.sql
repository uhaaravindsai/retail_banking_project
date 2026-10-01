# Create DataBase
create database retail_banking;

#  Use DataBase
use retail_banking;

# Create Tables
create table branches (
branch_id varchar(10) primary key,
branch_name varchar(100) not null,
city varchar(50) not null,
state varchar(30) not null,
region varchar(30),
opening_date date,
employee_count int default 0
);


create table customers (
    customer_id varchar(20) primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    date_of_birth date,
    gender varchar(20),
    city varchar(50),
    state varchar(30),
    customer_since date,
    kyc_status varchar(20) default 'PENDING',
    segment varchar(30),
    annual_income decimal(12,2),
    credit_score int,
    is_active varchar(3) default 'YES'
);

create table accounts (
    account_id varchar(20) primary key,
    customer_id varchar(20) not null,
    branch_id varchar(10) not null,
    account_type varchar(30) not null,
    open_date date not null,
    close_date date,
    current_balance decimal(15,2) default 0,
    interest_rate decimal(5,2) default 0,
    overdraft_limit decimal(12,2) default 0,
    status varchar(20) default 'ACTIVE',
    foreign key(customer_id) references customers(customer_id),
    foreign key(branch_id) references branches(branch_id)
);


create table loans (
    loan_id varchar(20) primary key,
    customer_id varchar(20) not null,
    branch_id varchar(10) not null,
    loan_type varchar(30) not null,
    principal_amount decimal(15,2) not null,
    interest_rate decimal(5,2) not null,
    tenure_months int not null,
    disbursement_date date,
    maturity_date date,
    emi_amount decimal(12,2),
    outstanding_balance decimal(15,2) default 0,
    loan_status varchar(30) default 'ACTIVE',
    purpose varchar(50),
    foreign key(customer_id) references customers(customer_id),
    foreign key(branch_id) references branches(branch_id)
);


create table cards (
    card_id varchar(20) primary key,
    account_id varchar(20) not null,
    card_type varchar(20) not null,
    issue_date date,
    expiry_date date,
    credit_limit decimal(12,2) default 0,
    outstanding_balance decimal(12,2) default 0,
    reward_points int default 0,
    is_active varchar(3) default 'YES',
    network varchar(20),
    foreign key (account_id) references accounts(account_id)
);


create table transactions (
    transaction_id varchar(20) primary key,
    account_id varchar(20) not null,
    transaction_date  date not null,
    transaction_time time,
    transaction_type varchar(30) not null,
    amount decimal(15,2) not null,
    channel varchar(30),
    description varchar(50),
    balance_after decimal(15,2),
    status varchar(20) default 'COMPLETED',
    foreign key(account_id) references accounts(account_id)
);


create table loan_payments (
    payment_id varchar(20) primary key,
    loan_id varchar(20) not null,
    payment_date date not null,
    scheduled_amount decimal(12,2) not null,
    paid_amount decimal(12,2),
    principal_paid decimal(12,2),
    interest_paid decimal(12,2),
    penalty decimal(12,2) default 0,
    days_late int default 0,
    payment_method varchar(30),
    status varchar(20) default 'PAID',
    foreign key(loan_id) references loans(loan_id)
);