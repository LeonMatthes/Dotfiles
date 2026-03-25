function success -d "Notify the user of success"
    if test -z "$TEST_NOTIFY_ID"
        set -U TEST_NOFITY_ID "0"
    end
    set -U TEST_NOTIFY_ID (notify-send --app-name=Tests -p --replace-id=$TEST_NOTIFY_ID "✅ All tests passed" "$argv")
    echo (set_color --bold brgreen)"✅✅✅✅✅✅✅✅✅ All tests passed"(set_color normal)
end


