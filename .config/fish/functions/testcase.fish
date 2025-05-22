function testcase -d "Run a list of tests and notify on success/failure"
    for arg in $argv
        runtest $arg
        if test $status -ne 0
            return
        end
    end
    success $argv
end
