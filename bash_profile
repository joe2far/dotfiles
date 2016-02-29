
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


# Larger bash history (default is 500)
export HISTFILESIZE=10000
export HISTSIZE=10000

