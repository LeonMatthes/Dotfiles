function testcase -d "Run a list of tests and notify on success/failure"
    for arg in $argv
        fish -c "$arg"
        if test $status -ne 0
            notify-send "❌ A testcase failed!" "$arg" --hint int:transient:1
            echo "❌❌❌❌❌❌❌❌❌ '$arg' failed!"
            return
        else
        end
    end
    notify-send "✅ All tests passed" "$argv" --hint int:transient:1
    echo "✅✅✅✅✅✅✅✅✅"
end
