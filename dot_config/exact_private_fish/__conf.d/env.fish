
set -x VIMRC "$VIMCONFIG/vimrc"
set -x PAGER "delta --no-gitconfig"

set -x EDITOR "/bin/nvim"

set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_CACHE "$HOME/.cache"
set -x XDG_MUSIC_DIR "$HOME/media/music"
set -x XDG_VIDEOS_DIR "$HOME/media/videos"
set -x XDG_PICTURES_DIR "$HOME/pix"

set -x TERM "xterm-256color"
set -x LANG "en_US.UTF-8"

set -x FZF_DEFAULT_OPTS "\
  --color=spinner:#F5E0DC,hl:#F38BA8 \
  --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
  --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
  --color=border:#6C7086,label:#CDD6F4 \
  --layout reverse \
  --color dark \
  --cycle"

set -x TERMINAL foot --config ~/.config/foot/foot-scratchpad.ini 
set -x PYTHON_HISTORY "$XDG_CACHE/pythonhistory"

