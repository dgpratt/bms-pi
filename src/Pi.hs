module Pi (piDigits, piDigits2) where

import Data.Number.CReal (CReal, showCReal)
import Prelude hiding (pi)
import qualified Prelude (pi)

nms :: [Integer]
nms = scanl (\a n -> 2 * a * n) 3 [1, 3..]

dns :: [Integer]
dns = zipWith (*) [1, 3 ..] xs
  where
    xs = scanl (\a n -> 16 * a * n) 1 [1..]

terms :: [CReal]
terms = zipWith f nms dns
  where f n d = fromIntegral n / fromIntegral d

pi :: Int -> CReal
pi d = sum (take 1655 terms)
  -- where
  --   limit = 10 ** fromIntegral (-d)

piDigits :: Int -> String
piDigits n = showCReal n (pi n)

piDigits2 :: Int -> String
piDigits2 n = showCReal n Prelude.pi
