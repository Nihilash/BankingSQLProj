-- View to show limited customer summary securely
CREATE VIEW CustomerAccountSummary AS
SELECT 
    c.Name AS CustomerName,
    b.ACCOUNT_NO,
    b.ACCOUNT_TYPE,
    b.BALANCE
FROM 
    Customer c
JOIN 
    BANKACCOUNT b ON c.Id = b.CUSTOMER_ID;

-- Grant access to customer role
GRANT SELECT ON banking.CustomerAccountSummary TO 'cust_user'@'localhost';
GRANT EXECUTE ON PROCEDURE GetSecureAccountSummary TO 'cust_user'@'localhost';
GRANT EXECUTE ON PROCEDURE DEPOSITE TO 'cust_user'@'localhost';
GRANT EXECUTE ON PROCEDURE Withdraw TO 'cust_user'@'localhost';
GRANT EXECUTE ON PROCEDURE TransferAmount TO 'cust_user'@'localhost';

-- Optional: Revoke access from others if necessary
-- REVOKE ALL PRIVILEGES ON banking.* FROM 'unauthorized_user'@'localhost';
