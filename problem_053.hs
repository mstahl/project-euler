-- There are exactly ten ways of selecting three from five, 12345:
-- 
-- 123, 124, 125, 134, 135, 145, 234, 235, 245, and 345
-- 
-- In combinatorics, we use the notation, ^(5)C_(3) = 10.
-- 
-- In general, ^(n)C_(r) = n! r!(n−r)! ,where r ≤ n, n! = n×(n−1)×...×3×2×1, and
-- 0! = 1.
-- 
-- It is not until n = 23, that a value exceeds one-million: ^(23)C_(10) =
-- 1144066.
-- 
-- How many, not necessarily distinct, values of ^(n)C_(r), for 1 ≤ n ≤ 100, are
-- greater than one-million?
-- 
-- http://projecteuler.net/index.php?section=problems&id=53

module Main where

factorial :: Integral t => t -> t
factorial n | n > 1 = n * factorial (n - 1)
            | otherwise = 1

choose :: Integral t => t -> t -> t
choose n k = (factorial n) `div` ((factorial k) * (factorial (n - k)))

c :: [Integer]
c = [combs | n <- [1..100]
           , k <- [1..(n - 1)]
           , let combs = n `choose` k
           , combs > 1000000
           ]

main :: IO ()
main = do print $ length c