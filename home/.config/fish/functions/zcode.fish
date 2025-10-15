function zcode
    argparse 'c/command=' -- $argv

    begin
        pushd .
        z $argv
        $_flag_command (ls | rg -m 1 '.code-workspace' || echo '.')
        popd
    end &>/dev/null
end
