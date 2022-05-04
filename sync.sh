#/bin/bash

# Go to home directory
#!/bin/bash

usage() {
    echo "Usage: $0 [-u|i]" 1>&2;
    echo "   -u  update   Copies all tracked ~/.dots to ~/.dotfiles" 1>&2;
    echo "   -i  install  Copies all ~/.dotfiles to ~/.dots" 1>&2;
    echo "   -c  clean    Deletes all backup directories" 1>&2;
    exit 1;
}

get_dotfiles() {
    cat dotfiles.txt | xargs
}

copy_dotfiles() {
    SRC=${1:-.}
    DIR=${2:-$HOME}
    echo "Copying dotfiles from $SRC -> $DIR"
    for DOTFILE in $(get_dotfiles)
    do
        cp -v -rf "$SRC/$DOTFILE" $DIR | sed 's/^/  /'
    done
}

backup() {
    SRC=${1:-.}

    # Create backup folder
    TS=$(date +'%Y_%m_%d_%H_%M')
    BAK="backup_$TS"
    mkdir $BAK;

    echo "Creating backup in $BAK"
    copy_dotfiles $SRC $BAK
}

update() {
    # Backup git dotfiles
    echo "Backing up `pwd` dotfiles"
    backup .
    copy_dotfiles $HOME .
}

install() {
    # Backup home dotfiles
    echo "Backing up $HOME dotfiles"
    backup "$HOME"
    copy_dotfiles . $HOME
}

clean() {
    # Delete all backup directories
    rm -v -rf backup_*
}

# Main function body
while getopts "uic" o; do
    case "${o}" in
        i)
            install;
            ;;
        u)
            update;
            ;;
        c)
            clean;
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

## Option 2: Use a bare repo

# Clone from git repo
# git clone --bare <git-repo-url> ~/.dotfiles

# Add `gitdf` alias from profile
# source ~/.profile # for alias

# Checkout the content to home directory
# gitdf checkout

# Hide untracked files
# gitdf config --local status.showUntrackedFiles no

# Add new files with `gitdf add <file>`
# Commit `gitdf commit -m "message"`

