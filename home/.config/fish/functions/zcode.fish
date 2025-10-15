function zcode
    argparse 'c/command=' -- $argv

    begin
        pushd .
        cd $argv
        or z $argv
        and $_flag_command (ls | rg -m 1 '.code-workspace' || echo '.')
        popd
    end &>/dev/null
end
