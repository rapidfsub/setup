eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(direnv hook zsh)"
eval "$(zoxide init zsh)"

export ASDF_DATA_DIR="$HOME/.asdf"
export PATH="$ASDF_DATA_DIR/shims:$PATH"
export ERL_AFLAGS="-proto_dist inet6_tcp"
# eval "$(vfox activate zsh)"

export PATH="/Applications/Postgres.app/Contents/Versions/17/bin:$PATH"

function c {
  pushd . &>/dev/null
  z $1 &>/dev/null
  vsc $(ls | grep -m 1 .code-workspace || echo ".")
  popd &>/dev/null
}
