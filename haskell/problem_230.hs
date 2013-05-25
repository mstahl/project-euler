{-
 - For any two strings of digits, A and B, we define FA,B to be the sequence
 - (A,B,AB,BAB,ABBAB,...) in which each term is the concatenation of the
 - previous two.
 -
 - Further, we define DA,B(n) to be the nth digit in the first term of FA,B
 - that contains at least n digits.
 -
 - Example:
 -
 - Let A=1415926535, B=8979323846. We wish to find DA,B(35), say.
 -
 - The first few terms of FA,B are:
 - 1415926535
 - 8979323846
 - 14159265358979323846
 - 897932384614159265358979323846
 - 14159265358979323846897932384614159265358979323846
 -
 - Then DA,B(35) is the 35th digit in the fifth term, which is 9.
 -
 - Now we use for A the first 100 digits of π behind the decimal point:
 -
 - 14159265358979323846264338327950288419716939937510
 - 58209749445923078164062862089986280348253421170679
 -
 - and for B the next hundred digits:
 -
 - 82148086513282306647093844609550582231725359408128
 - 48111745028410270193852110555964462294895493038196.
 -
 - Find sum_{n = 0,1,...,17} 10^n * D_{A,B}((127 + 19*n) * 7^n).
 -}

module Main where

import Misc (digits)

-- d :: [a] -> [a] -> Int -> a
d a b i =
  let i' = i - 1
      a_length = length a
      fibonaccis = 1 : 1 : zipWith (+) fibonaccis (tail fibonaccis)
      fib_words = "a" : "b" : zipWith (++) fib_words (tail fib_words)
      (primary, secondary) = i' `divMod` a_length
      word_index = length $ dropWhile (<=primary) fibonaccis
      word = fib_words !! word_index
  in case word !! primary of
    'a' -> a !! secondary
    'b' -> b !! secondary

main :: IO ()
-- main = do print $ d (digits 1415926535) (digits 8979323846) 35
main = do let a = digits 1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679
              b = digits 8214808651328230664709384460955058223172535940812848111745028410270193852110555964462294895493038196
          print $ d a b $ (127 + 19 * 17) * 7 ^ 17
