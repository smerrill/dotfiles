#!/bin/bash

echo "INFO: Installing dotfiles."

# Check that dotfiles repo exists.
[[ -d $HOME/dotfiles ]] || {
  echo "Please ensure the dotfiles repo exists before running this command."
  exit 1
}

echo "INFO: Updating submodules."
cd $HOME/dotfiles
git submodule update --init

# Backup old files.
[[ -d $HOME/.dotfiles-backup ]] || {
  mkdir $HOME/.dotfiles-backup
}

# Run this from the user's home directory.
cd $HOME

# Files to exclude.
excluded=(".gitignore" ".hgignore" ".git" ".dotfiles-backup" ".." "." "install-dotfiles.sh" "agnoster-smerrill.zsh-theme")

for i in dotfiles/.*; do
  # @TODO: DRY
  for j in ${excluded[@]}; do
    [[ $i == "dotfiles/$j" ]] && continue 2
  done

  existing_file=${i/dotfiles\//~/}
  echo $existing_file

  # Back up the file if it exists.
  [[ -e $existing_file ]] && {
    echo "INFO: Backing up $existing_file."
    cp -frv $existing_file .dotfiles-backup/
  }

  # Make the symlink
  ln -sfv $i $existing_file
done

for i in dotfiles/*; do
  # @TODO: DRY
  for j in ${excluded[@]}; do
    [[ $i == "dotfiles/$j" ]] && continue 2
  done

  existing_file=${i/dotfiles\//~/}
  echo $existing_file

  # Back up the file if it exists.
  [[ -e $existing_file ]] && {
    echo "INFO: Backing up $existing_file."
    cp -frv $existing_file .dotfiles-backup/
  }

  # Make the symlink
  ln -sfv $i $existing_file
done

echo "INFO: Installing oh-my-zsh theme."
ln -sfv $HOME/dotfiles/agnoster-smerrill.zsh-theme $HOME/.oh-my-zsh/themes

echo "INFO: Dotfiles installed."

