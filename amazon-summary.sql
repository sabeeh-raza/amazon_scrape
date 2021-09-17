create database amazon;
use amazon;

(
SELECT * FROM summary WHERE Product ='Laptop' ORDER BY rating DESC, review_count DESC
LIMIT 3
)
-- UNION
-- (
-- SELECT * FROM summary WHERE Product ='Laptop' ORDER BY review_count DESC LIMIT 3
-- )
UNION
(
SELECT * FROM summary WHERE Product = 'Monitor' ORDER BY rating DESC, review_count DESC
LIMIT 3
)
UNION
(
SELECT * FROM summary WHERE Product = 'Processor' ORDER BY rating DESC, review_count DESC
LIMIT 3
)
UNION
(
SELECT * FROM summary WHERE Product = 'Mouse' ORDER BY rating DESC, review_count DESC
LIMIT 3
)
UNION
(
SELECT * FROM summary WHERE Product = 'Keyboard' ORDER BY rating DESC, review_count DESC
LIMIT 3
)
UNION
(
SELECT * FROM summary WHERE Product = 'DSLR' ORDER BY rating DESC, review_count DESC
LIMIT 3
)
UNION
(
SELECT * FROM summary WHERE Product = 'Smartphone' ORDER BY rating DESC, review_count DESC
LIMIT 3
)
UNION
(
SELECT * FROM summary WHERE Product = 'Headphone' ORDER BY rating DESC, review_count DESC
LIMIT 3
)
-- UNION
-- (
-- SELECT Product, 
-- 	   AVG(rating) AS Rating_avg,
--        MIN(rating) AS Rating_min,
--        MAX(rating) AS Rating_max
-- FROM summary
-- GROUP BY Product
-- )
-- UNION
-- (
-- WITH Numbered AS 
-- (
-- SELECT Product, rating, COUNT(*) OVER (PARTITION BY Product) AS Cnt,
--     ROW_NUMBER() OVER (ORDER BY rating) AS RowNum
-- FROM summary
-- )
-- SELECT Product, rating
-- FROM Numbered
-- WHERE RowNum IN ((Cnt+1)/2, (Cnt+2)/2)
-- )
-- UNION
-- (
-- SELECT * FROM (
--   SELECT Product, rating, review_count, price,
-- 		 RANK() OVER (PARTITION BY Product ORDER BY rating DESC) AS rn  
--   FROM summary
  -- GROUP BY Product
-- ) AS t 

-- WHERE rn <= 1
-- GROUP BY Product
-- ORDER BY rating, rn
-- )