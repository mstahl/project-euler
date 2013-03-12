-- Working from left-to-right if no digit is exceeded by the digit to its left it
-- is called an increasing number; for example, 134468.
-- 
-- Similarly if no digit is exceeded by the digit to its right it is called a
-- decreasing number; for example, 66420.
-- 
-- We shall call a positive integer that is neither increasing nor decreasing a
-- "bouncy" number; for example, 155349.
-- 
-- As n increases, the proportion of bouncy numbers below n increases such that
-- there are only 12951 numbers below one-million that are not bouncy and only
-- 277032 non-bouncy numbers below 10^10.
-- 
-- How many numbers below a googol (10^100) are not bouncy?
--
-- http://projecteuler.net/problem=113

module Main where

import Misc (digits, count)

increasing :: Integral t => t -> Bool
increasing x = 
  let ds = digits x
  in and $ zipWith (<=) ds (tail ds)

decreasing :: Integral t => t -> Bool
decreasing x = 
  let ds = digits x
  in and $ zipWith (>=) ds (tail ds)

m = 10 ^ 6

main :: IO ()
main = do print $ (count increasing [1..m])
                + (count decreasing [1..m])
                - (count (\x -> (increasing x) && (decreasing x)) [1..m])
                - 1
