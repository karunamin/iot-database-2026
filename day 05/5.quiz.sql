-- 1. 각 고객의 custid와 총 구매금액을 조회하시오. 총 구매금액이 큰 고객부터 출력하시오
SELECT 
  o.custid,
  SUM(saleprice) AS "Totalprice"
FROM Orders o
GROUP BY o.custid
ORDER BY Totalprice DESC;

-- 2. 주문한 고객의 이름, 책 번호, 판매가격, 주문일자를 조회하시오
SELECT c.name, o.bookid
	 , o.saleprice, o.orderdate
  FROM Orders o
  JOIN Customer c 
    ON c.custid = o.custid
 ORDER BY o.orderdate DESC;
    
-- 3. 전체 주문의 평균 판매가보다 높은 판매가격의 주문을 조회하시오. 
--    주문번호, 고객번호, 책번호, 판매가격을 출력하시오
SELECT o.orderid, o.custid, o.bookid, o.saleprice
  FROM Orders o
 WHERE saleprice > (SELECT avg(saleprice)FROM Orders)
 ORDER BY o.saleprice DESC;
 
-- 4. 고객별 총 구매금액이 50,000원 이상인 고객의 이름과 총 구매금액을 조회하시오.
SELECT c.name, 
	   sum(saleprice) AS "TotalPrice"
  FROM Orders o
  JOIN Customer c
    ON o.custid = c.custid
 GROUP BY c.custid, c.name
HAVING TotalPrice >= 50000
 ORDER BY TotalPrice DESC;
 
-- 4.1 
SELECT c.name, t.TotalPrice
  FROM Customer c
  join(SELECT custid, sum(saleprice) AS "TotalPrice"
         FROM Orders o
        GROUP BY custid
       HAVING TotalPrice >= 50000) t
    ON t.custid = c.custid
 ORDER BY TotalPrice DESC;

-- CTE도 결과 동일
WITH order_sum AS (
	SELECT custid, sum(saleprice) AS "Total_price"
	  FROM Orders
	 GROUP BY custid
	HAVING Total_price >= 50000
)
SELECT c.name, t.Total_price 
  FROM Customer c
  JOIN order_sum t
    ON c.custid = t.custid
 ORDER BY t.Total_price DESC;
