{-
 - Define f(0)=1 and f(n) to be the number of different ways n can be expressed
 - as a sum of integer powers of 2 using each power no more than twice.
 - 
 - For example, f(10)=5 since there are five different ways to express 10:
 - 
 - 1 + 1 + 8
 - 1 + 1 + 4 + 4
 - 1 + 1 + 2 + 2 + 4
 - 2 + 4 + 4
 - 2 + 8
 - 
 - What is f(1025)?
 -
 - http://projecteuler.net/problem=169
 -}

module Main where

import Combinatorics (setsums)
import Misc (count)

powers_of_two :: Integral t => [t]
powers_of_two = iterate (*2) 1


