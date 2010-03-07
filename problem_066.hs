-- Consider quadratic Diophantine equations of the form:
-- 
-- x^(2) – Dy^(2) = 1
-- 
-- For example, when D=13, the minimal solution in x is 649^(2) – 13×180^(2) = 1.
-- 
-- It can be assumed that there are no solutions in positive integers when D is
-- square.
-- 
-- By finding minimal solutions in x for D = {2, 3, 5, 6, 7}, we obtain the
-- following:
-- 
-- 3^(2) – 2×2^(2) = 1
-- 2^(2) – 3×1^(2) = 1
-- 9^(2) – 5×4^(2) = 1
-- 5^(2) – 6×2^(2) = 1
-- 8^(2) – 7×3^(2) = 1
-- 
-- Hence, by considering minimal solutions in x for D ≤ 7, the largest x is
-- obtained when D=5.
-- 
-- Find the value of D ≤ 1000 in minimal solutions of x for which the largest
-- value of x is obtained.
-- 
-- http://projecteuler.net/index.php?section=problems&id=66

module Main where

-- Algorithm somewhat lifted from:
-- http://www.maths.surrey.ac.uk/hosted-sites/R.Knott/Fibonacci/cfINTRO.html#sqrtcf
-- convergents n = 
--   let convergents' n n1 d1 = let next_n = ((floor . sqrt . fromIntegral $ n) + n1) `div` d1
--                                  n2 = d1
--                                  d2 = n1 - (d1 * next_n)
--                                  n3 = -d2
--                                  d3 = (n - (d2 ^ 2)) `div` n2
--                              in if d3 == 1 
--                                 then [next_n, (floor . sqrt . fromIntegral $ n) * 2]
--                                 else next_n : (convergents' n n3 d3)
--   in convergents' n 0 1

convergents n = 
  let convergents' n n1 d1 = let next_n = ((floor . sqrt . fromIntegral $ n) + n1) `div` d1
                                 n2 = d1
                                 d2 = n1 - (d1 * next_n)
                                 n3 = -d2
                                 d3 = (n - (d2 ^ 2)) `div` n2
                             in if d3 == 1 
                                then [(n3, d3)]
                                else (n3, d3) : (convergents' n n3 d3)
  in convergents' n 0 1




