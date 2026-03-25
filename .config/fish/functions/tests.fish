function tests -d "Run a list of tests via entr"
    for i in (seq (count $argv))
        set ENTR_ARGS[$i] "'$argv[$i]'"
    end
    echo ENTR_ARGS: $ENTR_ARGS
    entr -cdrs "testcase $ENTR_ARGS"
end
