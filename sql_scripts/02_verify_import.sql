-- 02_verify_import.sql
-- retail banking project: verify that all csv data imported correctly

use retail_banking;
 
 
-- section 1: row count checks

select count(*) as total_branches
from branches;
-- 40
 
select count(*) as total_customers
from customers;
-- 500
 
select count(*) as total_accounts
from accounts;
-- 700
 
select count(*) as total_loans
from loans;
-- 300
 
select count(*) as total_cards
from cards;
-- 600
 
select count(*) as total_transactions
from transactions;
-- 5,000
 
select count(*) as total_loan_payments
from loan_payments;
-- 2000
 
-- peek at 5 real rows per table to confirm columns/data 
-- look correct
 
select * from branches limit 5;
select * from customers limit 5;
select * from accounts limit 5;
select * from loans limit 5;
select * from cards limit 5;
select * from transactions limit 5;
select * from loan_payments limit 5;