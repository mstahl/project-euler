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

import Ratio

perfect_square :: Integral t => t -> Bool
perfect_square n = q * q == n where q = floor . sqrt . fromIntegral $ n

split :: [(a, b)] -> ([a], [b])
split l = (map (fst) l, map (snd) l)

square_root_convergents n h k = 
  let m  = ((floor . sqrt . fromIntegral $ n) + h) `div` k
      h' = (m * k) - h
      k' = ((n - (h ^ 2)) `div` k) + (2 * m * h) - ((m ^ 2) * k)
  in m : square_root_convergents n h' k'
continued_fraction n = 
  let m2 = 2 * (floor . sqrt . fromIntegral $ n)
  in takeWhile (/=m2) $ square_root_convergents n 0 1

-- solution :: Integral t => t -> (t, t)
solution n = if (odd r) then (p !! r, q !! r) else (p !! ((2 * r) + 1), q !! ((2 * r) + 1))
  where a = square_root_convergents n 0 1
        r = (length $ takeWhile (/=(2 * (head a))) a) - 1
        p = (floor . sqrt . fromIntegral $ n) : (((a !! 0) * (a !! 1)) + 1) : zipWith3 (\an pn1 pn2 -> an * pn1 + pn2) (drop 2 a) (tail p) p
        q = 1 : (head a) : zipWith3 (\an qn1 qn2 -> an * qn1 + qn2) (drop 2 a) (tail q) q

