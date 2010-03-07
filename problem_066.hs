-- Consider quadratic Diophantine equations of the form:
-- 
-- x^(2) – Dy^(2) = 1
-- 
-- For example, when D=13, the minimal solution in x is 649^(2) – 13×180^(2) = 1.
-- 
-- It can be assumed that there are no solutions in positive integers when D is
-- square.
-- 
-- By finding minimal solutions in x for D = {2, 3, 5, 6, 7}, we obtain the
-- following:
-- 
-- 3^(2) – 2×2^(2) = 1
-- 2^(2) – 3×1^(2) = 1
-- 9^(2) – 5×4^(2) = 1
-- 5^(2) – 6×2^(2) = 1
-- 8^(2) – 7×3^(2) = 1
-- 
-- Hence, by considering minimal solutions in x for D ≤ 7, the largest x is
-- obtained when D=5.
-- 
-- Find the value of D ≤ 1000 in minimal solutions of x for which the largest
-- value of x is obtained.
-- 
-- http://projecteuler.net/index.php?section=problems&id=66

module Main where

perfect_square :: Integral t => t -> Bool
perfect_square n = q * q == n where q = floor . sqrt . fromIntegral $ n

-- def CF_of_sqrt(n):
--     if is_square(n):
--         return [int(math.sqrt(n))]
-- 
--     ans = []
-- 
--     n1 = 0
--     d1 = 1
-- 
--     while True:
--         nextn = int((math.floor(math.sqrt(n)) + n1) / d1)
--         ans.append(int(nextn))
-- 
--         n2 = d1
--         d2 = h - k * (((floor . sqrt . fromIntegral $ n) + h) `div` k)
-- 
--         d3 = (n - (h - k * (((floor . sqrt . fromIntegral $ n) + h) `div` k)) ** 2) / k
--         n3 = k * (((floor . sqrt . fromIntegral $ n) + h) `div` k) - h
-- 
--         if d3 == 1:
--             ans.append(ans[0] * 2)
--             break
-- 
--         n1, d1 = n3, d3
-- 
--     return ans

-- square_root_convergents :: Integral t => t -> [(t, t)]
-- square_root_convergents n 
--   | perfect_square n = floor . sqrt . fromIntegral $ n
--   | otherwise = let next_c (h, k) | k == 1 = [(h, k)]
--                                   | otherwise = (h', k') : square_root_convergents n'
--                                                 where n' = ((floor . sqrt . fromIntegral $ n) + h) `div` k
--                                                       h' = (k * n') - h
--                                                       k' = (n - (h - k * (n' ** 2))) / k
--                 in next_c (0, 1)
-- square_root_convergents _ _ 1 = []
square_root_convergents n h k = 
  let m  = ((floor . sqrt . fromIntegral $ n) + h) `div` k
      h' = (m * k) - h
      k' = ((n - (h ^ 2)) `div` k) + (2 * m * h) - ((m ^ 2) * k)
  in (h, k) : square_root_convergents n h' k'