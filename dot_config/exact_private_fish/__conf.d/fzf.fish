
function __fzf_list_files
  commandline --insert (
    fd --base-directory ~ -tf | \
      fzf --multi --height 60% | \
      string replace -r "(.*)" "\"$HOME/\1\"" | \
      string join ' ')
  commandline -f repaint
end

function __fzf_list_directories
  commandline --insert "\"$HOME/$(fd --base-directory ~ -td | fzf --height 60% --cycle)\""
  commandline -f repaint
end

function __fzf_list_directories_from_cwd
  commandline --insert "$(fd -td --hidden | fzf --height 60% --cycle)"
  commandline -f repaint
end

function __fzf_list_directories_and_cd
  set -l to_cd "$(fd --base-directory ~ -td | fzf --height 60% --cycle)"
  [ -n "$to_cd" ] && cd "$HOME/$to_cd"
  commandline -f repaint
end

function __fzf_list_directories_and_cd_from_cwd
  set -l to_cd "$(fd -td --hidden | fzf --height 60% --cycle)"
  [ -n "$to_cd" ] && cd "$to_cd"
  commandline -f repaint
end

bind ctrl-t __fzf_list_files

bind alt-t __fzf_list_directories_and_cd
bind alt-shift-t __fzf_list_directories

bind alt-c __fzf_list_directories_and_cd_from_cwd
bind alt-shift-c __fzf_list_directories_from_cwd
