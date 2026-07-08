
# git aliases
abbr --add gs git status

abbr --add cls clear
abbr --add md mkdir -vp

# pacman aliases
abbr --add install "sudo pacman -S"
abbr --add remove "sudo pacman -Rns"
abbr --add search "pacman -Ss"

abbr --add ls eza -ls type 
abbr --add la eza -las type 
abbr --add lD eza -lds modified 
abbr --add ld eza -lDs modified
# mindepth to make find don't print directory in which we are searching
abbr --add ld. find . -maxdepth 1 -mindepth 1 -type d -name '".*"' -exec eza -ld --sort modified {} +
abbr --add ls. find . -maxdepth 1 -mindepth 1 ! -type d -name '".*"' -exec eza -l --sort type {} +

abbr --add mv 'mv -v'
abbr --add cp 'cp -v'
abbr --add rm 'rm -v'
abbr --add rmdir 'rmdir -v'

abbr --add cat 'bat -P'

abbr --add rename perl-rename

