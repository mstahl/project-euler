-- The proper divisors of a number are all the divisors excluding the number
-- itself. For example, the proper divisors of 28 are 1, 2, 4, 7, and 14. As the
-- sum of these divisors is equal to 28, we call it a perfect number.
-- 
-- Interestingly the sum of the proper divisors of 220 is 284 and the sum of the
-- proper divisors of 284 is 220, forming a chain of two numbers. For this reason,
-- 220 and 284 are called an amicable pair.
-- 
-- Perhaps less well known are longer chains. For example, starting with 12496, we
-- form a chain of five numbers:
-- 
-- 12496 → 14288 → 15472 → 14536 → 14264 (→ 12496 → ...)
-- 
-- Since this chain returns to its starting point, it is called an amicable chain.
-- 
-- Find the smallest member of the longest amicable chain with no element
-- exceeding one million.
-- 
-- http://projecteuler.net/index.php?section=problems&id=95

module Main where

import Data.List (maximumBy)
import Data.Array.Unboxed

import Sigma

-- amicable_next :: Int -> Int
amicable_next n = (sigma 1 n) - n

-- chain :: Int -> [Int]
chain n = 
  let ch sofar n0 n | n == n0 = n:sofar
                    | n > 1000000 = []
                    | n < n0 = []
                    | n `elem` sofar = []
                    | otherwise = ch (n:sofar) n0 $ amicable_next n
  in ch [] n $ amicable_next n

chain_length = length . chain

-- Chain comparison function lifted from here:
-- http://www.haskell.org/haskellwiki/Euler_problems/91_to_100#Problem_95
main :: IO ()
main = do let chains = [(n , chain_length n) | n <- [1..25000]]
              chcmp p@(a, la) q@(b, lb)
                | (la, -a) < (lb, -b) = q
                | otherwise = p
          print $ fst $ foldl1 chcmp chains