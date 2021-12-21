module Day1_1
    ( solve
    ) where

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

solve :: [String] -> Maybe Int
solve = (fmap countIncreasing) . makePairs . parseDepths
