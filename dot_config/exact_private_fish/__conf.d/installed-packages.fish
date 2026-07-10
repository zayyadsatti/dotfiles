
function list_installed
  set --local pkg (pacman -Qq  | fzf)
  test -z "$pkg" && return 
  pacman -Qi "$pkg" | bat 
end

