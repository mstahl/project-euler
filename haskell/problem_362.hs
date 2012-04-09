-- Consider the number 54. 54 can be factored in 7 distinct ways into one or
-- more factors larger than 1:
-- 
-- 54, 2 * 27, 3 * 18, 6 * 9, 3 * 3 * 6, 2 * 3 * 9 and 2 * 3 * 3 * 3.
-- 
-- If we require that the factors are all squarefree only two ways remain: 3 * 3 * 6
-- and 2 * 3 * 3 * 3.
-- 
-- Let's call Fsf(n) the number of ways n can be factored into one or more
-- squarefree factors larger than 1, so Fsf(54)=2.
-- 
-- Let S(n) be Fsf(k) for k=2 to n.
-- 
-- S(100)=193.
-- 
-- Find S(10 000 000 000).
-- 
-- http://projecteuler.net/problem=362

module Main where

-- prime_factors :: Integral t => t -> [t]
-- prime_factors n = factor n primes
--   where factor n (p:ps) | p > n = []
--                         | n `mod` p /= 0 = factor n ps
--                         | otherwise = p : factor (n `div` p) (p:ps)



factors_squarefree n = factor n squarefree
  where factor n (p:ps) | p > n = []
                        | n `mod` p /= 0 = factor n ps
                        | otherwise = p : factor (n `div` p) (p:ps)

