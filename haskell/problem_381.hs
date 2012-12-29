module Main where

import Control.Parallel
import Control.Parallel.Strategies
import ONeillPrimes (primes)

{- factorialMod :: Integral t => t -> t -}
factorialMod m n | n < 2 = 1
                 | otherwise = (n * (factorialMod m (n - 1))) `mod` m

sumMod m (x:xs) = (x + (sumMod m xs)) `mod` m
sumMod _ [] = 0

between :: Ord t => t -> t -> [t] -> [t]
between a b = takeWhile (<=b) . dropWhile (<a)

s p = (sumMod p [factorialMod p (p - k) | k <- [1..5]]) `mod` p

main :: IO ()
main = do let myprimes = between 5 100000000 primes
{- main = do let myprimes = between 5 100000 primes -}
          print $ sum
                $ runEval
                $ parBuffer 4096 rseq
                $ map (s) $ myprimes
