import HSH            ( runIO )
import Criterion.Main ( bench, bgroup, defaultMain, nfIO )

runTrue :: IO ()
runTrue = runIO "true"

main :: IO ()
main = defaultMain
    [ bgroup "HSH"  [ bench "true" $ nfIO runTrue
                    ]
    ]
