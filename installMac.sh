#!/bin/bash

# Config, change at will
export _git_email=
export _git_user=
export company=

# Homebrew
if ! which brew > /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add to PATH, required by homebrew
    echo >> ${HOME}/.zprofile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ${HOME}/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# SDKMAN
if ! which sdk > /dev/null; then
    curl -s "https://get.sdkman.io" | bash
    source "${HOME}/.sdkman/bin/sdkman-init.sh"
fi

# JAVA 8, 11 and 21
if ! which java > /dev/null; then
    java_jdk_8=javajdk8.pkg
    java_jdk_11=javajdk11.pkg
    java_jdk_21=javajdk21.pkg

    curl -o ${java_jdk_8} -LO https://corretto.aws/downloads/latest/amazon-corretto-8-x64-macos-jdk.pkg
    curl -o ${java_jdk_11} -LO https://corretto.aws/downloads/latest/amazon-corretto-11-x64-macos-jdk.pkg
    curl -o ${java_jdk_21} -LO https://corretto.aws/downloads/latest/amazon-corretto-21-x64-macos-jdk.pkg
    
    sudo installer -pkg ./${java_jdk_8} -target /
    sudo installer -pkg ./${java_jdk_11} -target /
    sudo installer -pkg ./${java_jdk_21} -target /
    rm ${java_jdk_8} ${java_jdk_11} ${java_jdk_21}

    sdk install java 8-amzn /Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
    sdk install java 11-amzn /Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home
    sdk install java 21-amzn /Library/Java/JavaVirtualMachines/amazon-corretto-21.jdk/Contents/Home

    sdk default java 21-amzn
fi

# Terminal utils
brew install tree ncdu stow wget
brew install --cask iterm2
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# NVM, NPM and Node
brew install nvm
nvm install 20
nvm install 22
nvm alias default 22

# IDEs
brew install --cask intellij-idea-ce webstorm visual-studio-code phpstorm

# Fork
brew install --cask fork

# Browsers
brew install --cask chrome firefox

# Docker
brew install --cask docker

# K8s and company
brew install kubectl k9s helm

# Spotify
brew install --cask spotify

# Communication
brew install --cask mattermost
#brew install --cask slack

# Virtual Machines
brew install virtualbox vagrant

# VPN
brew install --cask tunnelblick

# Proxy
brew install squid
brew install --cask squidman

# AWS
brew install awscli

# DB
brew install --cask mysqlworkbench

# API management
brew install --cask bruno

# Chats
brew install --cask telegram whatsapp

# Zim, alternative to Oh My ZSH
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh

# Terminal automation
brew install expect

# SSH key
ssh-keygen -f ~/.ssh/id_ed25519_${company} -t ed25519 -N "" -q

sh ./scripts/setupGit.sh
sh ./scripts/setupLinks.sh
