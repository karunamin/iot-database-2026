








SELECT genre FROM NewBook
 WHERE bookid = 1;

-- NewBook에 isbn을 삭제하시오
ALTER TABLE NewBook
 DROP COLUMN isbn;

-- NewBook publisher에 NOT NULL 제약조건을 추가하시오
ALTER TABLE NewBook
MODIFY publisher varchar(40) NOT NULL;

-- 기본키 추가는 alter로 거의 하지 않음
-- imported_book
ALTER TABLE NewBook 
 ADD PRIMARY key(bookid);

-- DROP
DROP TABLE OldBook;

-- 관계형 db에서는 관계를 맺고있는 부모테이블 부터 삭제할 수 없음
-- 항상 자식테이블부터 삭제 후 부모테이블 삭제할 수 있음
DROP TABLE NewOrder;
DROP TABLE NewBook;
DROP TABLE NewCustomer;

