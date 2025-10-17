alias rr := rift-redemo
alias rdd := rift-demo-dump
alias rdr := rift-demo-restore

[no-cd]
rift-redemo:
  mix rift.redemo

[no-cd]
rift-demo-dump:
  mix rift.demo.dump

[no-cd]
rift-demo-restore:
  mix rift.demo.restore
