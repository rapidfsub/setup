import '~/setup/justfiles/brew.just'
import '~/setup/justfiles/chezmoi.just'
import '~/setup/justfiles/mix.just'
import '~/setup/justfiles/nix.just'
import '~/setup/justfiles/r.just'
import '~/setup/justfiles/yes24.just'

import '~/setup/justfiles/devall.just'

alias s := setup

setup: && chezmoi-apply brew-bundle nix-flake-update
