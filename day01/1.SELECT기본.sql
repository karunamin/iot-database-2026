use madangdb;

-- 한글이 나눔고딕으로 출력됨
-- 일반 조회 쿼리
SELECT * FROM Book;

-- 1. 김연아 고객의 전화를 찾으시오
select phone from Customer
 where name = '김연아';
 
-- 한줄 주석
/* 여러줄 
   주석 */   
-- 모든 쿼리의 마지막은 ; 으로 끝냄. ;은 옵션이지만 무조건 사용권장
SELECT * FROM Book;

-- 테이블에서 가져오는 데이터가 아니면 FROM 절 생략
SELECT NOW();

-- 열 명시
SELECT bookname, price
   FROM Book;
