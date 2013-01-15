-- An irrational decimal fraction is created by concatenating the positive
-- integers:
-- 
-- 0.123456789101112131415161718192021...
-- 
-- It can be seen that the 12th digit of the fractional part is 1.
-- 
-- If dn represents the nth digit of the fractional part, find the value of the
-- following expression.
-- 
-- d1 x d10 x d100 x d1000 x d10000 x d100000 x d1000000

module Main where

import Misc

champernowne :: [Int]
champernowne = concatMap digits [0..]

main :: IO ()
main = do print $ product [ champernowne !! 1
                          , champernowne !! 10
                          , champernowne !! 100
                          , champernowne !! 1000
                          , champernowne !! 10000
                          , champernowne !! 100000
                          , champernowne !! 1000000
                          ]
