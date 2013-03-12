-- The Fibonacci sequence is defined by the recurrence relation:
-- 
-- Fn = Fn1 + Fn2, where F1 = 1 and F2 = 1.
-- 
-- It turns out that F541, which contains 113 digits, is the first Fibonacci
-- number for which the last nine digits are 1-9 pandigital (contain all the
-- digits 1 to 9, but not necessarily in order). And F2749, which contains 575
-- digits, is the first Fibonacci number for which the first nine digits are
-- 1-9 pandigital.
-- 
-- Given that Fk is the first Fibonacci number for which the first nine digits
-- AND the last nine digits are 1-9 pandigital, find k.
--
-- http://projecteuler.net/problem=104

module Main where

import Data.List ((\\), sort)

import MillerRabin

fibs :: [Integer]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

pandigital :: String -> Bool
pandigital s = (sort s) == ['1'..'9']

first_nine_pandigital :: Integer -> Bool
first_nine_pandigital n = 
  let n' = show n
  in pandigital (take 9 n')

last_nine_pandigital :: Integer -> Bool
last_nine_pandigital n = 
  let n' = reverse $ show n
  in pandigital (take 9 n')

main :: IO ()
main = do print $ length $ takeUntil (\f -> (first_nine_pandigital f) && (last_nine_pandigital f)) fibs
