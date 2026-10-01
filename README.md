# Retail Banking Transaction Analysis

## 📌 Project Overview

Retail Banking Transaction Analysis is a MySQL Business Analytics project focused on analyzing customer profiles, bank accounts, transactions, loans, loan repayments, branches, and card usage.

The project follows a complete data analytics workflow:

**Business Understanding → Database Design → Data Import → SQL Analysis → Business Insights**

The analysis uses MySQL to answer business questions and understand banking activity.

---

## 🎯 Project Objectives

- Understand the retail banking business and data model
- Design and create a relational database using MySQL
- Import and verify banking datasets
- Perform basic data exploration using SQL
- Analyze customer profiles and segments
- Analyze account usage and branch activity
- Identify transaction patterns
- Evaluate loan performance and repayment behavior
- Analyze card usage and product engagement
- Generate meaningful business insights using SQL

---

## 🗂️ Database Tables

The project contains 7 main tables:

| Table | Rows | Description |
|---|---:|---|
| `customers` | 500 | Customer information |
| `accounts` | 700 | Bank account information |
| `branches` | 40 | Branch information |
| `loans` | 300 | Customer loan information |
| `loan_payments` | 2,000 | Loan repayment information |
| `cards` | 600 | Card information |
| `transactions` | 5,000 | Banking transaction information |

---

## 🛠️ Tools & Technologies

- MySQL
- MySQL Workbench
- SQL
- CSV
- Relational Database Concepts
- ER Diagram
- Data Analysis

---

## 📁 Project Structure

```text
retail_banking_project/
│
├── README.md
│
├── Data/
│   ├── accounts.csv
│   ├── branches.csv
│   ├── cards.csv
│   ├── customers.csv
│   ├── loan_payments.csv
│   ├── loans.csv
│   └── transactions.csv
│
└── sql_scripts/
    ├── 01_create_database_and_tables.sql
    ├── 02_verify_import.sql
    ├── 03_sprint3_basic_queries.sql
    └── 04_sprint4_objective_queries.sql
```

---

## 🔄 Project Workflow

### Sprint 1 — Business & Data Understanding

- Understanding the retail banking business
- Understanding the role of a Data Analyst
- Studying the ER diagram
- Identifying tables, columns, primary keys, foreign keys, and relationships
- Planning analytical approaches before writing SQL queries

### Sprint 2 — Database Setup

- Created the MySQL database
- Created tables based on the ER diagram
- Defined primary and foreign keys
- Applied appropriate constraints
- Imported CSV datasets
- Verified the imported data

### Sprint 3 — Basic Data Exploration

Performed SQL analysis to determine:

- Total number of customers
- Total number of accounts
- Available account types
- Active customers
- Available transaction types
- Total amount of completed transactions
- Available loan types
- Total number of loans
- Available card types
- Total outstanding loan balance

### Sprint 4 — Objective-Based Analysis

#### 1. Customer Profile & Segmentation

Analyzed:

- Customer segments
- Customer demographics
- Cities and states
- Income
- Credit scores
- Customer activity
- KYC status
- Customer tenure

#### 2. Account Usage & Branch Activity

Analyzed:

- Account types
- Account activity
- Account balances
- Branch-level activity
- Interest rates
- Active and closed accounts

#### 3. Transaction Patterns

Analyzed:

- Transaction types
- Transaction channels
- Transaction amounts
- Transaction descriptions
- Transaction activity over time
- Account and customer transaction activity
- Relationship between transactions and account balances

#### 4. Loan Performance & Repayment Behaviour

Analyzed:

- Loan types
- Loan purposes
- Loan amounts
- Outstanding balances
- Loan statuses
- Repayment delays
- Late payments
- Penalties
- Repayment behavior
- Payment methods

#### 5. Card Usage & Product Engagement

Analyzed:

- Card types
- Credit limits
- Outstanding balances
- Active and inactive cards
- Reward points
- Card networks
- Card usage across accounts
- Customers using multiple banking products

---

## 💻 SQL Analysis

The `sql_scripts` folder contains the complete SQL analysis.

### `01_create_database_and_tables.sql`

Creates the MySQL database and tables based on the provided ER diagram.

- Creates the database
- Creates required tables
- Defines primary keys
- Defines foreign keys
- Applies appropriate constraints

### `02_verify_import.sql`

Verifies the imported banking datasets.

- Checks whether the data was loaded correctly
- Verifies table records
- Validates imported data

### `03_sprint3_basic_queries.sql`

Contains SQL queries for basic data exploration.

The queries analyze:

- Customer counts
- Account counts
- Account types
- Active customers
- Transaction types
- Completed transaction amounts
- Loan types
- Loan counts
- Card types
- Outstanding loan balances

### `04_sprint4_objective_queries.sql`

Contains SQL queries for objective-based business analysis.

The analysis covers:

- Customer profile and segmentation
- Account usage and branch activity
- Transaction patterns
- Loan performance and repayment behaviour
- Card usage and product engagement

---

## 📊 Key Skills Demonstrated

### SQL & Database Skills

- SQL querying
- Database creation
- Relational database design
- Primary keys
- Foreign keys
- Constraints
- Table relationships
- Data validation
- Data import

### Data Analysis Skills

- Data exploration
- Aggregation
- Filtering
- Grouping
- Sorting
- Joins
- Transaction analysis
- Customer segmentation
- Loan analysis
- Account analysis
- Card usage analysis

### Business & Analytical Skills

- Business-oriented analytical thinking
- Understanding business requirements
- Translating business requirements into SQL queries
- Formulating analytical questions
- Interpreting analytical results
- Identifying meaningful business insights
- Communicating data-driven findings

---

## 📈 Project Outcome

This project demonstrates the ability to move from a **business requirement to a data-driven answer** through a structured analytics workflow.

The project covers:

1. Understanding the business problem
2. Understanding the data model
3. Interpreting the ER diagram
4. Designing a relational database
5. Creating tables in MySQL
6. Importing and validating data
7. Formulating analytical questions
8. Writing SQL queries
9. Performing objective-based analysis
10. Interpreting analytical results
11. Identifying meaningful business insights
12. Communicating data-driven findings

The project demonstrates practical experience in using **MySQL and SQL for business analytics and relational data analysis**.

---

## 👨‍💻 Author

**Potla Uhaaravindsai**

B.Tech — Information Technology

**Skills:** Python | SQL | MySQL | Data Analysis | Power BI | Git | GitHub