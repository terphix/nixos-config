#!/usr/bin/env bash

echo "WARNING: YOU NEED TO BE USER AND CONFIGURE YOUR HOSTNAME,"
echo "IF ALL IS OK, PRESS ENTER."
read


nix-shell -p unzip gnupg --run 'true' --experimental-features 'nix-command flakes'


read -p "Enter config path: " config_path

if [[ ! -d "$config_path" ]]; then
  echo "Directory does not exists."
  exit 1
fi


read -p "Enter user directory path: " homedir_path

if [[ ! -d "$homedir_path" ]]; then
  echo "Directory does not exists."
  exit 1
fi


read -p "Enter USER secrets archive path (ENTER to skip):" archive_path

if [[ -z "$archive_path" ]]; then
  echo "Okey, go next."

elif [[ -f "$archive_path" ]]; then  
  case "$archive_path" in
    *.zip) mkdir -p "$homedir_path/.sec"; unzip "$archive_path" -d "$homedir_path"; mkdir -p "$homedir_path/.config/sops"; ln -s "$homedir_path/.sec/age" "$homedir_path/.config/sops";;
    *) echo "You need to use zip-arhive."; exit 1;;
  esac
  echo "Archive unpacked!"

else
  echo "Archive does not exists."
  exit 1
fi


echo "The end! Start to rebuild system."

sudo nixos-rebuild switch --flake $config_path


gpg --import "$homedir_path/.sec/gpg/public.asc"
gpg --import "$homedir_path/.sec/gpg/private.asc"
