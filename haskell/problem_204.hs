-- A Hamming number is a positive number which has no prime
-- factor larger than 5. So the first few Hamming numbers
-- are 1, 2, 3, 4, 5, 6, 8, 9, 10, 12, 15. There are 1105
-- Hamming numbers not exceeding 10^8.
-- 
-- We will call a positive number a generalised Hamming
-- number of type n, if it has no prime factor larger than
-- n. Hence the Hamming numbers are the generalised Hamming
-- numbers of type 5.
-- 
-- How many generalised Hamming numbers of type 100 are
-- there which don't exceed 10^9?

module Main where

import Data.List
import ONeillPrimes

-- (#) is a merge function. It takes two nondecreasing lists
-- and returns a nondecreasing list containing all the elements
-- of both lists
(#) :: (Ord a) => [a] -> [a] -> [a]
[] # ys = ys
xs # [] = xs
xs@(x:xt) # ys@(y:yt) | x < y = x : (xt # ys)
                      | x > y = y : (xs # yt)
                      | otherwise = x : (xt # yt)

hammings :: Integral t => [t]
hammings = 1 : foldl1 (#) [map (*r) hammings | r <- takeWhile (<100) primes]

main :: IO ()
main = do print $ length $ takeWhile (<=1000000000) hammings

