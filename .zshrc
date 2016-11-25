# -----------------------------------
# Oh-my-zsh Configuration
# -----------------------------------

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"

plugins=(git, osx)

source $ZSH/oh-my-zsh.sh

# Zsh syntax highlighting plugin
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# -----------------------------------
# Environment Variables
# -----------------------------------

export EDITOR=vim

export TERM=xterm-256color

export PATH="$(brew --prefix)/bin:$HOME/develop/tools:/usr/X11/bin/:$PATH"

export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_7_HOME=$(/usr/libexec/java_home -v1.7)
export JAVA_HOME=$JAVA_8_HOME

export PATH=$PATH:$JAVA_HOME/bin:$SCALA_HOME/bin:$HOME/develop/tools/ec2-api-tools-1.7.4.0/bin

# Docker
eval "$(docker-machine env default)"

# ------------------------------------
# Docker alias and function
# ------------------------------------

# Get latest container ID
alias dl="docker ps -l -q"

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpa="docker ps -a"

# Get images
alias di="docker images"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }

# Remove all containers
drm() { docker rm $(docker ps -a -q); }

# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Remove all images
dri() { docker rmi $(docker images -q); }

# Dockerfile build, e.g., $dbu tcnksm/test 
dbu() { docker build -t=$1 .; }

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Python
export PYTHONPATH=$PYTHONPATH:/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages
export PYTHONPATH=$PYTHONPATH:$PYTHONPATH/jedi


# ----------------------------------------
# Dev Server Alias and Configuration
# ----------------------------------------

alias devbox='ssh steveshi@dev-box.homelab.magkbdev.com'
