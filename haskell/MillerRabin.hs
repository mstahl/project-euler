module MillerRabin where

find2km :: Integral a => a -> (a,a)
find2km n = f 0 n
    where 
        f k m
            | r == 1 = (k,m)
            | otherwise = f (k+1) q
            where (q,r) = quotRem m 2        

-- From Wikipedia:
-- * if n < 1,373,653, it is enough to test a = 2 and 3;
-- * if n < 9,080,191, it is enough to test a = 31 and 73;
-- * if n < 4,759,123,141, it is enough to test a = 2, 7, and 61;
-- * if n < 2,152,302,898,747, it is enough to test a = 2, 3, 5, 7, and 11;
-- * if n < 3,474,749,660,383, it is enough to test a = 2, 3, 5, 7, 11, and 13;
-- * if n < 341,550,071,728,321, it is enough to test a = 2, 3, 5, 7, 11, 13, and 17.
prime :: Integer -> Bool
prime n | n < 2 = True
        | n `elem` [2,3,5,7,11,13,17,23] = True
        | n < 1373653         = all (millerRabinPrimality n) [2, 3]
        | n < 9080191         = all (millerRabinPrimality n) [31, 73]
        | n < 4759123141      = all (millerRabinPrimality n) [2, 7, 61]
        | n < 2152302898747   = all (millerRabinPrimality n) [2, 3, 5, 7, 11]
        | n < 3474749660383   = all (millerRabinPrimality n) [2, 3, 5, 7, 11, 13]
        | n < 341550071728321 = all (millerRabinPrimality n) [2, 3, 5, 7, 11, 13, 17]
        | otherwise = all (millerRabinPrimality n) [2..m]
                      where m = min (n - 1) (floor (2 * ((log (fromIntegral n)) ** 2)))

primes = filter (prime) [2..]

-- prime_factors :: Integer -> [t]
prime_factors n = factor n primes
  where factor n (p:ps) | p > n = []
                        | n `mod` p /= 0 = factor n ps
                        | otherwise = p : factor (n `div` p) (p:ps)

millerRabinPrimality :: Integer -> Integer -> Bool
millerRabinPrimality n a
    | a <= 1 || a > n-1 = 
        error $ "millerRabinPrimality: a out of range (" 
              ++ show a ++ " for "++ show n ++ ")" 
    | n < 2 = False
    | even n = False
    | b0 == 1 || b0 == n' = True
    | otherwise = iter (tail b)
    where
        n' = n-1
        (k,m) = find2km n'
        b0 = powMod n a m
        b = take (fromIntegral k) $ iterate (squareMod n) b0
        iter [] = False
        iter (x:xs)
            | x == 1 = False
            | x == n' = True
            | otherwise = iter xs

pow' :: (Num a, Integral b) => (a -> a -> a) -> (a -> a) -> a -> b -> a
pow' _ _ _ 0 = 1
pow' mul sq x' n' = f x' n' 1
    where 
        f x n y
            | n == 1 = x `mul` y
            | r == 0 = f x2 q y
            | otherwise = f x2 q (x `mul` y)
            where
                (q,r) = quotRem n 2
                x2 = sq x

mulMod :: Integral a => a -> a -> a -> a
mulMod a b c = (b * c) `mod` a
squareMod :: Integral a => a -> a -> a
squareMod a b = (b * b) `rem` a
powMod :: Integral a => a -> a -> a -> a
powMod m = pow' (mulMod m) (squareMod m)