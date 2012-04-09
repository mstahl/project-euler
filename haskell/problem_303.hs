-- For a positive integer n, define f(n) as the least positive multiple of n
-- that, written in base 10, uses only digits ≤ 2.
-- 
-- Thus f(2)=2, f(3)=12, f(7)=21, f(42)=210, f(89)=1121222.
-- 
-- Also, .
-- 
-- Find .
-- 
-- http://projecteuler.net/index.php?section=problems&id=303

module Main where

import Misc (digits)

-- f finds f(n)/n
f :: Integral t => t -> t
f n = head $ filter (all (<=2) . digits . (*n)) [1..]

main :: IO ()
main = do print $ sum $ map f [1..10000]