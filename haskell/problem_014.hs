-- The following iterative sequence is defined for the set of positive integers:
-- 
-- n → n/2 (n is even)
-- n → 3n + 1 (n is odd)
-- 
-- Using the rule above and starting with 13, we generate the following sequence:
-- 
-- 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
-- 
-- It can be seen that this sequence (starting at 13 and finishing at 1) contains
-- 10 terms. Although it has not been proved yet (Collatz Problem), it is thought
-- that all starting numbers finish at 1.
-- 
-- Which starting number, under one million, produces the longest chain?
-- 
-- NOTE: Once the chain starts the terms are allowed to go above one million.
-- 
-- http://projecteuler.net/index.php?section=problems&id=14

module Main where

import Data.List

sequence_from :: Integral t => t -> [t]
sequence_from n | n == 1 = [1]
                | even n = n : sequence_from (n `div` 2)
                | otherwise = n : sequence_from (3 * n + 1)

main :: IO ()
main = do let lengths = map (\n -> (n, (length . sequence_from) n)) [1..999999]
          print $ fst $ maximumBy (\a b -> (snd a) `compare` (snd b)) lengths