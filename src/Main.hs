module Main               ( main ) where

import Criterion.Main     ( bench, bgroup, defaultMain, nfIO )
import Data.Functor       ( (<$>) )
import Data.Monoid        ( (<>) )
import Data.String.Utils  ( strip )
import HSH                ( run, runIO )
import Test.HUnit         ( assertEqual )

runTrue :: IO ()
runTrue = runIO "true"

run1PipeInShell :: IO ()
run1PipeInShell = do  let n = 1000000 :: Int
                          cmd = "seq 1 " <> show n <> " | wc -l"
                      result <- read . strip <$> run cmd
                      assertEqual "run1PipeInShell result" n result

run2PipesInShell :: IO ()
run2PipesInShell = do let n = 1000000 :: Int
                          cmd = "yes | head -n " <> show n <> " | wc -l"
                      result <- read . strip <$> run cmd
                      assertEqual "run2PipesInShell result" n result

main :: IO ()
main = defaultMain
    [ bgroup "HSH"  [ bench "true"              $ nfIO runTrue
                    , bench "1 pipe in shell"   $ nfIO run1PipeInShell
                    , bench "2 pipes in shell"  $ nfIO run2PipesInShell
                    ]
    ]
