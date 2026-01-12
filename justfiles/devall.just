alias gm := mix-ash-codegen
alias rr := rift-resample
alias rrd := rift-sample-dump
alias rrr := rift-sample-restore
alias rsw := run-server-worker
alias rbs := run-bard-server
alias rbw := run-bard-worker

[no-cd]
mix-ash-codegen args:
  mix ash.codegen {{args}}

[no-cd]
rift-resample:
  mix rift.resample

[no-cd]
rift-sample-dump: rift-resample
  mix rift.sample.dump

[no-cd]
rift-sample-restore:
  mix rift.sample.restore

[no-cd]
run-server-worker:
  ENABLE_WEB=true ENABLE_WORKER=true iex --name test@::1 --cookie mycookie -S mix phx.server

[no-cd]
run-bard-server:
  ENABLE_WEB=true ENABLE_WORKER=false iex --name bard-server@::1 --cookie mycookie -S mix phx.server

[no-cd]
run-bard-worker:
  ENABLE_WEB=false ENABLE_WORKER=true iex --name bard-worker@::1 --cookie mycookie -S mix
