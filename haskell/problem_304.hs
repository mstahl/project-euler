-- For any positive integer n the function next_prime(n) returns the smallest
-- prime p such that p > n.
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

next_prime n = head $ dropWhile (<n) primes

fib =
  let fibs = 0 : 1 : zipWith (+) fibs (tail fibs)
  in (fibs !!)

a 1 = 10 ^ 14
a n = next_prime $ a (n - 1)

a_seq = iterate next_prime 1019

main :: IO ()
main = do print $ next_prime $ 10 ^ 14