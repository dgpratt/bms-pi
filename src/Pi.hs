module Pi (piDigits, piDigitsAtan, piDigitsAsin) where

import Data.Number.CReal (CReal, showCReal)
import Prelude hiding (pi)
import qualified Prelude (pi)
import Data.Ratio ((%))

nms :: [Integer]
nms = scanl (\a n -> 2 * a * n) 3 [1, 3..]

dns :: [Integer]
dns = zipWith (*) [1, 3 ..] xs
  where
    xs = scanl (\a n -> 16 * a * n) 1 [1..]

terms :: [CReal]
terms = zipWith f nms dns
  where f n d = fromRational (n % d)

pi :: CReal
pi = sum (take 1655 terms)

piAtan :: CReal
piAtan = Prelude.pi

piAsin :: CReal 
piAsin = 6 * asin (fromRational (1 % 2))

piDigits :: Int -> String
piDigits n = showCReal n pi

piDigitsAtan :: Int -> String
piDigitsAtan n = showCReal n piAtan

piDigitsAsin :: Int -> String
piDigitsAsin n = showCReal n piAsin
