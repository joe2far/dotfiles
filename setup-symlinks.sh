#!/bin/bash
##############################################################################
# ./setup-symlinks.sh
# This script creates symlinks in the home directory to dotfiles in ~/dotfiles
##############################################################################

### Variables ###

dotfiles_dir=./dotfiles               # dotfiles directory
old_dotfiles_dir=~/dotfiles_old       # old dotfiles backup directory

# List of files/folders to symlink in home directory
dotfiles=(
'zshrc'
'zsh_profile'
'inputrc'
'vimrc'

'zsh_aliases'
'zsh_exports'
)

# Create dotfiles_old in home directory
echo "# Creating $old_dotfiles_dir for backup of any existing dotfiles in ~"
mkdir -p $old_dotfiles_dir
echo "...done"

for dotfile in ${dotfiles[@]}; do

    source_dotfile=$dotfiles_dir/$dotfile
    target_dotfile=~/.$dotfile

    # If dotfile exists from ~ to dotfiles_old
    if [ -e "$target_dotfile" ]; then
        if [ "$(readlink "$target_dotfile")" != "$source_dotfile" ]; then
            echo "# Moving existing $target_dotfile to $old_dotfiles_dir"
            mv $target_dotfile $old_dotfiles_dir/
            echo "...done"
        fi
    fi

    # Create symlink for dotfile in home directory
    echo "# Creating symlink for $dotfile in home directory"
    ln -fs $source_dotfile $target_dotfile
    echo "...done"
done

# Unset variables
unset dotfiles_dir
unset old_dotfiles_dir
unset dotfiles
unset dotfile
unset source_dotfile
unset target_dotfile

# Source updated ~/.zshrc dotfile
source ~/.zshrc
