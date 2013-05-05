zmodload zsh/parameter

function zaw-src-history() {
    cands_assoc=("${(@kv)history}")
    actions=("zaw-callback-execute" "zaw-callback-replace-buffer" "zaw-callback-append-to-buffer" "zaw-callback-copy-to-clipboard")
    act_descriptions=("execute" "replace edit buffer" "append to edit buffer" "copy to clipboard")
    options=("-r" "-m")

    if (( $+functions[zaw-bookmark-add] )); then
        # zaw-src-bookmark is available
        actions+="zaw-bookmark-add"
        act_descriptions+="bookmark this command line"
    fi
}

zaw-register-src -n history zaw-src-history
