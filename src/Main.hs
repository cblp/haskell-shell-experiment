import HSH

main :: IO ()
main = do
    runIO "cat LICENSE | grep I | wc -l"
    runIO "grep I LICENSE -c"
