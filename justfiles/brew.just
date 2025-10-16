alias bb := brew-bundle
alias bd := brew-dump
alias bi := brew-install

brew-bundle:
  brew bundle --file=~/setup/brewfiles/Brewfile --cleanup --zap

brew-dump:
  brew bundle dump --file=~/setup/brewfiles/Brewfile --formula --cask --tap --force

brew-install args: && brew-dump
  brew install {{args}}
