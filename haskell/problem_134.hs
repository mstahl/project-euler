-- Consider the consecutive primes p_(1) = 19 and p_(2) = 23. It can be verified
-- that 1219 is the smallest number such that the last digits are formed by p_(1)
-- whilst also being divisible by p_(2).
-- 
-- In fact, with the exception of p_(1) = 3 and p_(2) = 5, for every pair of
-- consecutive primes, p_(2) > p_(1), there exist values of n for which the last
-- digits are formed by p_(1) and n is divisible by p_(2). Let S be the smallest
-- of these values of n.
-- 
-- Find ∑ S for every pair of consecutive primes with 5 ≤ p_(1) ≤ 1000000.
-- 
-- http://projecteuler.net/index.php?section=problems&id=134

module Main where

import ONeillPrimes
import Control.Parallel
import Control.Parallel.Strategies (parZipWith, rwhnf)

myprimes = primesToLimit 400000

num_digits n = length $ show n

ilength :: Integral b => [a] -> b
ilength [] = 0
ilength (_:xs) = 1 + (ilength xs)

s p1 p2 = 
  let p1l = num_digits p1
      s' m | m == p1 = 1
           | otherwise = 1 + (s' $ (m + p2) `mod` (10 ^ p1l))
  in s' 0

force :: [a] -> ()
force xs = go xs `pseq` ()
    where go (_:xs) = go xs
          go [] = 1

answers = drop 2 $ parZipWith rwhnf s ((force myprimes) `pseq` myprimes) ((force myprimes) `pseq` (tail myprimes))
-- answers = drop 2 $ zipWith s (myprimes) (tail myprimes)

main :: IO ()
main = do -- mapM_ (print) answers
          print $ sum answers

-- main :: IO ()
-- main = do print $ sum answers
