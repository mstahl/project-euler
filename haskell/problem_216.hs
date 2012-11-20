-- Consider numbers t(n) of the form t(n) = 2n^(2)-1 with n > 1. The first such
-- numbers are 7, 17, 31, 49, 71, 97, 127 and 161. It turns out that only 49 = 7*7
-- and 161 = 7*23 are not prime. For n ≤ 10000 there are 2202 numbers t(n) that
-- are prime.
-- 
-- How many numbers t(n) are prime for n ≤ 50,000,000 ?
-- 
-- http://projecteuler.net/index.php?section=problems&id=216

module Main where

import MillerRabin (prime)
import Sigma
import Data.List (scanl1, group)
import Data.Maybe

import Control.Parallel.Strategies

import Text.Printf

-- limit = 50000000
limit = 50000000

parFilter f = catMaybes . runEval 
                        . parBuffer 4096 rpar
                        . map (\x -> if (f x) then Just x else Nothing)

ns = parFilter (prime . snd) $ [(n, q) | n <- [2..limit]
                                       , let q = 2 * (n ^ 2) - 1
                                       ]

main :: IO ()
main = do --mapM_ (\(n, fn) -> printf "%8d -> %d\n" (n::Integer) (fn::Integer)) ns
          --putStrLn "--------------------------"
          print $ length ns

