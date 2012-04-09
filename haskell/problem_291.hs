
module Main where

import Ratio
import Data.List

import ONeillPrimes

import Misc

-- limit = 5 * (10 ^ 15)
limit = 5 * (10 ^ 5)

panaitopols = 
  [ quotient | x <- [2..1000]
             , y <- [1..(x - 1)]
             , let numerator = ((x^4) - (y^4))
             , let denominator = ((x^3) + (y^3))
             , let (quotient, remainder) = divMod numerator denominator
             , remainder == 0
             ]

panaitopols' = 
  mergeAll $ map (reverse) [[ quotient | y <- [1..(x - 1)]
                                       , let numerator = ((x^4) - (y^4))
                                       , let denominator = ((x^3) + (y^3))
                                       , let (quotient, remainder) = divMod numerator denominator
                                       , remainder == 0
                                       ] | x <- [2..10000]]

main :: IO ()
main = do print $ panaitopols'
