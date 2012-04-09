-- An even positive integer N will be called admissible, if it is a power of 2
-- or its distinct prime factors are consecutive primes. The first twelve
-- admissible numbers are 2,4,6,8,12,16,18,24,30,32,36,48.
-- 
-- If N is admissible, the smallest integer M > 1 such that N+M is prime, will
-- be called the pseudo-Fortunate number for N.
-- 
-- For example, N=630 is admissible since it is even and its distinct prime
-- factors are the consecutive primes 2,3,5 and 7. The next prime number after
-- 631 is 641; hence, the pseudo-Fortunate number for 630 is M=11. It can also
-- be seen that the pseudo-Fortunate number for 16 is 3.
-- 
-- Find the sum of all distinct pseudo-Fortunate numbers for admissible numbers
-- N less than 10^(9).
-- 
-- http://projecteuler.net/index.php?section=problems&id=293

module Main where

isWholeNumber n = floor n == ceiling n

admissible :: Integral t => t -> Bool
admissible n = 