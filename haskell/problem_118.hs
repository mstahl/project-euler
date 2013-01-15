-- Using all of the digits 1 through 9 and concatenating them freely to form
-- decimal integers, different sets can be formed. Interestingly with the set
-- {2,5,47,89,631}, all of the elements belonging to it are prime.
-- 
-- How many distinct sets containing each of the digits one through nine
-- exactly once contain only prime elements?
-- 
-- http://projecteuler.net/index.php?section=problems&id=118

module Main where

import List
import Misc
import ONeillPrimes

myprimes :: [Int]
myprimes = reverse $ primesToLimit 98765432

is_pandigital_set lst = ([1, 2, 3, 4, 5, 6, 7, 8, 9] \\ mydigits)
                        where mydigits = flatten $ map (digits) lst

main :: IO ()
main = do print $ length $ myprimes
          print $ is_pandigital_set [2,5,47,89,631]
