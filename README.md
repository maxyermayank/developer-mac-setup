# **Mac Setup for Developers**
Set of Scripts and Documentation to setup Mac as Development Environment


# **Prerequisite**
- Make sure you have admin permission to execute the script to install all the development tools.
- Bash
- Git client to clone this repository. If you do not have Git then you can simply download the repository.
- Comment/Uncomment tools in the script per your need.

Start with this Amazing .bash_profile [MAC OSX BASH PROFILE](https://natelandau.com/my-mac-osx-bash_profile/)

# **Make sure Script have Execution Permission**
```
chmod +x macSetup.sh
```

# **Execute Script to begin Setup**
```
./macSetup.sh
```


## **Install Homebrew & Cask**
- [x] [Homebrew](https://brew.sh)
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
```

## **Update Homebrew**
```
brew update
```

## **Install Mac Command Line Tools**
```
xcode-select --install
```

## **Install Browsers**
- [x] [Google Chrome](https://www.google.com/chrome/)
- [ ] [Google Chrome Canary](https://www.google.com/chrome/canary/)
- [x] [Firefox](https://www.mozilla.org/en-US/firefox/new/)
- [ ] [Firefox Developer Edition](https://www.mozilla.org/en-US/firefox/developer/)
```
brew cask install google-chrome
brew cask install firefox
# brew cask install google-chrome-canary
# brew cask install firefox-developer-edition
```


## **Install HashiCorp Tools**
- [x] [Terraform](https://www.terraform.io)
- [x] [Vault](https://www.vaultproject.io)
- [x] [Consul](https://www.consul.io)
- [x] [Packer](https://www.packer.io)
- [x] [Nomad](https://www.nomadproject.io)
- [x] [Vagrant](https://www.vagrantup.com)
```
brew install terraform
brew install vault
brew install consul
brew install nomad
brew install packer
brew cask install vagrant
```


## **Install Virtualization Tools**
- [x] [VMWare Fusion](https://www.vmware.com/products/fusion.html)
- [x] [Oracle Virtualbox](https://www.virtualbox.org)
- [x] [Docker](https://www.docker.com)
- [x] [Vagrant Manager](http://vagrantmanager.com)
```
brew cask install vmware-fusion
brew cask install virtualbox
brew cask install docker
brew cask install vagrant-manager
```


## **Install IDEs (Intellij, Visual Studio, Visual Studio Code, Android Studio)**
- [x] [Intellij](https://www.jetbrains.com/idea/)
- [x] [Visual Studio](https://visualstudio.microsoft.com)
- [x] [Visual Studio Code](https://code.visualstudio.com)
- [x] [Android Studio](https://developer.android.com/studio)
```
brew cask install visual-studio-code
brew cask install intellij-idea
brew cask install visual-studio
brew cask install android-studio
```

# **Install important Visual Studio Code Extensions**
If you want to add any new extension besides all the ones listed below then update vscode-extensions.txt before executing script.
- [x] [GitLens — Git supercharged](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
- [x] [GitHub](https://marketplace.visualstudio.com/items?itemName=KnisterPeter.vscode-github)
- [x] [Live Share](https://marketplace.visualstudio.com/items?itemName=MS-vsliveshare.vsliveshare)
- [x] [Quokka.js](https://marketplace.visualstudio.com/items?itemName=WallabyJs.quokka-vscode)
- [x] [Bracket Pair Colorizer](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer)
- [x] [Visual Studio IntelliCode](https://marketplace.visualstudio.com/items?itemName=VisualStudioExptTeam.vscodeintellicode)
- [x] [Terraform](https://marketplace.visualstudio.com/items?itemName=mauve.terraform)
- [x] [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
- [x] [Live Server](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer)
- [x] [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
- [x] [Path Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense)
- [x] [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- [x] [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one)
- [x] [open-in-browser](https://marketplace.visualstudio.com/items?itemName=techer.open-in-browser)
- [x] [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)
- [x] [Auto Rename Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-rename-tag)
- [x] [Auto Close Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-close-tag)
- [x] [Polacode](https://marketplace.visualstudio.com/items?itemName=pnp.polacode)
- [x] [Code Runner](https://marketplace.visualstudio.com/items?itemName=formulahendry.code-runner)
- [x] [Paste JSON as Code](https://marketplace.visualstudio.com/items?itemName=quicktype.quicktype)
- [x] [TODO Highlight](https://marketplace.visualstudio.com/items?itemName=wayou.vscode-todo-highlight)
- [x] [npm](https://marketplace.visualstudio.com/items?itemName=eg2.vscode-npm-script)
- [x] [Regex Previewer](https://marketplace.visualstudio.com/items?itemName=chrmarti.regex)
- [x] [Git History](https://marketplace.visualstudio.com/items?itemName=donjayamanne.githistory)
- [x] [AWS Toolkit for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=AmazonWebServices.aws-toolkit-vscode)
- [x] [C#](https://marketplace.visualstudio.com/items?itemName=ms-vscode.csharp)
```
cat ./vscode-extensions.txt | xargs -L1 code --install-extension
```

## **Install AWS Tools**
- [x] [AWS CLI](https://aws.amazon.com/cli/)
- [x] [SAM CLI](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html)
```
pip3 --version
curl -O https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py --user
pip3 install awscli --upgrade --user
aws --version
rm get-pip.py

brew tap aws/tap
brew install aws-sam-cli
sam --version
```

## **Install Developer Utilities**
- [x] [SDKMan](https://sdkman.io)
- [x] [Spectacle](https://www.spectacleapp.com)
- [x] [Tree]()
- [x] [Ctop](https://ctop.sh)
- [x] [jq](https://stedolan.github.io/jq/)
- [x] [Postman](https://www.getpostman.com)
- [x] [httpie](https://httpie.org)
- [x] [NVM](https://github.com/nvm-sh/nvm)
- [x] [Bash Completion](https://github.com/scop/bash-completion)
```
curl -s "https://get.sdkman.io" | bash
brew cask install spectacle
brew install tree
brew install ctop
brew install jq
brew cask install postman
brew install httpie

brew install nvm
mkdir ~/.nvm
## TO DO Add to .bash_profile

brew install bash-completion
## TO DO Add to .bash_profile
```

## **Install Language SDKs/Platforms**
- [x] [Dotnet SDK](https://dotnet.microsoft.com/download)
- [x] [Go](https://golang.org)
```
brew cask install dotnet-sdk
brew cask install go
```

## **Install Database Tools**
- [x] [PGAdmin](https://www.pgadmin.org)
- [x] [Mongo Studio 3T](https://studio3t.com)
```
brew cask install pgadmin4
brew cask install studio-3t
```


## **Install Productivity Tools**
- [x] [Slack](https://slack.com)
- [x] [Evernote](https://evernote.com)
- [x] [The Unarchiver](https://theunarchiver.com)
- [x] [CheatSheet](https://mediaatelier.com/CheatSheet/)
- [x] [Adobe Creative Cloud](https://www.adobe.com/creativecloud.html)
```
brew cask install slack
brew cask install evernote
brew cask install the-unarchiver
brew cask install cheatsheet
brew cask install adobe-creative-cloud
```


## **Global Git Config**
```
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
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue <%an>%Creset' --abbrev-commit --date=relative"
```

## **Setup Docker Aliases**
```
alias dps='docker ps -a'
alias di='docker images -a'
alias dv='docker volume ls'
alias dn='docker network ls'
alias sprune='docker system prune'
alias vprune='docker volume prune'
```

## **Docker Swarm Aliases**
```
alias dstr='docker stack rm'
alias dsls='docker service ls'
alias dsp='docker service ps'
alias dsl='docker service logs'
alias dsr='docker service rm'
```

# **Resources**
- [MAC OSX BASH PROFILE](https://natelandau.com/my-mac-osx-bash_profile/)
- [New MacBook Setup for Developers by Dan Vega](https://dev.to/therealdanvega/new-macbook-setup-for-developers-2nma)