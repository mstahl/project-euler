module Main where

import Data.List
import Control.Parallel
import Control.Parallel.Strategies
import ONeillPrimes (primes, primesToLimit)
import Modulo

between :: Ord t => t -> t -> [t] -> [t]
between a b = takeWhile (<=b) . dropWhile (<a)

s p = modSum p [modFactorial p (p - k) | k <- [1..5]]

main :: IO ()
main = do let myprimes = between 5 (10 ^ 6) primes
          print $ sum
                $ runEval
                $ parBuffer 64 rseq
                $ map (s) $ myprimes

{- main :: IO () -}
{- main = do print $ s 99999989 -}

{- main :: IO () -}
{- main = do print $ sumMod 123456789 [1..(10 ^ 8)] -}

{- main :: IO () -}
{- main = do print $ factorialMod 99999989 (99999989 - 1) -}
