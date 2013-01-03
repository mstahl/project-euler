
module Main where

import ONeillPrimes

main = do mapM_ (\p -> putStrLn $ "  " ++ (show p) ++ ",") $ primesToLimit (10 ^ 9)
