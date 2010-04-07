-- 2^(15) = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
-- 
-- What is the sum of the digits of the number 2^(1000)?
-- 
-- http://projecteuler.net/index.php?section=problems&id=16

module Main where

digits :: Integral t => t -> [t]
digits n
  | n < 10 = [n]
  | otherwise = y:digits x 
  where
    (x, y) = divMod n 10

main :: IO ()
main = do print $ sum $ digits $ 2 ^ 1000