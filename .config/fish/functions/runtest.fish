function runtest -d "Run a single test and notify on failure"
    echo (set_color --bold brmagenta)🏃 Running test: $argv(set_color normal)
    fish -c "$argv"
    set -l result $status
    if test $result -ne 0
        if test -z "$TEST_NOTIFY_ID"
            set -U TEST_NOTIFY_ID "0"
        end
        # Note: This was using --replace-id before, but that doesn't seem to work with DMS
        set -U TEST_NOTIFY_ID (notify-send --app-name=Tests  -p "❌ A testcase failed!" "$argv" --transient)
        echo (set_color --bold brred)❌ Test failed: $argv!(set_color normal)
    end
    return $result
end
