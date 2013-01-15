
module Main where

fibonaccis = 1 : 1 : zipWith (+) fibonaccis (tail fibonaccis)

a_f m x = sum $ map (\(a, b) -> (x ** a) * b) $ zip [1..m] fibonaccis
