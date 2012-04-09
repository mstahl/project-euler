

module Main where

-- import MillerRabin
import ONeillPrimes

main :: IO ()
main = do print $ length $ takeWhile (<10000) primes

