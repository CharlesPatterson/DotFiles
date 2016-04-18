#!/bin/sh
brew update; brew cleanup; brew cask cleanup
brew uninstall --force brew-cask; brew update
