
function scripts_path
  echo "$HOME/.local/bin"\n"$HOME/dev/active/scripts/"
end

function is_script
  file $argv[1] | string match -rq 'script' &>/dev/null
end

function local_scripts_fd
  for i in (fd . (scripts_path) -tf --hidden --no-global-ignore-file -E '.git')
    if is_script "$i"
      echo "$i"
    end
  end
end

function local_scripts_file 
  local_scripts_fd | fzf --preview "bat  --style=numbers --line-range=:300 {} 2>/dev/null" \
    --preview-window "up,60%"
end

function local_scripts
  local_scripts_fd | fzf --preview "bat  --style=numbers --line-range=:300 {} 2>/dev/null" \
    --preview-window "up,60%" \
    --bind "enter:become(nvim {} +{2})"
end

function local_scripts_rg
  rg_search_generic "$(local_scripts_fd)" 'scripts'
end
