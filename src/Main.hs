module Main where

import Pi (piDigits, piDigitsAtan, piDigitsAsin)
import System.Environment (getArgs)

main :: IO ()
main = getArgs >>= run

run :: [String] -> IO ()
run ("-v":"atan":_) = putStrLn (piDigitsAtan 1000)
run ("-v":"asin":_) = putStrLn (piDigitsAsin 1000)
run _            = putStrLn (piDigits 1000)