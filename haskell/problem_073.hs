-- Consider the fraction, n/d, where n and d are positive integers. If n<d and
-- HCF(n,d)=1, it is called a reduced proper fraction.
-- 
-- If we list the set of reduced proper fractions for d ≤ 8 in ascending order
-- of size, we get:
-- 
-- 1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 2/3,
-- 5/7, 3/4, 4/5, 5/6, 6/7, 7/8
-- 
-- It can be seen that there are 3 fractions between 1/3 and 1/2.
-- 
-- How many fractions lie between 1/3 and 1/2 in the sorted set of reduced
-- proper fractions for d ≤ 12,000?
-- 
-- Note: The upper limit has been changed recently.
-- 
-- http://projecteuler.net/index.php?section=problems&id=73

module Main where

import Data.Ratio

mediant :: Integral t => Ratio t -> Ratio t -> Ratio t
mediant p q = (numerator p + numerator q) % (denominator p + denominator q)

-- Recursive function to enumerate mediants, beginning with the mediant of 1/2
-- and 1/3. The function should terminate and return zero if the denominator of
-- the mediant is greater than the maximum denominator we're looking for.
-- Otherwise, the function should be called again on the left bound, mediant,
-- and right bound. Based on the Farey sequence.
count_fractions :: Integral t => t -> Ratio t -> Ratio t -> t
count_fractions dmax a b = 
  let m = mediant a b
  in if (denominator m > dmax) then 0
     else 1 + (count_fractions dmax a m) + (count_fractions dmax m b)

main :: IO ()
main = do print $ count_fractions 12000 (1%3) (1%2)

-- Algorithm from:
-- http://www.haskell.org/haskellwiki/Euler_problems/71_to_80#Problem_73