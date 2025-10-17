alias bb := brew-bundle
alias bd := brew-dump
alias bi := brew-install
alias bmb := brew-mas-bundle
alias bmd := brew-mas-dump
alias bmi := brew-mas-install

brew-bundle:
  brew bundle --file=~/setup/brewfiles/Brewfile --cleanup --zap

brew-dump:
  brew bundle dump --file=~/setup/brewfiles/Brewfile --formula --cask --tap --force

brew-install args: && brew-dump
  brew install {{args}}

brew-mas-bundle:
  brew bundle --file=~/setup/brewfiles/mas/Brewfile

brew-mas-dump:
  brew bundle dump --file=~/setup/brewfiles/mas/Brewfile --mas --force

brew-mas-install args: && brew-mas-dump
  mas install {{args}}
