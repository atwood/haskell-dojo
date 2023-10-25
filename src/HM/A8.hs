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

validateNoDict sec = foldl (f sec) (Left sec) 
      [(hasValidChars, InvalidChars), (isValidLength, InvalidLength)]
{-
2023Oct25 JWA: I'm confused as to whether to change the signature of this function
Con: I'm just rewriting it
Pro: there's no need to pass in a dict, since we're calling getDict
-}
validateWithDict dummyParam sec = getDict >>= (w sec)
w sec maybeDict = case maybeDict of
  (Just dict) -> return$ vWdWork dict sec 
  --Nothing     -> return$ vWdWork [] sec 
--validateWithDictDriver sec = getDict >>= 

vWdWork dict sec = let
  a = (validateNoDict sec)
  in foldl (f sec) a [((isInDict dict), NotInDict)]

g secrt = foldl (f secrt) (Left secrt) lst
f = \secrt reslt (pred,exc) -> if pred secrt then reslt else (Right exc)
lst = [(hasValidChars, InvalidChars), (isValidLength, InvalidLength)]
{-
validateNoDict sec = 
  if not (hasValidChars sec) then Right InvalidChars
     else if not (isValidLength sec) then Right InvalidLength
     else Left sec

validateWithDict dict sec = case (validateNoDict sec) of
  Right exc -> Right exc
  Left s    -> if not (isInDict dict s) then Right NotInDict
                 else Left s
-}
-- Q#06

playGame = undefined

-- Q#07

startGame = undefined

-- Q#08

runHM :: IO ()
runHM = putStrLn "Not implemented... yet!"