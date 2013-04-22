module Main where

import Data.Ratio

fibonaccis = 1 : 1 : zipWith (+) fibonaccis (tail fibonaccis)

rationals :: [Ratio Int]
rationals = do denominator <- [2..]
               numerator <- [1..(denominator - 1)]
               [numerator % denominator]
