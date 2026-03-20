-- 세션 2번
SELECT @@autocommit;

set autocommit = 0;

UPDATE accounts
   SET balance = balance - 500
 WHERE id = 2;

 SELECT * FROM accounts;