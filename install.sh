#!/bin/bash

cd `dirname $0`
. ./colors.sh

packages=(
  # Development
  "default-jdk"
  "git"
  "make"
  "nim"
  "openssl"
  "ruby"
  "vim"
)

echo "${cyan}Starting apt install.${reset}"
for e in ${packages[@]}; do
  sudo apt install -y ${e}
done
echo "${cyan}Starting apt update.${reset}"
sudo apt update
echo "${cyan}Starting apt upgrade.${reset}"
sudo apt upgrade -y
