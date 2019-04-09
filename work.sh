#!/bin/sh


# start out with homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# base packages
brew install awscli \
             fzf \
             gnupg2 \
             kops \
             kube-ps1 \
             kubectx \
             kubernetes-cli \
             kubernetes-helm \
             python2 \
             python3 \
             watch \ 
             zsh

# cask packages
brew cask install 1password \
                  alfred \
                  aviatrix-vpn-client \
                  google-chrome \
                  zoomus \
                  slack

# and enable AWS stuffs
sudo pip install aws-google-auth

# enable fuzzy finder
$(brew --prefix)/opt/fzf/install

# install helm locally and add the 'edit' plugin
helm init --client-only
helm plugin install https://github.com/mstrzele/helm-edit