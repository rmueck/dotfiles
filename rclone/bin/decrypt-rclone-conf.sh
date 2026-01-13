#!/bin/bash
#

cd ~/.dotfiles/rclone/.ssh || exit 1
if [[ -f id_rclone.cpt ]]; then
  echo "Decrypting ssh-key ..."
  ccdecrypt id_rclone.cpt
fi

cd ~/.dotfiles/rclone/.config/rclone/ || exit 1
if [[ -f rclone.conf.cpt ]]; then
  echo "Decrypting rclone.conf ..."
  ccdecrypt rclone.conf.cpt
fi

cd ~/.dotfiles || exit 1
stow -R rclone



