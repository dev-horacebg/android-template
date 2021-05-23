#!/usr/bin/env bash
#
# Brew: package manager for macOS (https://brew.sh/)
#
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#
# Binaries

# Wget: package to download files from command line (https://www.gnu.org/software/wget/)
brew install wget
# Kotlin: command line tools for Kotlin (https://kotlinlang.org/docs/tutorials/command-line.html)
brew install kotlin
# TLDR: command to simplify the man pages (https://github.com/tldr-pages/tldr)
brew install tldr
# Autojump: command to navigate the filesystem (https://github.com/wting/autojump)
brew install autojump
# Scrpy: command to display the screen of a connected Android device (https://github.com/Genymobile/scrcpy)
brew install scrcpy

#
# Apps
#
# Java SDK 8 (https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
# brew cask install java8
# Android Studio (https://developer.android.com/studio)

brew cask install android-studio
# Android Platform Tools (https://developer.android.com/studio/releases/platform-tools)
brew cask install android-platform-tools
# IntelliJ Idea Community Edition (https://www.jetbrains.com/idea/)
brew cask install intellij-idea-ce

# Atom: text editor (https://atom.io/)
brew cask install atom
# Sublime Text: text editor (https://www.sublimetext.com/)
brew cask install sublime-text
# Macdown: open source markdown editor (https://github.com/MacDownApp/macdown)
brew cask install macdown
# iTerm2: terminal with extra features (https://www.iterm2.com/)
brew cask install iterm2
# Charles Proxy: http proxy/monitor (https://www.charlesproxy.com/)
brew cask install charles
# Postman: tool to manage APIs (https://www.getpostman.com/)
brew cask install postman
# Google Chrome (https://www.google.co.uk/chrome/)
brew cask install google-chrome
# Brave browser (https://www.brave.com/)
brew cask install brave-browser
# Slack macOS client (https://slack.com/intl/en-gb/downloads/mac)
brew cask install slack
# Figma: collaboration tool for designers/developers (https://zeplin.io/)
brew cask install figma
# Spotify (https://www.spotify.com/uk/download/mac/)
brew cask install spotify
# Appcleaner: to clean uninstall apps (https://freemacsoft.net/appcleaner/)
brew cask install appcleaner
# 1Password: Password manager
brew cask install 1password

brew install asdf
brew install android-sdk
brew install intel-haxm
brew install --cask homebrew/cask-versions/adoptopenjdk8

asdf plugin-add dart https://github.com/patoconnor43/asdf-dart.git
asdf plugin-add flutter
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git

asdf install dart latest
asdf install flutter latest
asdf install ruby latest
