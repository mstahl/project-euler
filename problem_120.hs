-- Let r be the remainder when (a−1)^(n) + (a+1)^(n) is divided by a^(2).
-- 
-- For example, if a = 7 and n = 3, then r = 42: 6^(3) + 8^(3) = 728 ≡ 42 mod 49.
-- And as n varies, so too will r, but for a = 7 it turns out that r_(max) = 42.
-- 
-- For 3 ≤ a ≤ 1000, find ∑ r_(max).
-- 
-- http://projecteuler.net/index.php?section=problems&id=120

module Main where

max_r :: Integral t => t -> t
max_r n = 2 * n * ((n - 1) `div` 2)

main :: IO ()
main = do print $ sum $ map (max_r) [3..1000]