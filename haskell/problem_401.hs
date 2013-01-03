module Main where

import Sigma
import Modulo

main :: IO ()
{- main = do print $ sumSigma 2 (10 ^ 4) -}
main = do print $ modFactorial 99999989 (99999989 - 1)
