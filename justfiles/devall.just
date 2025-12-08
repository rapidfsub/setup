alias gm := mix-ash-codegen
alias rr := rift-redemo
alias rdd := rift-demo-dump
alias rdr := rift-demo-restore
alias rsw := run-server-worker
alias rbs := run-bard-server
alias rbw := run-bard-worker

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
run-server-worker:
  ENABLE_WEB=true ENABLE_WORKER=true iex --name test@::1 --cookie mycookie -S mix phx.server

[no-cd]
run-bard-server:
  ENABLE_WEB=true ENABLE_WORKER=false iex --name bard-server@::1 --cookie mycookie -S mix phx.server

[no-cd]
run-bard-worker:
  ENABLE_WEB=false ENABLE_WORKER=true iex --name bard-worker@::1 --cookie mycookie -S mix
