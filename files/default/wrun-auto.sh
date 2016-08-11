# Whether to attempt to run command from %USERPROFILE% dir.
# This is useful when current path can't be translated to a windows path.
# Also potentially dangerous for example if you run windows delete commands
# in /tmp it may actually delete your windows home dir
ATTEMPT_TO_RUN_IN_HOME_DIR=true

# Choose one from 'wcmd', 'wrun', 'wstart'
COMMAND="wrun"

try_cbwin() {
    if [[ $# -gt 0 ]]; then
        if $COMMAND where "$1" > /dev/null 2>&1; then
            $COMMAND "$@"
            return 0
        fi
        if [ "$ATTEMPT_TO_RUN_IN_HOME_DIR" = true ] && $COMMAND : where "$1" > /dev/null 2>&1; then
            $COMMAND : "$@"
            return 0
        fi
    fi

    return 1
}

save_old_command_handler() {
    if declare -f command_not_found_handler > /dev/null; then
        eval "$(echo "orig_command_not_found_handler(){"; declare -f $1 | tail -n +2)"
        OLD_COMMAND_HANDLER=true
    else
        OLD_COMMAND_HANDLER=false
    fi
}

command_not_found_chain_handler() {
    if try_cbwin "$@"; then
        return 0
    elif [ $OLD_COMMAND_HANDLER = true ]; then
        orig_command_not_found_handler "$@"
        return $?
    else
        return 1
    fi
}

case "${SHELL}" in
    */zsh)
        save_old_command_handler "command_not_found_handler"
        command_not_found_handler() {
            command_not_found_chain_handler "$@"
            return $?
        }
        ;;
    */bash)
        save_old_command_handler "command_not_found_handle"
        command_not_found_handle() {
            command_not_found_chain_handler "$@"
            return $?
        }
        ;;
esac
