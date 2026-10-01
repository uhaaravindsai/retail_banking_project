# Sprint 3: Basic Analysis / Data Exploration

use retail_banking;

# 11. Total number of customers
select count(*) as total_customers
from customers;

# 12. Total number of accounts
select count(*) as total_accounts
from accounts;

# 13. Different account types available
select distinct account_type
from accounts;

# 14. How many customers are currently active
select count(*) as active_customers
from customers
where is_active = 'YES';

# 15. Different transaction types available
select distinct transaction_type
from transactions;

# 16. Total amount of completed transactions
select sum(amount) as total_completed_amount
from transactions
where status = 'COMPLETED';

# 17. Different loan types available
select distinct loan_type
from loans;

# 18. Total number of loans
select count(*) as total_loans
from loans;

# 19. Different card types available
select distinct card_type
from cards;

# 20. Total outstanding loan balance
select sum(outstanding_balance) as total_outstanding_balance
from loans;