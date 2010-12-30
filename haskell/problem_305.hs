-- Let's call S the (infinite) string that is made by concatenating the
-- consecutive positive integers (starting from 1) written down in base 10.
-- 
-- Thus, S = 1234567891011121314151617181920212223242...
-- 
-- It's easy to see that any number will show up an infinite number of times in
-- S.
-- 
-- Let's call f(n) the starting position of the n^(th) occurrence of n in S.
-- 
-- For example, f(1)=1, f(5)=81, f(12)=271 and f(7780)=111111365.
-- 
-- Find ∑f(3^(k)) for 1≤k≤13.
-- 
-- http://projecteuler.net/index.php?section=problems&id=305

module Main where

import List (isPrefixOf)

concats = concatMap (show) [1..]

findOccurrence i n str@(x:xs) | (show n) `isPrefixOf` str = if i == 0 
                                                            then 0
                                                            else 1 + findOccurrence (i - 1) n xs
                              | otherwise = 1 + findOccurrence i n xs

f n = findOccurrence n n concats

main :: IO ()
main = do putStrLn $ take 10000 concats
          print $ f 1
          print $ f 5
          print $ f 12
          print $ f 7780