#!/bin/bash

# Create virtual links between what is inside the base folder in this project and the parent's current dir (usually HOME)
stow base

{
    echo '## Source all bash configuration files inside ~/.bash_config directory'
    echo 'source_all_files () {'
    echo '  if [[ -n "$(ls -A ./)" ]]; then # If current directory is not empty'
    echo '    for file in ./*; do'
    echo '      if [[ -d ${file} ]]; then	# If current file is a directory'
    echo '        cd ${file}'
    echo '        source_all_files'
    echo '      else'
    echo '        source ${file}'
    echo '      fi'
    echo '    done'
    echo '  fi'
    echo '}'
    echo ''
    echo ''
    echo '# [WARNING] All files and directories in this directory will be sourced (which'
    echo '# is, imported) recursively. If you change this value, do it carefully.'
    echo ''
    echo 'bash_config_dir="${HOME}/.bash_config"'
    echo ''
    echo 'current_directory=$(pwd)'
    echo 'if [[ -d "${bash_config_dir}" ]]; then	# If bash_config dir exists'
    echo '  cd ${bash_config_dir}'
    echo '  source_all_files'
    echo 'fi'
    echo ''
    echo 'cd ${current_directory}'
} >> ~/.zshrc
