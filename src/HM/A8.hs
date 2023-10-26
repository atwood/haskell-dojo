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

makeGameIfValid:: Either GameException String -> Either GameException Game 
--makeGameIfValid e@(Left exc)  = e
makeGameIfValid e = fmap makeGame e 
--makeGameIfValid g::Game  = fmap makeGame g 

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

h  secrt = foldl (f secrt) (Left secrt) lst
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

playGame game = do
  print game
  promptGuess
  guess <- getUpperChar
  _SPACE_
  eithGame' <- return$ processTurn guess game
  print eithGame'
  case eithGame' of
    (Left gm) -> do
        if not (elem '_' (g gm))
            then
                 putStr "\n\nYou Win!\n"
            else if (0 == (c gm)) && (elem '_' (g gm))
            then 
                putStr "\nSorry, You Lose!\n\n"
            else playGame gm
    (Right GameOver) -> do
        print GameOver
--    (Right exc) -> do
    (Right InvalidMove) -> do
        print InvalidMove
        playGame game
    (Right InvalidChars) -> do
        print InvalidChars
        playGame game
    (Right exc@RepeatMove) -> do
        print exc
        playGame game
  return()
  
-- Q#07

startGame validatorFunc = do
  s  <- setSecret
  s2 <- validatorFunc s
  --s2 <- return s
  possibleGame  <- return$ makeGameIfValid (Right s2)
  print possibleGame
  case possibleGame of
    (Left exc) -> do 
             print exc
             startGame validatorFunc
    (Right gm)  -> do
             playGame gm
 
  return ()
  
s = playGame (makeGame "bank")
go = startGame (\x->return x)
-- Q#08

runHM :: IO ()
runHM = putStrLn "Not implemented... yet!"