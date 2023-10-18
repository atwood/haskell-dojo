module TTT.A5 where

import Control.Monad (when)
import System.Random.Stateful (globalStdGen, uniformM)
import TTT.A1
import TTT.A2
import TTT.A3
import TTT.A4
import GHC.Num (bitInteger)

-- Q#01

--printBoard = undefined
printBoard b = putStrLn (formatBoard b)

-- Q#02
_LOGO_PATH_ :: FilePath
_LOGO_PATH_ = "./assets/ttt-logo.txt"

--printLogo = undefined
printLogo = do
    a <- readFile _LOGO_PATH_
    putStrLn a

-- Q#03
--pL = (readFile _LOGO_PATH_) >> (\s -> putStrLn s)
_RANDOM_BOOL_ :: IO Bool
_RANDOM_BOOL_ = uniformM globalStdGen

--firstPlayer = undefined
firstPlayer = do
    b <- _RANDOM_BOOL_
    p <- return $ getFirstPlayer b
    return p

f = do
  g <- getLine
  putStrLn g
  return ()

-- Q#04

--getMove = undefined
getMove b p = do
    putStrLn (promptPlayer p)
    i <- getLine
    m <- return (stringToMove i)
    m' <-return (fromIntegral (fst m), (fromIntegral (snd m)))
    isValid <- return $ isValidMove b m'
    if isValid
       then return m'
       else do 
              print "\n\nTry again, ex: B1"
              printBoard b
              getMove b p
-- Q#05

--play = undefined
play b p = 
    do if _DISPLAY_LOGO_ then printLogo
                         else return ()
       printBoard b
       m <- getMove b p
       (gs,b') <- return $ playMove p b (fromIntegral (fst m),fromIntegral (snd m))
       printBoard b'
       if (InProgress /= gs) then endGame (gs,b')
          else play b' (switchPlayer p) 

endGame (gs, b') = do
    print$ showGameState gs
    printBoard b'

-- Q#06

runTTT :: IO ()
runTTT = putStrLn "Not implemented... yet!"

-- Q#07

printLogoDo = undefined

-- Q#08

firstPlayerDo = undefined

-- Q#09

getMoveDo = undefined

-- Q#10

playDo = undefined