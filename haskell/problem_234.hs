-- For an integer n ≥ 4, we define the lower prime square root of n, denoted by
-- lps(n), as the largest prime ≤ √n and the upper prime square root of n, ups(n),
-- as the smallest prime ≥ √n.
-- 
-- So, for example, lps(4) = 2 = ups(4), lps(1000) = 31, ups(1000) = 37. Let us
-- call an integer n ≥ 4 semidivisible, if one of lps(n) and ups(n) divides n, but
-- not both.
-- 
-- The sum of the semidivisible numbers not exceeding 15 is 30, the numbers are 8,
-- 10 and 12. 15 is not semidivisible because it is a multiple of both lps(15) = 3
-- and ups(15) = 5. As a further example, the sum of the 92 semidivisible numbers
-- up to 1000 is 34825.
-- 
-- What is the sum of all semidivisible numbers not exceeding 999966663333 ?
-- 
-- http://projecteuler.net/index.php?section=problems&id=234

module Main where

import ONeillPrimes

count (p:q:xs) = 
  let n = p ^ 2
      m = q ^ 2
      ps = [x | x <- [n,(n+p)..m], x `mod` q /= 0]
      qs = [y | y <- [m,(m-q)..n], y `mod` p /= 0]
  in (length ps) + (length qs) + (count (q:xs))
count _ = 0

main :: IO ()
main = do print $ count $ takeWhile (<=37) primes
