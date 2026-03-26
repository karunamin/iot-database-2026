-- 1번
SELECT m.member_name AS '회원명'
	 , b.book_name AS '책제목'
	 , r.rentalDate AS '대여일'
  FROM rentals r
  JOIN members m ON r.member_idx = m.member_idx 
  JOIN books b ON r.book_idx = b.book_idx
 WHERE r.returnDate  IS NULL;

-- 2번
SELECT m.member_idx AS '회원번호'
     , m.member_name AS '회원명'
     , COUNT(r.rental_idx) as '대여횟수'
  FROM members m  
  JOIN rentals r ON m.member_idx = r.member_idx 
 GROUP BY m.member_idx , m.member_name 
 ORDER BY 대여횟수 DESC, 회원명;

-- 3번
SELECT d.div_code AS '장르코드'
     , d.div_name AS '장르명'
     , COUNT(b.book_idx ) '도서수'
  FROM division d 
  LEFT JOIN books b ON d.div_code = b.div_code
  GROUP BY d.div_code , d.div_name;

-- 4번
SELECT b.book_idx AS '도서번호'
     , b.author AS '출판사'
     , b.book_name AS '책이름' 
  FROM books b
  LEFT JOIN rentals r ON r.book_idx = b.book_idx 
 WHERE r.rental_idx IS NULL;

-- 5번
SELECT m.member_idx AS '회원번호'
     , m.member_name AS '회원명'
     , count(r.rental_idx) AS '대여횟수'     
  FROM members m
  JOIN rentals r ON m.member_idx = r.member_idx
 GROUP BY m.member_idx , m.member_name 
HAVING count(r.rental_idx) > (
	SELECT AVG(cnt)
	from(
	SELECT COUNT(*) AS cnt
    FROM rentals
    GROUP BY member_idx) sub);


