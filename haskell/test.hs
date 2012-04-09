
module Main where

import ONeillPrimes

main :: IO ()
main = do print $ prime_factors $ product [1..10]

