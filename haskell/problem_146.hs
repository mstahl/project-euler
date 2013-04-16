-- The smallest positive integer n for which the numbers n^(2)+1, n^(2)+3,
-- n^(2)+7, n^(2)+9, n^(2)+13, and n^(2)+27 are consecutive primes is 10. The sum
-- of all such integers n below one-million is 1242490.
-- 
-- What is the sum of all such integers n below 150 million?
-- 
-- http://projecteuler.net/index.php?section=problems&id=146

module Main where

import Misc (mergeAll)
import MillerRabin (prime)

-- problem_size = 10^6
problem_size = 150000000

ns = [ n
     -- | n <- concatMap (\k -> map (+k) [10, 80, 130, 200]) [0,210..problem_size]
     | n <- mergeAll [ [0, 210..problem_size]
                     , [10,220..problem_size]
                     , [80,290..problem_size]
                     , [130,340..problem_size]
                     , [200,410..problem_size]
                     ]
     -- , let m = n * n
     -- , prime $ m + 1
     -- , prime $ m + 3
     -- , prime $ m + 7
     -- , prime $ m + 9
     -- , prime $ m + 13
     -- , prime $ m + 27
     ]

main :: IO ()
main = do mapM_ (print) ns
