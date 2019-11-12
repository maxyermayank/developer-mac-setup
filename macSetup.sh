#!/bin/bash

## Install Homebrew & Cask
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask

## Update Homebrew
brew update

## Install Mac Command Line Tools
xcode-select --install

## Install Browsers (Google Chrome, Firefox)
brew cask install google-chrome
brew cask install firefox
# brew cask install google-chrome-canary
# brew cask install firefox-developer-edition


## Install HashiCorp Tools (Terrafor, Vault, Consul, Packer & Vagrant)
brew install terraform
brew install vault
brew install consul
brew install nomad
brew install packer
brew cask install vagrant


## Install Virtualization Tools (VMWare Fusion, Oracle Virtualbox, Docker, Vagrant Manager)
brew cask install vmware-fusion
brew cask install virtualbox
brew cask install docker
brew cask install vagrant-manager


## Install IDEs (Intellij, Visual Studio, Visual Studio Code, Android Studio)
brew cask install visual-studio-code
brew cask install intellij-idea
brew cask install visual-studio
brew cask install android-studio

# Install important Visual Studio Code Extensions
cat vscode-extensions.txt | xargs -L1 code --install-extension

## Install AWS Tools (AWS CLI & SAM CLI)
pip3 --version
curl -O https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py --user
pip3 install awscli --upgrade --user
aws --version
rm get-pip.py

brew tap aws/tap
brew install aws-sam-cli
sam --version

## Install Developer utilities (SDKMan, Spectacle, Tree, Ctop, JQ, Postman, httpie, NVM, Bash Completion)
curl -s "https://get.sdkman.io" | bash
echo '
# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/mpatel/.sdkman"
[[ -s "/Users/mpatel/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/mpatel/.sdkman/bin/sdkman-init.sh"
' >> ~/.bash_profile

brew cask install spectacle
brew install tree
brew install ctop
brew install jq
brew cask install postman
brew install httpie

brew install nvm
mkdir ~/.nvm
echo '
# NVM CONFIG
export NVM_DIR="$HOME/.nvm"
    [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion' >> ~/.bash_profile

brew install bash-completion
echo '
# BASH-COMPLETION CONFIG
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"' >> ~/.bash_profile

## Install Language SDKs/Platforms
brew cask install dotnet-sdk
brew cask install go

## Install Database Tools (PGAdmin, Mongo Studio 3T)
brew cask install pgadmin4
brew cask install studio-3t


## Install Productivity Tools (Slack, Evernote, Unarchiver, CheatSheet, Adobe Creative Cloud)
brew cask install slack
brew cask install evernote
brew cask install the-unarchiver
brew cask install cheatsheet
brew cask install adobe-creative-cloud

## Global Git Config
git config --global push.default current
git config --global core.excludesfile ~/.gitignore
git config --global user.name "<username>"
git config --global user.email <email>
git config --global color.branch auto
git config --global color.diff auto
git config --global color.interactive auto
git config --global color.status auto
git config --global alias.st status
git config --global alias.ci commit
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

## Setup Docker Aliases
echo "
alias dps='docker ps -a'
alias di='docker images -a'
alias dv='docker volume ls'
alias dn='docker network ls'
alias sprune='docker system prune'
alias vprune='docker volume prune'


## Docker Swarm Aliases
alias dstr='docker stack rm'
alias dsls='docker service ls'
alias dsp='docker service ps'
alias dsl='docker service logs'
alias dsr='docker service rm'
" >> ~/.bash_profile


## Source Bash Profile
source ~/.bash_profile