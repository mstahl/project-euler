{-
A number chain is created by continuously adding the square of the digits in a number to form a new number until it has been seen before.

For example,

44  32  13  10  1  1
85  89  145  42  20  4  16  37  58  89

Therefore any chain that arrives at 1 or 89 will become stuck in an endless loop. What is most amazing is that EVERY starting number will eventually arrive at 1 or 89.

How many starting numbers below ten million will arrive at 89?

http://projecteuler.net/index.php?section=problems&id=92
-}

module Main where 

import Data.Array
import Misc (digits)

chain = 
  let memo 1 = 1
      memo 89 = 89
      memo x = chain ! (sum $ map (^2) $ digits x)
  in array (1, 9999999) [(x, memo x) | x <- [1..9999999]]

main :: IO ()
main = do print $ length $ filter (==89) $ elems chain
