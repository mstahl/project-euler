-- The binomial coefficients ^(n)C_(k) can be arranged in triangular form,
-- Pascal's triangle.
-- 
-- It can be seen that the first eight rows of Pascal's triangle contain twelve
-- distinct numbers: 1, 2, 3, 4, 5, 6, 7, 10, 15, 20, 21 and 35.
-- 
-- A positive integer n is called squarefree if no square of a prime divides n. Of
-- the twelve distinct numbers in the first eight rows of Pascal's triangle, all
-- except 4 and 20 are squarefree. The sum of the distinct squarefree numbers in
-- the first eight rows is 105.
-- 
-- Find the sum of the distinct squarefree numbers in the first 51 rows of
-- Pascal's triangle.
-- 
-- http://projecteuler.net/index.php?section=problems&id=203

module Main where

import Data.List

fact :: Integral t => t -> t
fact n | n < 2 = 1
       | otherwise = n * fact (n - 1)

choose :: Integral t => t -> t -> t
choose n r = (fact n) `div` ((fact r) * (fact (n - r)))

squarefree :: Integral t => t -> Bool
squarefree n = not $ any (\d -> n `mod` d == 0) $ takeWhile (<=n) [x ^ 2 | x <- [2..]]

main = do let triangle = filter (squarefree) 
                       $ nub 
                       $ concatMap (\n -> map (\x -> (choose n x)) [0..n]) [1..50]
          print $ sum triangle