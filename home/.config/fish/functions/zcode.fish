function zcode
    argparse 'c/command=' -- $argv
    set -l dst (zoxide query $argv 2>/dev/null)

    if string match -q -r '\S' $dst
        begin
            pushd .
            cd $dst
            $_flag_command (ls | rg -m 1 '.code-workspace' || echo '.')
            popd
        end &>/dev/null
    else
        $_flag_command $argv
    end
end
