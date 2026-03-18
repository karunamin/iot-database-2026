SET @seq := 0;

SELECT (@seq:=@seq+1) "순번"
	, custid
	, name
	, phone
  FROM Customer
 where @seq < 3
 ORDER BY custid DESC;