
module Main where

import Misc (digits)

main :: IO ()
main = do print $ map digits [1..(10 ^ 7)]
{- main = do print $ map show [1..(10 ^ 5)] -}
