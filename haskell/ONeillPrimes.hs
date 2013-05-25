-- Generate Primes using ideas from The Sieve of Eratosthenes
--
-- This code is intended to be a faithful reproduction of the
-- Sieve of Eratosthenes, with the following change from the original
--   - The list of primes is infinite
-- (This change does have consequences for representing the number table
-- from which composites are "crossed out".)
--
-- (c) 2006-2007 Melissa O'Neill.  Code may be used freely so long as
-- this copyright message is retained and changed versions of the file
-- are clearly marked.

module ONeillPrimes (composites, primes, sieve, calcPrimes, primesToNth, primesToLimit, prime_factors, factors, prime_factors_exponents) where

import Data.List (group)

-- mstahl changes (github.com/mstahl)
prime_factors :: Integral t => t -> [t]
prime_factors n = factor n primes
  where factor n (p:ps) | p > n = []
                        | n `mod` p /= 0 = factor n ps
                        | otherwise = p : factor (n `div` p) (p:ps)

prime_factors_exponents :: Integral t => t -> [(t, Int)]
prime_factors_exponents = map (\l -> (head l, length l)) . group . prime_factors

factors :: Integral t => t -> [t]
factors n = [d | d <- [1..(n `div` 2)] ++ [n]
               , n `mod` d == 0
               ]
-- end mstahl changes

-- This is a function to lazily delete the intersection of two lists,
-- so that this module can lazily generate composite numbers. The head
-- of the second list is always the next element from the first list that
-- won't be included. It's not exported so as not to conflict with 
-- Data.List.(\\)
(\\) :: (Ord t, Eq t) => [t] -> [t] -> [t]
(x:xs) \\ (y:ys) | x == y = xs \\ ys
                 | x < y = x : (xs \\ (y:ys))
composites :: Integral t => [t]
composites = [2..] \\ primes
-- end mstahl changes

-- Priority Queues;  this is essentially a copy-and-paste-job of
-- PriorityQ.hs.  By putting the code here, we allow the Haskell
-- compiler to do some whole-program optimization.  (Based on ML
-- code by L. Paulson in _ML for the Working Programmer_.)

data PriorityQ k v = Lf
                   | Br {-# UNPACK #-} !k v !(PriorityQ k v) !(PriorityQ k v)
               deriving (Eq, Ord, Read, Show)

emptyPQ :: PriorityQ k v
emptyPQ = Lf

isEmptyPQ :: PriorityQ k v -> Bool
isEmptyPQ Lf  = True
isEmptyPQ _   = False

minKeyValuePQ :: PriorityQ k v -> (k, v)
minKeyValuePQ (Br k v _ _)    = (k,v)
minKeyValuePQ _               = error "Empty heap!"

minKeyPQ :: PriorityQ k v -> k
minKeyPQ (Br k v _ _)         = k
minKeyPQ _                    = error "Empty heap!"

minValuePQ :: PriorityQ k v -> v
minValuePQ (Br k v _ _)       = v
minValuePQ _                  = error "Empty heap!"

insertPQ :: Ord k => k -> v -> PriorityQ k v -> PriorityQ k v
insertPQ wk wv (Br vk vv t1 t2)
               | wk <= vk   = Br wk wv (insertPQ vk vv t2) t1
               | otherwise  = Br vk vv (insertPQ wk wv t2) t1
insertPQ wk wv Lf             = Br wk wv Lf Lf

siftdown :: Ord k => k -> v -> PriorityQ k v -> PriorityQ k v -> PriorityQ k v
siftdown wk wv Lf _             = Br wk wv Lf Lf
siftdown wk wv (t @ (Br vk vv _ _)) Lf 
    | wk <= vk                  = Br wk wv t Lf
    | otherwise                 = Br vk vv (Br wk wv Lf Lf) Lf
siftdown wk wv (t1 @ (Br vk1 vv1 p1 q1)) (t2 @ (Br vk2 vv2 p2 q2))
    | wk <= vk1 && wk <= vk2    = Br wk wv t1 t2
    | vk1 <= vk2                = Br vk1 vv1 (siftdown wk wv p1 q1) t2
    | otherwise                 = Br vk2 vv2 t1 (siftdown wk wv p2 q2) 

deleteMinAndInsertPQ :: Ord k => k -> v -> PriorityQ k v -> PriorityQ k v
deleteMinAndInsertPQ wk wv Lf             = error "Empty PriorityQ"
deleteMinAndInsertPQ wk wv (Br _ _ t1 t2) = siftdown wk wv t1 t2

leftrem :: PriorityQ k v -> (k, v, PriorityQ k v)
leftrem (Br vk vv Lf Lf) = (vk, vv, Lf)
leftrem (Br vk vv t1 t2) = (wk, wv, Br vk vv t t2) where
    (wk, wv, t) = leftrem t1
leftrem _                = error "Empty heap!"

deleteMinPQ :: Ord k => PriorityQ k v -> PriorityQ k v
deleteMinPQ (Br vk vv Lf _) = Lf
deleteMinPQ (Br vk vv t1 t2) = siftdown wk wv t2 t where
    (wk,wv,t) = leftrem t1
deleteMinPQ _ = error "Empty heap!"

-- A hybrid of Priority Queues and regular queues.  It allows a priority
-- queue to have a feeder queue, filled with items that come in an 
-- increasing order.  By keeping the feed for the queue separate, we
-- avoid needlessly filling an O(log n) data structure with data that
-- it won't need for a long time.

type HybridQ k v = (PriorityQ k v, [(k,v)])

initHQ :: PriorityQ k v -> [(k,v)] -> HybridQ k v
initHQ pq feeder = (pq, feeder)

insertHQ :: (Ord k) => k -> v -> HybridQ k v -> HybridQ k v
insertHQ k v (pq, q) = (insertPQ k v pq, q)

deleteMinAndInsertHQ :: (Ord k) => k -> v -> HybridQ k v -> HybridQ k v
deleteMinAndInsertHQ k v (pq, q) = postRemoveHQ(deleteMinAndInsertPQ k v pq, q)
    where
        postRemoveHQ mq@(pq, []) = mq 
        postRemoveHQ mq@(pq, (qk,qv) : qs)
            | qk < minKeyPQ pq = (insertPQ qk qv pq, qs)
            | otherwise        = mq

minKeyHQ      :: HybridQ k v -> k
minKeyHQ (pq, q) = minKeyPQ pq

minKeyValueHQ :: HybridQ k v -> (k, v)
minKeyValueHQ (pq, q) = minKeyValuePQ pq


-- Finally, we have acceptable queues, now on to finding ourselves some
-- primes.


-- Here we use a wheel to generate all the number that are not multiples
-- of 2, 3, 5, and 7.  We use some hard-coded data for that.

{-# SPECIALIZE wheel :: [Int] #-}
{-# SPECIALIZE wheel :: [Integer] #-}
wheel :: Integral a => [a]
wheel = 2:4:2:4:6:2:6:4:2:4:6:6:2:6:4:2:6:4:6:8:4:2:4:2:4:8:6:4:6:2:4:6
	:2:6:6:4:2:4:6:2:6:4:2:4:2:10:2:10:wheel

-- Now generate the primes using that wheel

-- Sometimes, memoization isn't your friend.  Maybe you don't actually want
-- to remember all the primes for the duration of your program and doing so
-- is just wasted space.  For that situation, we provide calcPrimes which
-- calculates the infinite list of primes from scratch.

{-# SPECIALIZE calcPrimes :: () -> [Int] #-}
{-# SPECIALIZE calcPrimes :: () -> [Integer] #-}
calcPrimes :: Integral a => () -> [a]
calcPrimes () = 2 : 3 : 5 : 7 : sieve 11 wheel

{-# SPECIALIZE primes :: [Int] #-}
{-# SPECIALIZE primes :: [Integer] #-}
primes :: Integral a => [a]
primes = calcPrimes ()

{-# SPECIALIZE primesToNth :: Int -> [Integer] #-}
{-# SPECIALIZE primesToNth :: Int -> [Int] #-}
primesToNth :: Integral a => Int -> [a]
primesToNth n = take n (calcPrimes ())

{-# SPECIALIZE primesToLimit :: Integer -> [Integer] #-}
{-# SPECIALIZE primesToLimit :: Int -> [Int] #-}
primesToLimit :: Integral a => a -> [a]
primesToLimit limit = takeWhile (< limit) (calcPrimes ())

-- This version of the sieve takes a wheel, not a list to be sieved.
-- primes1 and primes2 represent the same infinite list of, but they are
-- consumed at different speeds.  By creating separate expressions, we
-- avoid retaining all the material between the two points.  Sometimes 
-- (when you care about space usage) memoization is not your friend.

{-# SPECIALIZE sieve :: Int -> [Int] -> [Int] #-}
{-# SPECIALIZE sieve :: Integer -> [Integer] -> [Integer] #-}
sieve :: Integral a => a -> [a] -> [a]
sieve n [] = []
sieve n wheel@(d:ds) = n : (map (\(p,wheel) -> p) primes1) where
    primes1 = sieve' (n+d) ds initialTable 
    primes2 = sieve' (n+d) ds initialTable
    initialTable = initHQ (insertPQ (n*n) (n, wheel) emptyPQ)
                   (map (\(p,wheel) -> (p*p,(p,wheel))) primes2)
    sieve' n []     table = []
    sieve' n wheel@(d:ds) table
        | nextComposite <= n = sieve' (n+d) ds (adjust table)
        | otherwise	     = (n,wheel) : sieve' (n+d) ds table
        where
            nextComposite = minKeyHQ table
            adjust table
                | m <= n    = adjust (deleteMinAndInsertHQ m' (p, ds) table)
                | otherwise = table
              where
		(m, (p, d:ds)) = minKeyValueHQ table
		m' = m + p * d

