-- The palindromic number 595 is interesting because it can be written as the sum
-- of consecutive squares: 6^(2) + 7^(2) + 8^(2) + 9^(2) + 10^(2) + 11^(2) +
-- 12^(2).
-- 
-- There are exactly eleven palindromes below one-thousand that can be written as
-- consecutive square sums, and the sum of these palindromes is 4164. Note that 1
-- = 0^(2) + 1^(2) has not been included as this problem is concerned with the
-- squares of positive integers.
-- 
-- Find the sum of all the numbers less than 10^(8) that are both palindromic and
-- can be written as the sum of consecutive squares.
-- 
-- http://projecteuler.net/index.php?section=problems&id=125

module Main where

import Data.List (inits, tails)

(#) :: (Ord a) => [a] -> [a] -> [a]
[] # ys = ys
xs # [] = xs
xs@(x:xt) # ys@(y:yt) | x < y = x : (xt # ys)
                      | x > y = y : (xs # yt)
                      | otherwise = x : (xt # yt)

mergeAll :: (Ord a) => [[a]] -> [a]
mergeAll ([] : zs) = mergeAll zs
mergeAll (xxs@(x:xs) : yys@(y:ys) : zs)
    | x < y = x : mergeAll (xs : yys : zs)
    | otherwise = mergeAll ((xxs # yys) : zs)

square_sum :: Integral t => [t] -> t
square_sum = sum . map (^2)

digits :: Integral t => t -> [t]
digits n | n == 0 = []
         | otherwise = (n `mod` 10) : digits (n `div` 10)

is_palindrome :: Integral t => t -> Bool
is_palindrome n = m == (reverse m) where m = digits n

square_sums :: [Integer]
square_sums = mergeAll [map (square_sum) $ drop 2 $ inits [n..] | n <- [1..]]

main :: IO ()
main = do let limit = 10 ^ 8
              candidates = takeWhile (<limit)
                         $ filter (is_palindrome) square_sums
          print $ candidates
          print $ sum candidates
