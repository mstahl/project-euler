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

trim0s :: (Integral t) => t -> t
trim0s n = head $ filter (\x -> x `mod` 10 /= 0)
                $ iterate (\x -> x `div` 10) n

last_5_digits :: (Integral t) => t -> t
last_5_digits n = n `mod` 100000

f :: (Integral t) => t -> t
f 1 = 1
f x = foldl1 (\factorial i -> last_5_digits $ trim0s $ factorial * i) [1..x]

main :: IO ()
main = do print $ f (10^6)
