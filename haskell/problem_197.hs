-- Given is the function f(x) = ⌊2^(30.403243784-x^(2))⌋ × 10^(-9) ( ⌊ ⌋ is the
-- floor-function), the sequence u_(n) is defined by u_(0) = -1 and u_(n+1) =
-- f(u_(n)).
-- 
-- Find u_(n) + u_(n+1) for n = 10^(12). Give your answer with 9 digits after
-- the decimal point.
-- 
-- http://projecteuler.net/index.php?section=problems&id=197

module Main where

import Text.Printf

f :: Double -> Double
f x = (fromIntegral $ floor $ 2 ** (30.403243784 - (x ** 2))) * (10 ** (-9))

u :: Integer -> Double
u 0 = -1.0
u n = f $ u $ n - 1

main :: IO ()
main = do let n = 10 ^ 12
              x = u n
          printf "%0.9f" $ x + (f x)