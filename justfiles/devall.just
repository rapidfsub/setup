alias gm := mix-ash-codegen
alias rr := rift-redemo
alias rdd := rift-demo-dump
alias rdr := rift-demo-restore

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
