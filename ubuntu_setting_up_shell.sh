#!/bin/bash
set -x

sudo apt-get update > /dev/null
sudo apt-get install -y zsh git curl gawk > /dev/null
sudo chsh -s $(which zsh) $USER

printf "Y\n" | (sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)") > /dev/null

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k > /dev/null
gawk -i inplace '{gsub(/ZSH_THEME="robbyrussell"/,"# ZSH_THEME=\"robbyrussell\"\nZSH_THEME=\"powerlevel10k/powerlevel10k\"")}1' ~/.zshrc

git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting > /dev/null
sed -i 's/\(plugins=(.*[^)]\))/\1 zsh-syntax-highlighting)/' ~/.zshrc

git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions > /dev/null
sed -i 's/\(plugins=(.*[^)]\))/\1 zsh-autosuggestions)/' ~/.zshrc

zsh -c "source ~/.zshrc"
zsh
