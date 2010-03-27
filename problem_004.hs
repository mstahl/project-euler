-- A palindromic number reads the same both ways. The largest palindrome made from
-- the product of two 2-digit numbers is 9009 = 91 × 99.
-- 
-- Find the largest palindrome made from the product of two 3-digit numbers.
-- 
-- http://projecteuler.net/index.php?section=problems&id=4

module Main where

digits :: Integral t => t -> [t]
digits n
  | n < 10 = [n]
  | otherwise = y:digits x 
  where
    (x, y) = divMod n 10

palindrome :: Integral t => t -> Bool
palindrome n = d == (reverse d) where d = digits n

products :: Integral t => [t]
products = [x * y | x <- [100..999], y <- [100..x]]

main :: IO ()
main = do print $ maximum $ filter (palindrome) products