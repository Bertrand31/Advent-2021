module Main where

import Day1_1
import Day1_2

main :: IO ()
main = do
  day1_1 <- readFile "day1_1.txt"
  putStrLn $ show $ Day1_1.solve $ lines day1_1
  day1_2 <- readFile "day1_2.txt"
  putStrLn $ show $ Day1_2.solve $ lines day1_2
