module TTT.A2 where

import Data.List (intercalate)
import TTT.A1

-- Q#01

-- promptPlayer = undefined
promptPlayer p = do
    -- print $ "blah " ++ (show p) ++ " asdfsadf"
    -- print $ "Player " ++ (show p) ++ "'s turn: enter a row and column position (ex. A1)"   
    print $ concat ["Player "
                   ,show p
                   , "'s turn: enter a row and column position (ex. A1)"
                   ] 
    return (getLine)
-- Q#02

-- _RANGE_ = undefined
_RANGE_ = [0..(-1 + _SIZE_)]

-- Q#03

isDigit = undefined

readDigit = undefined

-- Q#04

_EMPTY_ROW_ = undefined

_EMPTY_BOARD_ = undefined

-- Q#05

isTied = undefined

_TIED_BOARD_ = undefined

-- Q#06

indexRowStrings = undefined

-- Q#07

formatLine = undefined

-- Q#08

isMoveInBounds = undefined

-- Q#09

stringToMove = undefined

-- Q#10

replaceSquareInRow = undefined