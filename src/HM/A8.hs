module HM.A8 where

import Control.Monad (when)
import Data.Char (toUpper)
import HM.A6
import HM.A7 hiding (validateNoDict, validateWithDict)
import HM.Provided
import System.Directory (doesFileExist)

-- Q#01
{-
getUpperChar = do
  c<-getChar
  return $ toUpper c
-}
--getUpperChar = do c<-getChar;return $ toUpper c
getUpperChar = fmap toUpper getChar
-- Q#02
{-
_DICT_ = do
  fileExists <- doesFileExist _DICT_FILE_
  if fileExists then undefined else undefined
-}
_DICT_ = do
  fileExists <- doesFileExist "../../assets/dict.txt"  --_DICT_FILE_  - directory problems in moving to local install, 
  if fileExists then fmap words (readFile "../../assets/dict.txt") else pure []
-- _DICT_ = ["bank", "dog"]


isDictNonEmpty :: IO Bool
isDictNonEmpty = fmap (not.null) _DICT_

-- Q#03

--makeGameIfValid e@(Left exc)  = e
makeGameIfValid e = fmap makeGame e 

-- Q#04

gD = do
   d <- _DICT_ 
   b <- isDictNonEmpty
   return$ if b then Just d else Nothing

getDict = fmap toMaybe isDictNonEmpty <*> _DICT_
-- Q#05

validateNoDict = undefined

validateWithDict = undefined

-- Q#06

playGame = undefined

-- Q#07

startGame = undefined

-- Q#08

runHM :: IO ()
runHM = putStrLn "Not implemented... yet!"