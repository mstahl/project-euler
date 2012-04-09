-- Consider the divisors of 30: 1,2,3,5,6,10,15,30.
-- It can be seen that for every divisor d of 30, d+30/d is prime.
-- 
-- Find the sum of all positive integers n not exceeding 100 000 000
-- such that for every divisor d of n, d+n/d is prime.
-- 
-- http://projecteuler.net/problem=357

module Main where

import Control.Parallel
import Control.Parallel.Strategies

import Data.Maybe

-- import MillerRabin
import ONeillPrimes

-- divisors :: Int -> [Int]
divisors n = [d | d <- [1..(n `div` 2)], n `mod` d == 0]

-- generating :: Int -> Bool
generating n = all (prime) [d + (n `div` d) | d <- divisors n]

prime :: Integral t => t -> Bool
prime n = elem n $ takeWhile (<=n) primes

---- My original solution ----
main :: IO ()
main = do let candidates = map (flip (-) 1) primes
          print $ sum
                $ takeWhile (<100000000) 
                $ catMaybes
                $ runEval
                $ parBuffer 8192 rpar
                $ map (\x -> if generating x then Just x else Nothing) candidates
