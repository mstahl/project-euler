-- Find the number of integers 1 < n < 10^(7), for which n and n + 1 have the same
-- number of positive divisors. For example, 14 has the positive divisors 1, 2, 7,
-- 14 while 15 has 1, 3, 5, 15.
-- 
-- http://projecteuler.net/index.php?section=problems&id=179

module Main where

num_divisors :: (Integral a) => a -> Int
num_divisors n = 2 + length [d | d <- [2..(n `div` 2)], n `mod` d == 0]

max_n = 10 ^ 5

count_true :: [Bool] -> Int
count_true (x:xs) | x == True = 1 + count_true xs
                  | otherwise = count_true xs
count_true _ = 0

main :: IO ()
main = do let nds = map (num_divisors) [1..max_n]
          print $ count_true $ zipWith (==) nds (tail nds)