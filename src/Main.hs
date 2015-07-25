import HSH            ( runIO )
import Criterion.Main ( bench, bgroup, defaultMain, nfIO )

runTrue :: IO ()
runTrue = runIO "true"

run1PipeInShell :: IO ()
run1PipeInShell = runIO "seq 1 1000 | wc -l >/dev/null"

run2PipesInShell :: IO ()
run2PipesInShell = runIO "yes | head -n 1000 | wc -l >/dev/null"

main :: IO ()
main = defaultMain
    [ bgroup "HSH"  [ bench "true"              $ nfIO runTrue
                    , bench "1 pipe in shell"   $ nfIO run1PipeInShell
                    , bench "2 pipes in shell"  $ nfIO run2PipesInShell
                    ]
    ]
