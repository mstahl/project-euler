-- AKS Primality
-- 
-- Implementation of the Agrawal–Kayal–Saxena primality test, as described at:
-- 
-- http://en.wikipedia.org/wiki/AKS_primality_test#Algorithm
--
-- Haskell implementation by Max Thom Stahl

module AKSPrimality where

import Totient

order :: (Integral t) => t -> t -> t
order r = length . takeWhile ((/=)1) 
                 . iterate (\a -> (a * a) `mod` r)

prime :: (Integral t) => t -> Bool
prime n | n < 1 = False
        | any (\(a, b) -> a ^ b == n) 
              [(a, b) | a <- [2..(floor $ sqrt $ fromIntegral n)], b <- [2..(floor $ logBase (fromIntegral a) $ fromIntegral n)]] = False
        | 1 < (gcd a n) && (gcd a n < ) 

main :: IO ()
main = do print $ prime 0
          print $ prime 16
          print $ prime 13
