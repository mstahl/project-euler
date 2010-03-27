-- n! means n × (n − 1) × ... × 3 × 2 × 1
-- 
-- Find the sum of the digits in the number 100!
-- 
-- http://projecteuler.net/index.php?section=problems&id=20

module Main where

f :: Integral t => t -> t
f n | n < 2 = 1
    | otherwise = n * (f (n - 1))

digits :: Integral t => t -> [t]
digits n
  | n < 10 = [n]
  | otherwise = y:digits x 
  where
    (x, y) = divMod n 10

main :: IO ()
main = do print $ sum $ digits $ f 100