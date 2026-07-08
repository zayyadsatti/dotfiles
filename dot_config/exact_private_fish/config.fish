# source /usr/share/cachyos-fish-config/cachyos-config.fish

for i in $__fish_config_dir/__conf.d/* $__fish_config_dir/completions/*
  source $i
end

function fish_greeting 
end

