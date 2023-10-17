module TTT.A4 where

import Data.List (transpose)
import TTT.A1
import TTT.A2
import TTT.A3 (getAllLines, putSquare)

-- Q#01

--_HEADER_ = undefined
_HEADER_ = (" " ++ (concatMap (_SEP_ ++) r) ++ _SEP_ ) where
    s = _SIZE_ -1   -- zero-based
    r = map show [0.. s]


-- Q#02

-- showSquares = undefined
showSquares lst = map show lst

-- Q#03

--dropFirstCol = undefined
dropFirstCol board = map (drop 1) board

-- Q#04

--dropLastCol = undefined
dropLastCol board = map (take (fromIntegral (_SIZE_ - 1))) board


--Q#05

--formatRows = undefined
formatRows brd = map formatLine (map showSquares brd)

-- Q#06

--isWinningLine_ = undefined
--isWinningLine p [] = False
--isWinningLine p l = all (==p) l
isWinningLine_ p l = (fromIntegral _SIZE_) == length (filter (==p) l)

-- Q#07

isWinningLine p [] = False
isWinningLine p l = foldr (\a b-> b && (a==p)) True l

-- Q#08

--hasWon = undefined
hasWon p b = any (\l->isWinningLine p l) (getAllLines b)

-- Q#09

--getGameState = undefined
getGameState b | (hasWon X b) = XWon
getGameState b | (hasWon O b) = OWon
getGameState b | isInProgress b = InProgress
getGameState b = Tie

isInProgress b = any (==Empty) (concat b)

--playMove = undefined
playMove :: Player -> Board -> Move -> (GameState, Board)
playMove p b mv = 
    let newB = putSquare p b mv
        newState = getGameState newB
    in (newState, newB)

-- Q#10

--prependRowIndices = undefined
{-
prependRowIndices lst = map f (zip idxs lst) where
    idxs = ['A','B'..]
    f (idx,str) = idx:str
-}
prependRowIndices lst = zipWith (:) idxs lst where
    idxs = ['A','B'..]
-- Q#11

formatBoard = undefined