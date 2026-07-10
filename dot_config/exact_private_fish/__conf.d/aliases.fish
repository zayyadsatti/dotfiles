
# git aliases
abbr --add gs git status

abbr --add cls clear
abbr --add --position anywhere md mkdir -vp

# pacman aliases
abbr --add install "sudo pacman -S"
abbr --add remove "sudo pacman -Rns"
abbr --add search "pacman -Ss"

abbr --add --position anywhere ls eza -ls type
abbr --add --position anywhere la eza -las type
abbr --add --position anywhere lD eza -lds modified
abbr --add --position anywhere ld eza -lDs modified
# mindepth to make find don't print directory in which we are searching
abbr --add --position anywhere ld. find . -maxdepth 1 -mindepth 1 -type d -name '".*"' -exec eza -ld --sort modified {} +
abbr --add --position anywhere ls. find . -maxdepth 1 -mindepth 1 ! -type d -name '".*"' -exec eza -l --sort type {} +

abbr --add --position anywhere mv 'mv -v'
abbr --add --position anywhere cp 'cp -v'
abbr --add --position anywhere rm 'rm -v'
abbr --add --position anywhere rmd 'rmdir -v'

abbr --add --position anywhere cat 'bat -P'

abbr --add rename perl-rename

