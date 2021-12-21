module Main where

import Lib
import Text.Read (readMaybe)
import Data.Maybe (catMaybes)

parseDepths :: [String] -> [Int]
parseDepths = catMaybes . (fmap readMaybe)

countIncreasing :: [(Int, Int)] -> Int
countIncreasing = length . (filter $ uncurry (<))

makePairs :: [a] -> Maybe [(a, a)]
makePairs []       = Nothing
makePairs (x:[])   = Nothing
makePairs (x:y:[]) = Just [(x, y)]
makePairs (x:y:xs) = fmap ((x, y):) $ makePairs $ y:xs

main :: IO ()
main = do
  contents <- readFile "day1.txt"
  let depths = parseDepths $ lines contents
  putStrLn $ show $ fmap countIncreasing (makePairs depths)
