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
import Data.Array

amicable_next :: Int -> Int
amicable_next = 
  let amicable_next' m = sum [d | d <- [1..(m `div` 2)], m `mod` d == 0]
      memo_array = array (0, 999999) [(n, amicable_next' n) | n <- [0..999999]]
  in (memo_array !)

chain_length :: Int -> Int
chain_length n = 
  let chain_length' sofar m | m > 1000000 = 0
                            | m == 0 = 0
                            | m `elem` sofar = 1
                            | otherwise = 1 + (chain_length' (m:sofar) (amicable_next m))
  in chain_length' [] (amicable_next n)

main :: IO ()
main = do let chains = [(n , chain_length n) | n <- [1..999999]]
              cmp_snd = \a b -> (snd a) `compare` (snd b)
          -- mapM_ (print) chains
          print $ maximumBy (cmp_snd) chains