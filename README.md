# BANKING-SQL-PROJECT
THIS IS AN DATABASE MANAGEMET PROJECT USING MYSQL 

# Banking Management System (SQL Project)

A backend simulation of a real-world banking system using MySQL. This project helps in managing customer data, bank accounts, and secure transactions such as deposits, withdrawals, and transfers. All activities are logged with transparency and data integrity.

---

## As a Developer (Fresher Role)

- Designed relational database tables with clear relationships (like Customer to Account).
- Used stored procedures to manage transactions safely without exposing raw queries.
- Implemented error handling and balance checks inside the procedures.
- Applied user-level access for secured database operations.
- Followed a clean structure to make it easy to integrate with Java or web applications.

---

## As a Tester

- Verified whether a user can only access their own account details.
- Tested invalid transaction cases (e.g., withdrawal exceeding balance).
- Checked if both the sender and receiver are logged properly in fund transfers.
- Ensured authentication (username, password, account number) is required for every action.

---

## As a Business Analyst

- Built the database to mimic realistic banking operations.
- Focused on simplicity, clarity, and easy reporting.
- Ensured all data is linked and traceable for audit or customer support use.
- Planned future extensibility for analytics and reporting.

---

## Database Overview

The system uses **3 core tables**:

### 1️ CUSTOMER Table

| Column Name      | Description                         |
|------------------|-------------------------------------|
| Customer ID      | Unique ID for each customer         |
| Customer Name    | Full name of the customer           |
| Email            | Unique email for login/identity     |
| Phone            | Contact number                      |
| Address          | Residential address of customer     |

---

### 2️ BANKACCOUNT Table

| Column Name      | Description                                 |
|------------------|---------------------------------------------|
| Account Number   | Unique bank account number                  |
| Customer ID      | Linked to CUSTOMER table                    |
| Username         | Login username for the account holder       |
| Password         | Encrypted password (stored securely)        |
| Balance          | Current available balance                   |

Each customer can hold one or more accounts. Security credentials must match for transactions.

---

### 3️ TRANSACTIONS Table

| Column Name         | Description                                                 |
|---------------------|-------------------------------------------------------------|
| Transaction ID      | Auto-generated unique transaction number                    |
| Account Number      | Whose account was involved in the transaction               |
| Date                | When the transaction occurred                               |
| Type of Transaction | DEPOSIT, WITHDRAWAL, or TRANSFER                            |
| Amount              | Exact transaction amount                                    |
| Reference Account   | (Only for TRANSFER) Indicates the receiver or sender account|

All transaction records are auto-logged for transparency.

---

##  Core Procedures Explained (Deposit, Withdraw, Transfer)

To keep sensitive operations secure, the system uses **stored procedures**:

### 🔸 1. `Deposit` Procedure

 **What It Does:**  
Adds money to an account after validating the username, password, and account number.

 **Checks Performed:**
- Matches username + password + account number.
- Increases balance.
- Records the deposit in the `transactions` table.

### 🔸 2. `Withdraw` Procedure

 **What It Does:**  
Withdraws money from an account **only** if the user has enough balance and valid credentials.

 **Checks Performed:**
- Validates login and account number.
- Ensures balance is sufficient.
- Deducts the amount.
- Records the withdrawal in the `transactions` table.

### 🔸 3. `TransferAmount` Procedure

 **What It Does:**  
Transfers money from one account to another securely.

 **Checks Performed:**
- Validates the sender's credentials.
- Confirms sufficient funds.
- Deducts from sender and adds to receiver.
- Inserts **two transaction logs**: one for sender and one for receiver, with reference to each other.

 **Note:** A new column `REFERENCEACCOUNT` helps trace the receiver or sender during transfer audits.

---

##  Sample Testing Users

| Name         | Username     | Password   | Account No | Starting Balance |
|--------------|--------------|------------|------------|------------------|
| Ravi Kumar   | Ravi Kumar   | Ravi@123   | 1          | ₹10,000.00       |
| Priya Mehta  | Priya Mehta  | Priya@456  | 2          | ₹8,000.00        |
| Anil Sharma  | Anil Sharma  | Anil@789   | 3          | ₹12,000.00       |

These accounts were used for testing deposits, withdrawals, and fund transfers.

---

##  Security & Access

- Each transaction requires:
  - Username 
  - Password 
  - Account Number 
- Unauthorized access is blocked.
- Transactions are recorded automatically, so no manual manipulation can occur.

---

##  Future Possibilities

- Add user-facing interface via Java, Python, or Web UI.
- Admin panel for account approval, balance adjustments, and oversight.
- SMS/email alerts for large or failed transactions.
- Integration with analytics dashboards (e.g., Power BI, Tableau).

---

##  Disclaimer

> **This project is for academic and demonstration purposes only.**  
> All names, balances, and credentials are fictional.  
> Please **do not use** this for real banking or storing sensitive data.

---

##  Contact

Want to contribute or collaborate?  
Open an issue or pull request on the GitHub repository. Let’s build better banking logic together!

---

