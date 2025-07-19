-- Insert Customers
INSERT INTO Customer (Id, Name, Password)
VALUES 
(1, 'Ravi Kumar', 'Ravi@123'),
(2, 'Priya Mehta', 'Priya@456'),
(3, 'Anil Sharma', 'Anil@789');

-- Insert Bank Accounts
INSERT INTO BankAccount (ACCOUNT_NO, CUSTOMER_ID, ACCOUNT_TYPE, BALANCE)
VALUES 
(1, 1, 'Savings', 15000.00),
(2, 2, 'Current', 20000.00),
(3, 3, 'Savings', 10000.00);

-- Insert Transactions (Sample Data)
INSERT INTO Transactions (ACCOUNTNO, TYPEOFTRANSACTION, AMOUNT, REFERENCEACCOUNT)
VALUES 
(1, 'DEPOSITS', 5000.00, NULL),
(1, 'WITHDRAW', 1000.00, NULL),
(1, 'TRANSFERS', 2000.00, 2),
(2, 'DEPOSITS', 3000.00, NULL),
(3, 'WITHDRAW', 500.00, NULL);
