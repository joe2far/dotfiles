#!/bin/bash

# List of bash files to source
bash_files=(
"$HOME/.bash_extras"
"$HOME/.bash_aliases"
"$HOME/.bash_exports"
"$HOME/.bash_functions"
"$HOME/.bash_prompt"
)

# Source bash dotfiles
for bash_file in ${bash_files[@]}; do
    if [ -f "$bash_file" ]; then
        source "$bash_file"
    fi
done
unset bash_files
unset bash_file


### HISTORY ###
export HISTCONTROL=ignoredups:erasedups         # no duplicate entries
export HISTSIZE=100000                          # big big history (default is 500)
export HISTFILESIZE=$HISTSIZE                   # big big history
shopt -s histappend                             # append to history, don't overwrite it
# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;
