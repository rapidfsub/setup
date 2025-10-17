alias mai := mix-archive-install-hex
alias mc := mix-compile
alias mcf := mix-compile-force
alias mdc := mix-deps-compile
alias mdcg := mix-deps-clean-get-compile
alias mdg := mix-deps-get
alias mf := mix-format
alias mps := mix-phx-server
alias mt := mix-test
alias im := iex-mix
alias imps := iex-mix-phx-server

mix-archive-install-hex args:
  mix archive.install hex {{args}}

[no-cd]
mix-compile:
  mix compile

[no-cd]
mix-compile-force:
  mix compile --force

[no-cd]
mix-deps-compile args:
  mix deps.compile {{args}}

[no-cd]
mix-deps-clean-get-compile args:
  mix deps.clean {{args}}
  mix deps.get {{args}}
  mix deps.compile {{args}}

[no-cd]
mix-deps-get *args:
  mix deps.get {{args}}

[no-cd]
mix-format:
  mix format

[no-cd]
mix-phx-server:
  mix phx.server

[no-cd]
mix-test:
  mix test

[no-cd]
iex-mix:
  iex --name test@::1 --cookie mycookie -S mix

[no-cd]
iex-mix-phx-server:
  iex --name test@::1 --cookie mycookie -S mix phx.server
