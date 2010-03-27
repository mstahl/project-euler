-- Consider the consecutive primes p_(1) = 19 and p_(2) = 23. It can be verified
-- that 1219 is the smallest number such that the last digits are formed by p_(1)
-- whilst also being divisible by p_(2).
-- 
-- In fact, with the exception of p_(1) = 3 and p_(2) = 5, for every pair of
-- consecutive primes, p_(2) > p_(1), there exist values of n for which the last
-- digits are formed by p_(1) and n is divisible by p_(2). Let S be the smallest
-- of these values of n.
-- 
-- Find ∑ S for every pair of consecutive primes with 5 ≤ p_(1) ≤ 1000000.
-- 
-- http://projecteuler.net/index.php?section=problems&id=134

module Main where

import Control.Parallel
import Control.Parallel.Strategies

import ONeillPrimes

consecutives = takeWhile ((<1000000) . fst) $ drop 2 $ zip primes (tail primes)

num_digits n = length $ show n

ilength :: Integral b => [a] -> b
ilength [] = 0
ilength (_:xs) = 1 + (ilength xs)

s (p1, p2) = p2 * p3
             where p3 = (+) 1 $ ilength $ takeWhile ((/=)p1)
                              $ iterate (\n -> (n + p2) `mod` (10 ^ (num_digits p1))) p2

answers = parMap rwhnf (s) consecutives

-- main :: IO ()
-- main = do let answers' = zip consecutives answers
--           mapM_ (print) answers'
--           print $ sum answers

main :: IO ()
main = do print $ sum answers