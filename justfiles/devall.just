alias gm := mix-ash-codegen
alias rr := rift-redemo
alias rdd := rift-demo-dump
alias rdr := rift-demo-restore
alias rww := run-web-worker
alias rws := run-web-server
alias rw := run-worker

[no-cd]
mix-ash-codegen args:
  mix ash.codegen {{args}}

[no-cd]
rift-redemo:
  mix rift.redemo

[no-cd]
rift-demo-dump: rift-redemo
  mix rift.demo.dump

[no-cd]
rift-demo-restore:
  mix rift.demo.restore

[no-cd]
run-web-worker:
  ENABLE_WEB=true ENABLE_WORKER=true iex --name test@::1 --cookie mycookie -S mix phx.server

[no-cd]
run-web-server:
  ENABLE_WEB=true ENABLE_WORKER=false iex -S mix phx.server

[no-cd]
run-worker:
  ENABLE_WEB=false ENABLE_WORKER=true iex --name test@::1 --cookie mycookie -S mix
