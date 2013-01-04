-- By replacing the 1st digit of *3, it turns out that six of the nine possible
-- values: 13, 23, 43, 53, 73, and 83, are all prime.
-- 
-- By replacing the 3rd and 4th digits of 56**3 with the same digit, this 5-digit
-- number is the first example having seven primes among the ten generated
-- numbers, yielding the family: 56003, 56113, 56333, 56443, 56663, 56773, and
-- 56993. Consequently 56003, being the first member of this family, is the
-- smallest prime with this property.
-- 
-- Find the smallest prime which, by replacing part of the number (not necessarily
-- adjacent digits) with the same digit, is part of an eight prime value family.
-- 
-- http://projecteuler.net/problem=51

module Main where

import Control.Parallel
import Control.Parallel.Strategies

import Data.List

import ONeillPrimes (primes)
import MillerRabin (prime)

empty :: [t] -> Bool
empty [] = True
empty _  = False

bits :: Integral t => t -> [Bool]
bits 0 = []
bits n = ((n `mod` 2) == 1) : bits (n `div` 2)

overlay :: [Bool] -> Char -> [Char] -> [Char]
overlay (True:xs) c (_:qs) = c : overlay xs c qs
overlay (False:xs) c (q:qs) = q : overlay xs c qs
overlay _ _ (q:qs) = q : qs
overlay _ _ _ = []

overlays_for :: (Integral t, Show t) => t -> [[Bool]]
overlays_for n = map (bits) [1..(2 ^ (length $ show n))]

families :: (Integral a, Show a) => a -> [[Integer]]
families n = filter ((>1) . length) 
                    [filter (prime) $ nub 
                                      [ x
                                      | c <- ['0'..'9']
                                      , let x = (read $ overlay o c (show n))::Integer
                                      , (length $ show x) == (length $ show n)
                                      ]
                    | o <- overlays_for n
                    ]

best_family :: Integer -> [Integer]
best_family = maximumBy (\a b -> length a `compare` length b) . families

main :: IO ()
main = do let candidates = map (\p -> (p, best_family p)) primes
          print $ head $ snd $ head $ dropWhile ((<8) . length . snd) candidates
