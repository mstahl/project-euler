-- Consider the consecutive primes p_(1) = 19 and p_(2) = 23. It can be verified
-- that 1219 is the smallest number such that the last digits are formed by p_(1)
-- whilst also being divisible by p_(2).
-- 
-- In fact, with the exception of p_(1) = 3 and p_(2) = 5, for every pair of
-- consecutive primes, p_(2) > p_(1), there exist values of n for which the last
-- digits are formed by p_(1) and n is divisible by p_(2). Let S be the smallest
-- of these values of n.
-- 
-- Find ∑ S for every pair of consecutive primes with 5 ≤ p_(1) ≤ 10^6.
-- 
-- http://projecteuler.net/index.php?section=problems&id=134

module Main where

import Data.List (isSuffixOf)

import ONeillPrimes
import Text.Printf

myprimes = drop 2 $ primesToLimit (10 ^ 5)

num_digits :: (Show t) => t -> Int
num_digits = length . show

s p1 p2 = head $ dropWhile (\x -> not $ isSuffixOf (show p1) (show x)) 
               $ iterate (+p2) (p2 * (p2 `div` p1))

answers = zipWith s (myprimes) (tail myprimes)

main :: IO ()
main = do print $ length myprimes
          mapM_ (print) answers
          putStrLn "------------------------------"
          print $ sum answers
