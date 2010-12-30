-- For any N, let f(N) be the last five digits before the trailing zeroes in
-- N!.
-- 
-- For example,
-- 
--  9! = 362880 so f(9)=36288
--  10! = 3628800 so f(10)=36288
--  20! = 2432902008176640000 so f(20)=17664
-- 
-- Find f(1,000,000,000,000)
-- 
-- http://projecteuler.net/index.php?section=problems&id=160

module Main where

trim0s n | n < 10 = n
         | n `mod` 10 == 0 = trim0s $ n `div` 10
         | otherwise = n


main :: IO ()
main = do print $ f $ 10^12

