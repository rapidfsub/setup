function zcode
    argparse 'c/command=' -- $argv
    set -l dst (zoxide query $argv 2>/dev/null)

    if test -d $dst
        pushd .
        cd $dst
        $_flag_command (ls | rg -m 1 '.code-workspace' || echo '.')
        popd
    end &>/dev/null
end
