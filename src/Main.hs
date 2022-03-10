module Main where

-- import Main.Utf8 (withUtf8)
import Pi (piDigits, piDigits2)

-- main :: IO ()
-- main = do
--   -- For withUtf8, see https://serokell.io/blog/haskell-with-utf8
--   withUtf8 $ do
--     putStrLn "Hello 🌎"
--     putStrLn (piDigits 1000)

main = putStrLn (piDigits2 1000)