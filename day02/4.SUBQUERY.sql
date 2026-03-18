-- 가장비싼 도서를 이름을 조회하세요
SELECT b.bookname 
  FROM Book b
 WHERE b.price >= (SELECT max(price)
                     FROM Book);

