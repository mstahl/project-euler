{-
 - AKS Primality
 - 
 - Implementation of the Agrawal–Kayal–Saxena primality test, as described at:
 - 
 - http://en.wikipedia.org/wiki/AKS_primality_test#Algorithm
 - 
 - Haskell implementation by Max Thom Stahl
 -}

module AKSPrimality where

import Totient

order :: (Integral t) => t -> t -> t
order m x = length $ takeWhile ((/=)1) 
                   $ iterate (\a -> (a * x) `mod` m)

prime :: (Integral t) => t -> Bool
prime n | n < 1 = False
        | any (\(a, b) -> a ^ b == n)
              [(a, b) | a <- [2..(floor $ sqrt $ fromIntegral n)]
                      , b <- [2..(floor $ logBase (fromIntegral a) $ fromIntegral n)]
              ] = False
        | otherwise =
          let r = head $ [ order r n' | n' <- [1..]
                                     , let ordrn = order r n'
                                     , ordrn > (logBase 2 $ fromIntegral n) ** 2
                                     ]
          in if any (\a -> 1 < g && g < n where g = gcd(a, n))
             then False
             else if any (\a -> {- TODO -}) [1..m] where m = floor ( (sqrt $ totient r) * (log n) )
                  then False
                  else True

main :: IO ()
main = do print $ prime 0
          print $ prime 16
          print $ prime 13
