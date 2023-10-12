module TTT.A2 where

import Data.List (intercalate)
import TTT.A1
import GHC.Stack.Types (CallStack(EmptyCallStack))
import Data.Char (toUpper)
import GHC.RTS.Flags (DebugFlags(stable))

-- Q#01

-- promptPlayer = undefined
promptPlayer p = do
    -- print $ "blah " ++ (show p) ++ " asdfsadf"
    -- print $ "Player " ++ (show p) ++ "'s turn: enter a row and column position (ex. A1)"   
    print $ concat ["Player "
                   ,show p
                   , "'s turn: enter a row and column position (ex. A1)"
                   ] 
    return getLine
-- Q#02

-- _RANGE_ = undefined
_RANGE_ = [0..(-1 + _SIZE_)]

-- Q#03

-- isDigit = undefined
isDigit c = elem c ['0'..'9']

-- readDigit = undefined
readDigit c | isDigit c = read $ c:""
readDigit c | True = -1
-- Q#04

-- _EMPTY_ROW_ = undefined
_EMPTY_ROW_ = replicate (fromInteger _SIZE_) Empty

-- _EMPTY_BOARD_ = undefined
_EMPTY_BOARD_ = replicate (fromInteger _SIZE_) _EMPTY_ROW_

-- Q#05

-- isTied = undefined
isTied b = not.any (==Empty) $ foldl1 (++) b

-- _TIED_BOARD_ = undefined
_TIED_BOARD_ :: Board
_TIED_BOARD_ = [
        [X, O, O]
      , [O, X, X]
      , [O, X, O]
      ]

-- Q#06

-- indexRowStrings = undefined
indexRowStrings lst = zip ['A'..] lst
-- Q#07

-- formatLine = undefined
formatLine lst = concat [_SEP_
                        ,intercalate _SEP_ lst
                        ,_SEP_
                        ]

-- Q#08

-- isMoveInBounds = undefined
isMoveInBounds (r,c) = isRowInBounds r && (isColInBounds c)
isRowInBounds n = elem n [0..(-1 + _SIZE_)]
isColInBounds = isRowInBounds

-- Q#09

-- stringToMove = undefined
stringToMove str | (length str < 2) = (-1,-1)
stringToMove (h:t) = (toRow h, (toCol t))
stringToMove _     = (-1,-1)

-- toRow c = -65 -- + (fromEnum (toUpper c))
toRow c = -65 + (fromEnum (toUpper c))

{- want to use readMaybe, but it's not in scope here, and I don't feel like casing imports A.t.m
toCol str = case (readmaybe str::Int) of
    Nothing -> -1
    Just n  ->  n
-}
toCol str =  read str::Int

-- Q#10

-- replaceSquareInRow = undefined
replaceSquareInRow p idx row | (idx<0) = row 
replaceSquareInRow p idx row | idx >= (length row) = row
replaceSquareInRow p idx row = let 
    (a,b) = splitAt idx row
    theStart = a
    theEnd = tail b
    in concat [theStart
     ,show p
     ,theEnd]

rsO idx row = replaceSquareInRow O idx row
rsX idx row = replaceSquareInRow X idx row
