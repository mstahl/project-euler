-- The sum of the squares of the first ten natural numbers is,
-- 
-- 1^(2) + 2^(2) + ... + 10^(2) = 385
-- 
-- The square of the sum of the first ten natural numbers is, 
-- (1 + 2 + ... + 10)^(2) = 55^(2) = 3025
-- 
-- Hence the difference between the sum of the squares of the first ten natural
-- numbers and the square of the sum is 3025 − 385 = 2640.
-- 
-- Find the difference between the sum of the squares of the first one hundred
-- natural numbers and the square of the sum.
-- 
-- http://projecteuler.net/index.php?section=problems&id=6

module Main where

sum_of_squares :: Integral t => t -> t
sum_of_squares n = sum [i * i | i <- [1..n]]

square_of_sum :: Integral t => t -> t
square_of_sum n = (sum [1..n]) ^ 2

main :: IO ()
main = do print $ abs $ (sum_of_squares 100) - (square_of_sum 100)
