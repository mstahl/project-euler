module Main where

import Control.Parallel
import Control.Parallel.Strategies
import Data.Complex

is_integer :: RealFrac t => t -> Bool
is_integer f = (floor f) == (ceiling f)

sum_divisors :: Integral a => Float -> a
sum_divisors n = sum [ floor x
                     | let m = n
                     , x <- [1.0..m]::[Float]
                     , y <- [-m..m]::[Float]
                     , let quotient = (n :+ 0) / (x :+ y)
                     , is_integer $ realPart quotient
                     , is_integer $ imagPart quotient
                     ]

main :: IO ()
main = do print $ sum 
                $ runEval
                $ parBuffer 128 rseq
                $ map (sum_divisors) [1..(10^5)]
