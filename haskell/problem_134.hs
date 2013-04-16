-- Consider the consecutive primes p_(1) = 19 and p_(2) = 23. It can be verified
-- that 1219 is the smallest number such that the last digits are formed by p_(1)
-- whilst also being divisible by p_(2).
-- 
-- In fact, with the exception of p_(1) = 3 and p_(2) = 5, for every pair of
-- consecutive primes, p_(2) > p_(1), there exist values of n for which the last
-- digits are formed by p_(1) and n is divisible by p_(2). Let S be the smallest
-- of these values of n.
-- 
-- Find ∑ S for every pair of consecutive primes with 5 ≤ p_(1) ≤ 1,000,000.
-- 
-- http://projecteuler.net/index.php?section=problems&id=134

module Main where

import Data.List (isSuffixOf)

import ONeillPrimes
import Text.Printf

prependWith :: Integer -> Integer -> Integer
prependWith p x = read $ (show x) ++ (show p)

s :: (Integral t, Show t) => t -> t -> t
s p q = head $ filter (\x -> (p') `isSuffixOf` (show x))
             $ iterate (+q) q
        where p' = show p

{-
 - s :: (Integral t, Show t) => t -> t -> t
 - s p q = head $ filter (\x -> x `mod` q == 0)
 -              $ map (prependWith p) [1..]
 -}

main :: IO ()
main = do let problem_size = 10 ^ 6
              myprimes = drop 2 $ primesToLimit problem_size
              s_values = zipWith (s) myprimes (drop 3 primes)
          mapM_ print s_values
          print $ sum s_values
