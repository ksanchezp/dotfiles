#!/bin/bash

git config --global core.excludesfile ${HOME}/.gitignoreglobal
git config --global user.email ${_git_email}
git config --global user.name ${_git_user}
git config --global init.defaultBranch main
git config --global pull.rebase true

git config --global alias.lg "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
