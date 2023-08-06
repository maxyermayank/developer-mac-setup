
#!/bin/bash

start=`date +%s`
bold=$(tput bold)
normal=$(tput sgr0)
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

# if test ! $(which gcc); then
#   echo "Installing command line developer tools..."
#   xcode-select --install
# fi

if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install caskroom/cask/brew-cask
    brew tap homebrew/cask-versions
    brew tap homebrew/cask-cask
    brew tap 'homebrew/bundle'
    brew tap 'homebrew/cask'
    brew tap 'homebrew/cask-drivers'
    brew tap 'homebrew/cask-fonts'
    brew tap 'homebrew/core'
    brew tap 'homebrew/services'
    brew tap aws/tap

fi

echo "Updating homebrew..."
brew update
brew upgrade


beginDeploy() {
    echo
    echo "${bold}$1${normal}"
}

############# General Tools #############
beginDeploy "############# General Tools #############"
echo -n "Do you wish to install General Tools (${bold}${green}y${reset}/${bold}${red}n${reset})? "
read General

CaskGeneralToolList=(
    google-chrome
    #firefox
    spotify
)
if [ "$General" != "${General#[Yy]}" ] ;then
    echo Yes
    brew install --cask --appdir="/Applications" ${CaskGeneralToolList[@]}
else
    echo No
fi

############# Designer #############
beginDeploy "############# Designer #############"
echo -n "Do you wish to install Designer Tools (${bold}${green}y${reset}/${bold}${red}n${reset})? "
read Designer

CaskDesignerToolList=(
    adobe-creative-cloud
)
if [ "$Designer" != "${Designer#[Yy]}" ] ;then
    echo Yes
    brew install --cask --appdir="/Applications" ${CaskDesignerToolList[@]}
else
    echo No
fi


############# Mobile Developer #############
beginDeploy "############# Mobile Developer #############"
echo -n "Do you wish to install Mobile Developer Tools (${bold}${green}y${reset}/${bold}${red}n${reset})? "
read MobileDeveloper

CaskMobileDeveloperToolList=(
    fastlane
)
if [ "$MobileDeveloper" != "${MobileDeveloper#[Yy]}" ] ;then
    echo Yes
    brew install --cask ${CaskMobileDeveloperToolList[@]}
else
    echo No
fi

############# Python Developer #############
beginDeploy "############# Python Developer #############"
echo -n "Do you wish to install Python Developer Tools (${bold}${green}y${reset}/${bold}${red}n${reset})? "
read PythonDeveloper

PythonDeveloperToolList=(
    pyenv pyenv-virtualenv
    isort
    python-yq
)

if [ "$PythonDeveloper" != "${PythonDeveloper#[Yy]}" ] ;then
    echo Yes
    brew install ${PythonDeveloperToolList[@]}
else
    echo No
fi


############# Developer Utilities #############
beginDeploy "############# Developer Utilities #############"
echo -n "Do you wish to install Developer Utilities (${bold}${green}y${reset}/${bold}${red}n${reset})? "
read DeveloperUtilities

DeveloperUtilitiesList=(
    tree
    ctop
    jq
    httpie
    yarn
    yarn-completion
    netcat
    nmap
    wget
    go
    nvm
    bash-completion
)
CaskDeveloperUtilitiesList=(
    cheatsheet
    spectacle
    postman
    dotnet-sdk
    wireshark
    iterm2
    # google-chrome-canary
    # firefox-developer-edition
)
if [ "$DeveloperUtilities" != "${DeveloperUtilities#[Yy]}" ] ;then
    
    echo Yes
    brew install ${DeveloperUtilitiesList[@]}
    brew install --cask ${CaskDeveloperUtilitiesList[@]}


    mkdir ~/.nvm
    echo '
    # NVM CONFIG
    export NVM_DIR="$HOME/.nvm"
        [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
        [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion' >> ~/.bash_profile


    echo '
    # BASH-COMPLETION CONFIG
    [[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"' >> ~/.bash_profile


    curl -s "https://get.sdkman.io" | bash
    echo '
    # THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
    export SDKMAN_DIR="/Users/mpatel/.sdkman"
    [[ -s "/Users/mpatel/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"' >> ~/.bash_profile
else
    echo No
fi


############# Database Tools #############
beginDeploy "############# Database Tools #############"
echo -n "Do you wish to install Database Tools (${bold}${green}y${reset}/${bold}${red}n${reset})? "
read Database


DatabaseToolList=(
    kafkacat
)
CaskDatabaseToolList=(
    pgadmin4
    #studio-3t
    #graphiql
    azure-data-studio
)
if [ "$Database" != "${Database#[Yy]}" ] ;then
    echo Yes
    brew install ${DatabaseToolList[@]}
    brew install --cask ${CaskDatabaseToolList[@]}

else
    echo No
fi


############# IDEs #############
beginDeploy "############# IDEs #############"
echo -n "Do you wish to install IDEs (${bold}${green}y${reset}/${bold}${red}n${reset})? "
read IDEs

CaskIDEsList=(
    visual-studio-code
    #intellij-idea
    #visual-studio
    #android-studio
)
if [ "$IDEs" != "${IDEs#[Yy]}" ] ;then
    echo Yes
    brew install --cask --appdir="/Applications" ${CaskIDEsList[@]}
    cat vscode-extensions.txt | xargs -L1 code --install-extension
else
    echo No
fi


############# DevOps #############
beginDeploy "############# DevOps #############"
echo -n "Do you wish to install DevOps Tools (${bold}${green}y${reset}/${bold}${red}n${reset})? "
read DevOps


DevOpsToolList=(
    terraform
    vault
    consul
    nomad
    packer
    terragrunt
    ansible
    awscli
    aws-sam-cli
    kompose
    kubernetes-cli
)
CaskDevOpsToolList=(
    vagrant
    vmware-fusion
    virtualbox
    docker
    vagrant-manager
    openlens
)
if [ "$DevOps" != "${DevOps#[Yy]}" ] ;then
    echo Yes
    brew install ${DevOpsToolList[@]}
    brew install --cask ${CaskDevOpsToolList[@]}

    ## DOCKER APP
    wget -P ~/Downloads/ https://github.com/docker/app/releases/download/v0.6.0/docker-app-darwin.tar.gz
    tar -xvf ~/Downloads/docker-app-darwin.tar.gz -C ~/Downloads/
    mv ~/Downloads/docker-app-darwin /usr/local/bin/docker-app
    rm ~/Downloads/docker-app-darwin.tar.gz


    ## Install AWS CLI
    #pip3 --version
    #curl -O https://bootstrap.pypa.io/get-pip.py
    #python3 get-pip.py --user
    #pip3 install awscli --upgrade --user
    aws --version
    #rm get-pip.py


    curl "https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-macos.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    aws2 --version
else
    echo No
fi


############# Productivity Tools #############
beginDeploy "############# Productivity Tools #############"
echo -n "Do you wish to install Productivity Tools (${bold}${green}y${reset}/${bold}${red}n${reset})? "
read Productivity

CaskProductivityToolList=(
    slack
    evernote
    the-unarchiver
    dash
    gpg-suite
    microsoft-teams
    microsoft-office
    bitwarden
    #zoomus
)
if [ "$Productivity" != "${Productivity#[Yy]}" ] ;then
    echo Yes
    brew install --cask --appdir="/Applications" ${CaskProductivityToolList[@]}
else
    echo No
fi

############# Oh my ZSH #############
beginDeploy "############# Oh my ZSH #############"
echo -n "Do you wish to install Oh my ZSH (${bold}${green}y${reset}/${bold}${red}n${reset})? "
read OhMyZsh

OhMyZshToolList=(
    romkatv/powerlevel10k/powerlevel10k
    zsh-autosuggestions
    zsh-syntax-highlighting
)

if [ "$OhMyZsh" != "${OhMyZsh#[Yy]}" ] ;then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    brew install ${OhMyZshToolList[@]}
    p10k configure
else
    echo No
fi


############# Mac Application #############
beginDeploy "############# Mac Application #############"
echo -n "Do you wish to install Mac Application (${bold}${green}y${reset}/${bold}${red}n${reset})? "
read MacApplication

MacApplicationToolList=(
    409183694 # Keynote
    409203825 # Numbers
    409201541 # Pages
    497799835 # Xcode
    1450874784 # Transporter
    1274495053 # Microsoft To Do
    1295203466 # Microsoft Remote Desktop 10
    985367838 # Microsoft Outlook
)
if [ "$MacApplication" != "${MacApplication#[Yy]}" ] ;then
    brew install mas
    mas install ${MacApplicationToolList[@]}

    echo "######### Save screenshots to ${HOME}/Pictures/Screenshots"
    defaults write com.apple.screencapture location -string "${HOME}/Pictures/Screenshots"

    echo "######### Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF"
    defaults write com.apple.screencapture type -string "png"

else
    echo No
fi

beginDeploy "############# CLEANING HOMEBREW #############"
brew cleanup

beginDeploy "############# GLOBAL GIT CONFIG #############"
sh -c 'curl -s https://raw.githubusercontent.com/karolinachalupova/developer-mac-setup/master/.gitignore >> ~/.gitignore'
git config --global push.default current
git config --global core.excludesfile ~/.gitignore
git config --global user.name Karolina Chalupova
git config --global user.email chalupova.karolina@gmail.com
git config --global color.branch auto
git config --global color.diff auto
git config --global color.interactive auto
git config --global color.status auto

beginDeploy "############# ALIASES #############"
beginDeploy "############# GIT ALIASES #############"
sh -c 'curl -s https://raw.githubusercontent.com/karolinachalupova/developer-mac-setup/master/.git_aliases >> ~/.git_aliases'
source ~/.git_aliases

beginDeploy "############# DOCKER ALIASES #############"
sh -c 'curl -s https://raw.githubusercontent.com/karolinachalupova/developer-mac-setup/master/.docker_aliases >> ~/.docker_aliases'
source ~/.docker_aliases

beginDeploy "############# K8s ALIASES #############"
sh -c 'curl -s https://raw.githubusercontent.com/karolinachalupova/developer-mac-setup/master/.kubectl_aliases >> ~/.kubectl_aliases'
source ~/.kubectl_aliases

beginDeploy "############# SETUP BASH PROFILE #############"
source ~/.bash_profile

beginDeploy "############# SETUP OH MY ZSH #############"
sh -c 'curl -s https://raw.githubusercontent.com/karolinachalupova/developer-mac-setup/master/.zshrc >> ~/.zshrc'
source ~/.zshrc

beginDeploy "############# SETUP POWERLEVEL10k #############"
sh -c 'curl -s https://raw.githubusercontent.com/karolinachalupova/developer-mac-setup/master/.p10k.zsh >> ~/.p10k.zsh'

runtime=$((($(date +%s)-$start)/60))
beginDeploy "############# Total Setup Time ############# $runtime Minutes"
