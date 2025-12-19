function runtest -d "Run a single test and notify on failure"
    fish -c "$argv"
    set -l result $status
    if test $result -ne 0
        if test -z "$TEST_NOTIFY_ID"
            set -U TEST_NOFITY_ID "0"
        end
        set -U TEST_NOTIFY_ID (notify-send --app-name=Tests  -p --replace-id=$TEST_NOTIFY_ID "❌ A testcase failed!" "$argv" --hint int:transient:1)
    end
    return $result
end
