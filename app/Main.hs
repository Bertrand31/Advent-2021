module Main where

import Day1

main :: IO ()
main = do
  contents <- readFile "day1.txt"
  putStrLn $ show $ Day1.solve $ lines contents
