{-
  Peter has nine four-sided (pyramidal) dice, each with faces numbered 1, 2, 3, 4.
  Colin has six six-sided (cubic) dice, each with faces numbered 1, 2, 3, 4, 5, 6.

  Peter and Colin roll their dice and compare totals: the highest total wins. The result is a draw if the totals are equal.

  What is the probability that Pyramidal Pete beats Cubic Colin? Give your answer rounded to seven decimal places in the form 0.abcdefg
-}

module Main where

import Data.List

peter = [ a + b + c + d + e + f + g + h + i
        | a <- [1..4]
        , b <- [1..4]
        , c <- [1..4]
        , d <- [1..4]
        , e <- [1..4]
        , f <- [1..4]
        , g <- [1..4]
        , h <- [1..4]
        , i <- [1..4]
        ]
peter_freqs = [(head l, length l) | l <- group . sort $ peter]

colin = [ a + b + c + d + e + f
        | a <- [1..6]
        , b <- [1..6]
        , c <- [1..6]
        , d <- [1..6]
        , e <- [1..6]
        , f <- [1..6]
        ]
colin_freqs = [(head l, length l) | l <- group . sort $ colin]

score = 
  sum $ map (\(p_val, p_frq) 
             -> p_frq * (sum $ map (snd) 
                             $ filter (\(c_val, _) 
                                       -> c_val < p_val) colin_freqs)) peter_freqs

main :: IO ()
main = do print $ (fromIntegral score) / (fromIntegral $ length peter * length colin)

