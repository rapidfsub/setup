alias dr := devall-rift-resample
alias drr := devall-rift-reseed
alias drsd := devall-rift-sample-dump
alias drsr := devall-rift-sample-restore
alias dsw := devall-server-and-worker
alias dbs := devall-bard-server
alias dbw := devall-bard-worker

[no-cd]
devall-rift-resample:
  ENABLE_WEB=false ENABLE_WORKER=true mix rift.resample

[no-cd]
devall-rift-reseed:
  mix rift.reseed

[no-cd]
devall-rift-sample-dump: devall-rift-resample
  mix rift.sample.dump

[no-cd]
devall-rift-sample-restore:
  mix rift.sample.restore

[no-cd]
devall-server-and-worker:
  ./etc/cloudflared/start.sh minsub
  ./etc/docker-compose-dev.sh
  ENABLE_WEB=true ENABLE_WORKER=true iex --name test@::1 --cookie mycookie -S mix phx.server

[no-cd]
devall-bard-server:
  ./etc/cloudflared/start.sh minsub
  ENABLE_WEB=true ENABLE_WORKER=false iex --name bard-server@::1 --cookie mycookie -S mix phx.server

[no-cd]
devall-bard-worker:
  ./etc/docker-compose-dev.sh
  ENABLE_WEB=false ENABLE_WORKER=true iex --name bard-worker@::1 --cookie mycookie -S mix
