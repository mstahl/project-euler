-- The proper divisors of a number are all the divisors excluding the number
-- itself. For example, the proper divisors of 28 are 1, 2, 4, 7, and 14. As the
-- sum of these divisors is equal to 28, we call it a perfect number.
-- 
-- Interestingly the sum of the proper divisors of 220 is 284 and the sum of the
-- proper divisors of 284 is 220, forming a chain of two numbers. For this reason,
-- 220 and 284 are called an amicable pair.
-- 
-- Perhaps less well known are longer chains. For example, starting with 12496, we
-- form a chain of five numbers:
-- 
-- 12496 → 14288 → 15472 → 14536 → 14264 (→ 12496 → ...)
-- 
-- Since this chain returns to its starting point, it is called an amicable chain.
-- 
-- Find the smallest member of the longest amicable chain with no element
-- exceeding one million.
-- 
-- http://projecteuler.net/index.php?section=problems&id=95

module Main where

amicable_next :: Int -> Int
amicable_next m = sum [d | d <- [1..(m `div` 2)], m `mod` d == 0]

amicable_chain :: Int -> [Int]
amicable_chain m = m : (takeWhile (/=m) $ tail $ iterate (amicable_next) m)

valid (x:y:xs) | x >= y = False
               | x > 1000000 = False
               | otherwise = valid (y:xs)
valid _ = True

amicables = filter (valid) $ map (amicable_chain) [1..999999]

-- main :: IO ()
-- main = do print $ amicables
--           print take 10 amicables