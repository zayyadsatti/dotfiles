
function dot_dirs
  set -l to_cd (fd . ~/.dotfiles --no-global-ignore-file --hidden -td --exclude '.git' | fzf)
  test -z "$to_cd" && return 
  cd $to_cd
end

function dot_files
  fd . ~/dotfiles --no-global-ignore-file --hidden -tf --exclude '.git' | fzf \
    --preview "bat  --style=numbers --line-range=:300 {} 2>/dev/null" \
    --preview-window "up,60%" \
    --bind "enter:become:nvim {1} +{2}" \
    --prompt '.files> '
end

