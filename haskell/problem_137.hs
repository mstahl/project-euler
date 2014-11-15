module Main where

fibonaccis = 1 : 2 : zipWith (+) fibonaccis (tail fibonaccis)

in_pairs :: [t] -> [(t, t)]
in_pairs (x:y:xs) = (x, y) : in_pairs xs

golden_nuggets = map (\(x, y) -> x * y) $ in_pairs fibonaccis

main :: IO ()
main = do print $ golden_nuggets !! 15
