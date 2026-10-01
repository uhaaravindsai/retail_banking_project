# Sprint 4: Objective-Based Analysis
# 4.1 Understand Customer Profile and Segmentation 

# 1) Compare customers across different segments. 
select segment,count(*) as total_customers
from customers
group by segment
order by total_customers desc;

# 2) Look at customer demographics. 
select segment,gender,count(*) as total_customers
from customers
group by segment, gender
order by segment, total_customers desc;

# 3) Compare customers across cities and states. 
select state,city,count(*) as total_customers
from customers
group by state, city
order by total_customers desc;

# 4) Examine income and credit-score differences. 
select segment,count(*) as total_customers,
round(avg(annual_income), 2) as avg_annual_income,
round(avg(credit_score), 2) as avg_credit_score
from customers
group by segment
order by avg_annual_income desc;

# 5) Look at customer activity and KYC status. 
select kyc_status,is_active,count(*) as total_customers
from customers
group by kyc_status, is_active
order by kyc_status, is_active;

# 6) Understand customer tenure with the bank.
select customer_id,
concat(first_name, ' ', last_name) as customer_name,customer_since,
timestampdiff(
year,customer_since,
	(select max(transaction_date) from transactions)
    ) as tenure_years
from customers
order by tenure_years desc;


# 4.2 Understand Account Usage and Branch Activity
# 1) Compare different account types. 
select account_type,count(*) as total_accounts,
round(avg(current_balance), 2) as avg_balance
from accounts
group by account_type
order by total_accounts desc;


# 2) Compare account activity across customers. 
select c.customer_id,
concat(c.first_name, ' ', c.last_name) as customer_name,
count(a.account_id) as total_accounts
from customers c
join accounts a
on c.customer_id = a.customer_id
group by
c.customer_id,
c.first_name,
c.last_name
order by total_accounts desc;


# 3) Examine account balances. 
select account_type,
count(*) as total_accounts,
round(sum(current_balance), 2) as total_balance,
round(avg(current_balance), 2) as avg_balance,
round(min(current_balance), 2) as min_balance,
round(max(current_balance), 2) as max_balance
from accounts
group by account_type
order by total_balance desc;


# 4) Compare account activity across branches. 
select b.branch_id, b.branch_name, b.city, b.state,
count(a.account_id) as total_accounts,
round(sum(a.current_balance), 2) as total_balance
from branches b
left join accounts a
on b.branch_id = a.branch_id
group by b.branch_id, b.branch_name, b.city, b.state
order by total_accounts desc;


# 5) Look at interest rates across account types. 
select account_type,
round(avg(interest_rate), 2) as avg_interest_rate,
round(min(interest_rate), 2) as min_interest_rate,
round(max(interest_rate), 2) as max_interest_rate
from accounts
group by account_type
order by avg_interest_rate desc;


# 6) Identify differences between active and closed accounts.
select status,
count(*) as total_accounts,
round(sum(current_balance), 2) as total_balance,
round(avg(current_balance), 2) as avg_balance
from accounts
group by status
order by total_accounts desc;



# 4.3 Analyze Transaction Patterns
# 1) Compare different transaction types. 
select transaction_type,
count(*) as total_transactions,
round(sum(amount), 2) as total_amount,
round(avg(amount), 2) as avg_amount
from transactions
group by transaction_type
order by total_transactions desc;


# 2) Compare transactions across different channels. 
select channel, count(*) as total_transactions,
round(sum(amount), 2) as total_amount,
round(avg(amount), 2) as avg_amount
from transactions
group by channel
order by total_transactions desc;


# 3) Examine transaction amounts. 
select count(*) as total_transactions,
round(sum(amount), 2) as total_amount,
round(avg(amount), 2) as avg_amount,
round(min(amount), 2) as min_amount,
round(max(amount), 2) as max_amount
from transactions;


# 4) Look at common transaction descriptions. 
select description, count(*) as transaction_count,
round(sum(amount), 2) as total_amount
from transactions
group by description
order by transaction_count desc;


# 5) Examine transaction activity over time. 
select year(transaction_date) as transaction_year,
month(transaction_date) as transaction_month,
count(*) as total_transactions,
round(sum(amount), 2) as total_amount
from transactions
group by
year(transaction_date),
month(transaction_date)
order by
transaction_year,
transaction_month;


# 6) Compare transaction activity across accounts or customer groups.
select a.account_id, a.customer_id,
count(t.transaction_id) as total_transactions,
round(sum(t.amount), 2) as total_amount,
round(avg(t.amount), 2) as avg_transaction_amount
from accounts a
join transactions t
on a.account_id = t.account_id
group by
a.account_id,
a.customer_id
order by total_amount desc;

 
# 7) Look at how transaction activity affects account balances. 
select a.account_id, a.customer_id, a.current_balance,
count(t.transaction_id) as total_transactions,
round(sum(t.amount), 2) as total_transaction_amount
from accounts a
left join transactions t
on a.account_id = t.account_id
group by
a.account_id,
a.customer_id,
a.current_balance
order by total_transaction_amount desc;



# 4.4 Evaluate Loan Performance and Repayment Behaviour 
# 1) Compare different loan types. 
select loan_type, count(*) as total_loans,
round(avg(principal_amount), 2) as avg_loan_amount,
round(sum(outstanding_balance), 2) as total_outstanding_balance
from loans
group by loan_type
order by total_loans desc;


# 2) Compare loans based on their purpose. 
select purpose, count(*) as total_loans,
round(avg(principal_amount), 2) as avg_loan_amount,
round(sum(outstanding_balance), 2) as total_outstanding_balance
from loans
group by purpose
order by total_loans desc;


# 3) Examine loan amounts and outstanding balances. 
select count(*) as total_loans,
round(sum(principal_amount), 2) as total_loan_amount,
round(avg(principal_amount), 2) as avg_loan_amount,
round(sum(outstanding_balance), 2) as total_outstanding_balance,
round(avg(outstanding_balance), 2) as avg_outstanding_balance
from loans;


# 4) Compare loan statuses. 
select loan_status, count(*) as total_loans,
round(sum(principal_amount), 2) as total_loan_amount,
round(sum(outstanding_balance), 2) as total_outstanding_balance
from loans
group by loan_status
order by total_loans desc;


# 5) Identify loans with repayment delays. 
select l.loan_id, l.customer_id, l.loan_type,
count(lp.payment_id) as total_payments,
sum(case
when lp.days_late > 0 then 1
else 0
end) as late_payments,
max(lp.days_late) as max_days_late
from loans l
join loan_payments lp
on l.loan_id = lp.loan_id
group by
l.loan_id, l.customer_id, l.loan_type
having late_payments > 0
order by max_days_late desc;


# 6) Examine penalties and late payments. 
select
    count(*) as total_payments,
    sum(case
        when days_late > 0 then 1
        else 0
    end) as late_payments,
    round(sum(penalty), 2) as total_penalty,
    round(avg(penalty), 2) as avg_penalty
from loan_payments;
    


# 7) Compare repayment behaviour across loan types or branches.
select l.loan_type,
count(lp.payment_id) as total_payments,
    sum(case
        when lp.days_late > 0 then 1
        else 0
    end) as late_payments,
    round(avg(lp.days_late), 2) as avg_days_late,
    round(sum(lp.penalty), 2) as total_penalty
from loans l
join loan_payments lp
    on l.loan_id = lp.loan_id
group by l.loan_type
order by late_payments desc;

 
# 8) Look at payment methods used by customers. 
select payment_method,
count(*) as total_payments,
    sum(case
        when days_late > 0 then 1
        else 0
    end) as late_payments,
    round(sum(paid_amount), 2) as total_paid_amount,
    round(avg(paid_amount), 2) as avg_paid_amount
from loan_payments
group by payment_method
order by total_payments desc;



# 4.5 Understand Card Usage and Product Engagement 
# 1) Compare different card types.
select card_type, count(*) as total_cards,
round(avg(credit_limit), 2) as avg_credit_limit,
round(avg(outstanding_balance), 2) as avg_outstanding_balance
from cards
group by card_type
order by total_cards desc;

 
# 2) Examine credit limits and outstanding balances. 
select count(*) as total_cards,
round(sum(credit_limit), 2) as total_credit_limit,
round(avg(credit_limit), 2) as avg_credit_limit,
round(sum(outstanding_balance), 2) as total_outstanding_balance,
round(avg(outstanding_balance), 2) as avg_outstanding_balance
from cards;


# 3) Compare active and inactive cards. 
select is_active, count(*) as total_cards,
round(sum(credit_limit), 2) as total_credit_limit,
round(sum(outstanding_balance), 2) as total_outstanding_balance
from cards
group by is_active
order by total_cards desc;


# 4) Examine reward points. 
select card_type, count(*) as total_cards,
round(avg(reward_points), 2) as avg_reward_points,
sum(reward_points) as total_reward_points
from cards
group by card_type
order by avg_reward_points desc;


# 5) Compare card usage across accounts and networks. 
select
    c.network,
    c.account_id,
    count(distinct t.transaction_id) as total_transactions,
    round(sum(distinct t.amount), 2) as total_transaction_amount
from cards c
join transactions t
    on c.account_id = t.account_id
where t.status = 'completed'
group by
    c.network,
    c.account_id
order by
    total_transaction_amount desc;


# 6) Identify customers using multiple banking products. 
select c.customer_id,
concat(c.first_name, ' ', c.last_name) as customer_name,
count(distinct a.account_id) as total_accounts,
count(distinct cd.card_id) as total_cards,
count(distinct l.loan_id) as total_loans
from customers c
left join accounts a
    on c.customer_id = a.customer_id
left join cards cd
    on a.account_id = cd.account_id
left join loans l
    on c.customer_id = l.customer_id
group by c.customer_id, c.first_name, c.last_name
having
    total_accounts > 0
    and (total_cards > 0 or total_loans > 0)
order by total_accounts desc;


# 7) Look at relationships between cards, accounts, and loans.
select
    c.customer_id,
    concat(c.first_name, ' ', c.last_name) as customer_name,
    count(distinct a.account_id) as total_accounts,
    count(distinct cd.card_id) as total_cards,
    count(distinct l.loan_id) as total_loans
from customers c
left join accounts a
    on c.customer_id = a.customer_id
left join cards cd
    on a.account_id = cd.account_id
left join loans l
    on c.customer_id = l.customer_id
group by
    c.customer_id,
    c.first_name,
    c.last_name
having
    total_cards > 0
    and total_accounts > 0
order by total_cards desc;

