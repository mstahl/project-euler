{-The smallest number expressible as the sum of a prime square, prime cube, and prime fourth power is 28. In fact, there are exactly four numbers below fifty that can be expressed in such a way:

28 = 22 + 23 + 24
33 = 32 + 23 + 24
49 = 52 + 23 + 24
47 = 22 + 33 + 24
How many numbers below fifty million can be expressed as the sum of a prime square, prime cube, and prime fourth power?-}

module Main where

import Squarefrees ((#), mergeAll)
import ONeillPrimes

limit = 50000000

squares = takeWhile (<limit) $ map (^2) primes
cubes   = takeWhile (<limit) $ map (^3) primes
fourths = takeWhile (<limit) $ map (^4) primes

answers = [s | a <- squares
             , b <- cubes
             , c <- fourths
             , let s = a + b + c
             , s < limit]

main :: IO ()
main = do putStrLn $ "There are " ++ (show $ length squares) ++ " square primes"
          putStrLn $ "And " ++ (show $ length $ cubes) ++ " cubed primes"
          putStrLn $ "And " ++ (show $ length $ fourths) ++ " fourth-power primes"
          print $ length answers
