-- A positive fraction whose numerator is less than its denominator is called a
-- proper fraction. For any denominator, d, there will be d−1 proper fractions;
-- for example, with d = 12: 1/12, 2/12, 3/12, 4/12, 5/12, 6/12, 7/12, 8/12, 9/12,
-- 10/12, 11/12.
-- 
-- We shall call a fraction that cannot be cancelled down a resilient fraction.
-- Furthermore we shall define the resilience of a denominator, R(d), to be the
-- ratio of its proper fractions that are resilient; for example, R(12) = 4/11 .
-- In fact, d = 12 is the smallest denominator having a resilience R(d) < 4/10 .
-- 
-- Find the smallest denominator d, having a resilience R(d) < 15499/94744.
-- 
-- http://projecteuler.net/index.php?section=problems&id=243

module Main where

import Totient
import Ratio
import ONeillPrimes (composites)

resilience :: Integral t => t -> Ratio t
resilience d = (totient d) % (d - 1)

main :: IO ()
main = do print $ fst 
                $ head 
                $ dropWhile (\(_, r) -> r >= 15499 % 94744)
                $ [(d, resilience d) | d <- drop 1 composites]