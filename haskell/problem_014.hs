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

seq_length :: Integral t => t -> Int
seq_length = 
  let next n | n == 1 = Nothing
             | even n = Just(n, n `div` 2)
             | otherwise = Just(n, 3 * n + 1)
  in length . unfoldr next

main :: IO ()
main = do print $ fst $ maximumBy (\a b -> compare (snd a) (snd b))
                $ map (\n -> (n, seq_length n)) [2..999999]