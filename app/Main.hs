module Main where

import Args (Options (..), parseArgs)
import System.Environment (getArgs)

main :: IO ()
main = do
  opts <- parseArgs

  print opts

grepLines :: String -> [String] -> [String]
grepLines = undefined
