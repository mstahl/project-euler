-- For any positive integer n the function next_prime(n) returns the smallest
-- prime p such that pn.
-- 
-- The sequence a(n) is defined by: a(1)=next_prime(1014) and
-- a(n)=next_prime(a(n-1)) for n > 1.
-- 
-- The fibonacci sequence f(n) is defined by: f(0)=0, f(1)=1 and
-- f(n)=f(n-1)+f(n-2) for n > 1.
-- 
-- The sequence b(n) is defined as f(a(n)).
-- 
-- Find ∑b(n) for 1 <= n <= 100,000. Give your answer mod 1,234,567,891,011.
-- 
-- http://projecteuler.net/index.php?section=problems&id=304

module Main where

import ONeillPrimes

memoized f = 
  let memo = 
  ((map f [0..]) !!)

next_prime n = head $ dropWhile (<n) $ primes

-- addMod m a b = ((a `mod` m) + (b `mod` m)) `mod` m
-- 
-- a n | n == 1 = 2019                        -- => next_prime 1014
--     | otherwise = next_prime $ a $ n - 1
-- 
-- seq_a = 2019 : 
-- 
fib n | n == 0 = 0
      | n == 1 = 1
      | otherwise = (fib (n - 1)) + (fib (n - 2))

memfib = memoized fib

main :: IO ()
main = do print $ memfib 100