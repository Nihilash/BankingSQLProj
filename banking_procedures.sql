-- stored procedures
-- stored procedure for deposite
DEPOSITE Procedure
DELIMITER //
CREATE PROCEDURE DEPOSITE (
    IN uname VARCHAR(100),
    IN pass VARCHAR(100),
    IN accNo INT,
    IN amt DECIMAL(30,5)
)
BEGIN
    UPDATE BANKACCOUNT
    SET BALANCE = BALANCE + amt
    WHERE ACCOUNT_NO = accNo;

    INSERT INTO TRANSACTIONS (ACCOUNTNO, TYPEOFTRANSACTION, AMOUNT)
    VALUES (accNo, 'DEPOSITS', amt);
END //
DELIMITER ;

-- stored procedure for transactions
DELIMITER //
CREATE PROCEDURE Withdraw (
    IN uname VARCHAR(100),
    IN pass VARCHAR(100),
    IN accNo INT,
    IN amt DECIMAL(30,5)
)
BEGIN
    DECLARE current_balance DECIMAL(30,5);

    SELECT BALANCE INTO current_balance
    FROM BANKACCOUNT
    WHERE ACCOUNT_NO = accNo;

    IF current_balance >= amt THEN
        UPDATE BANKACCOUNT
        SET BALANCE = BALANCE - amt
        WHERE ACCOUNT_NO = accNo;

        INSERT INTO TRANSACTIONS (ACCOUNTNO, TYPEOFTRANSACTION, AMOUNT)
        VALUES (accNo, 'WITHDRAW', amt);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient balance for withdrawal';
    END IF;
END //
DELIMITER ;

-- stored procedures for transactions
DELIMITER //
CREATE PROCEDURE TransferAmount (
    IN uname VARCHAR(100),
    IN pass VARCHAR(100),
    IN fromAcc INT,
    IN toAcc INT,
    IN amt DECIMAL(30,5)
)
BEGIN
    DECLARE from_balance DECIMAL(30,5);

    SELECT BALANCE INTO from_balance
    FROM BANKACCOUNT
    WHERE ACCOUNT_NO = fromAcc;

    IF from_balance >= amt THEN
        -- Deduct from sender
        UPDATE BANKACCOUNT
        SET BALANCE = BALANCE - amt
        WHERE ACCOUNT_NO = fromAcc;

        -- Add to receiver
        UPDATE BANKACCOUNT
        SET BALANCE = BALANCE + amt
        WHERE ACCOUNT_NO = toAcc;

        -- Log sender transaction
        INSERT INTO TRANSACTIONS (ACCOUNTNO, TYPEOFTRANSACTION, AMOUNT, TRANSFER_TO_ACCOUNT)
        VALUES (fromAcc, 'TRANSFERS', amt, toAcc);

        -- Log receiver transaction
        INSERT INTO TRANSACTIONS (ACCOUNTNO, TYPEOFTRANSACTION, AMOUNT, REFERENCEACCOUNT)
        VALUES (toAcc, 'DEPOSITS', amt, fromAcc);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient funds for transfer';
    END IF;
END //
DELIMITER ;