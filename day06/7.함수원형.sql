-- 함수원형 fnc_Interest
CREATE FUNCTION madangdb.fnc_Interest(
	price INTEGER
)
RETURNS INT
BEGIN
	DECLARE myInterest INTEGER;
	-- 가격이 30,000원 이상이면 10%, 그 미만은 5% 이윤남김

	IF price >= 30000 THEN
		SET myInterest = price * 0.1;
	ELSE
		SET myInterest = price * 0.05;
	END IF;

	RETURN myInterest;
END

-- 함수원형 fnc_balanceGrade
CREATE FUNCTION madangdb.fnc_balanceGrade(
	balance INTEGER
)
RETURNS varchar(20)
deterministic
BEGIN
	declare grade varchar(20);

	if balance >= 50000 then
		set grade = 'VIP';
	elseif balance >= 20000 THEN
		SET grade = 'GOLD';
	ELSE
		SET grade = 'SILVER';
	END IF;
	
	RETURN grade;
END