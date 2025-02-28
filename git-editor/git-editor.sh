if [[ "$TERMINAL_EMULATOR" == "JetBrains-JediTerm" ]]; then
    exec idea --wait "$@"
else
    exec vim "$@"
fi