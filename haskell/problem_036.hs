-- The decimal number, 585 = 1001001001_(2) (binary), is palindromic in both
-- bases.
-- 
-- Find the sum of all numbers, less than one million, which are palindromic in
-- base 10 and base 2.
-- 
-- (Please note that the palindromic number, in either base, may not include
-- leading zeros.)
-- 
-- http://projecteuler.net/index.php?section=problems&id=36

module Main where

import Misc (digits)

bindigits n | n == 0 = []
            | otherwise = r : bindigits q
                          where
                          (q, r) = divMod n 2

palindrome l = r == l where r = reverse l

test n = (palindrome $ digits n) && (palindrome $ bindigits n)

main :: IO ()
main = do let answers = filter (test) [1..999999]
          -- mapM_ print answers
          -- putStrLn "------"
          print $ sum answers