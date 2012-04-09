-- A cyclic number with n digits has a very interesting property:
-- 
-- When it is multiplied by 1, 2, 3, 4, ... n, all the products have exactly
-- the same digits, in the same order, but rotated in a circular fashion!
-- 
-- The smallest cyclic number is the 6-digit number 142857 :
-- 
-- 142857 * 1 = 142857
-- 142857 * 2 = 285714
-- 142857 * 3 = 428571
-- 142857 * 4 = 571428
-- 142857 * 5 = 714285
-- 142857 * 6 = 857142
-- 
-- The next cyclic number is 0588235294117647 with 16 digits :
-- 
-- 0588235294117647 * 1 = 0588235294117647
-- 0588235294117647 * 2 = 1176470588235294
-- 0588235294117647 * 3 = 1764705882352941
-- ...
-- 0588235294117647 * 16 = 9411764705882352
-- 
-- Note that for cyclic numbers, leading zeros are important.
-- 
-- There is only one cyclic number for which, the eleven leftmost digits are
-- 00000000137 and the five rightmost digits are 56789 (i.e., it has the form
-- 00000000137...56789 with an unknown number of digits in the middle). Find
-- the sum of all its digits.
-- 
-- http://projecteuler.net/problem=358

module Main where

import Misc

cycles :: [a] -> [[a]]
cycles lst =
  let cycles 0 l      = [l]
      cycles i (x:xs) = (x:xs) : (cycles (i - 1) $ xs ++ [x])
  in cycles (length lst) lst

num_digits :: (Integral a, Integral b) => a -> b
num_digits 0 = 0
num_digits n = 1 + (num_digits $ n `div` 10)

test :: String -> Bool
test n = 
  let n_as_int    = (read n)::Integer
      cycles_of_n = map (\x -> (read x)::Integer) 
                  $ cycles 
                  $ n
  in all (\m -> m `elem` cycles_of_n) [i * n_as_int | i <- [1..(fromIntegral $ length n)]]

main :: IO ()
main = do print $ head $ parFilter (\x -> test ("00000000137" ++ (show x) ++ "56789")) [0..]







