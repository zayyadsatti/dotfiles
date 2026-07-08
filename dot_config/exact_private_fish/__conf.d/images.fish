
# target picture directory
set __tar_pix_dir "$HOME/pix/photos" 

function __img_move
  set __now_in_fmt (date +'%Y-%m-%d')
  if [ -z "$argv[1]" ] 
    echo 'usage: <src-path> <dest-name>' >&2
    return
  end

  if [ -z "$argv[2]" ] 
    echo 'missing destination path' >&2
    return
  end

  mv -vn "$argv[1]" "$__tar_pix_dir/$__now_in_fmt$argv[2]"
end

function __img_move_probe
  if [ -z "$argv[1]" ] 
    echo 'usage: <src-path> <dest-name>' >&2
    return
  end

  if [ -z "$argv[2]" ] 
    echo 'missing destination path' >&2
    return
  end

  set __now_in_fmt (date +'%Y-%m-%d')
  set -l __probe_idx $(count $__tar_pix_dir/$__now_in_fmt-$argv[2]*) 
  if test "$__probe_idx" -eq 0
    set __probe_idx 
  end

  set --local __res_path "$__tar_pix_dir/$__now_in_fmt-$argv[2]$__probe_idx$(path extension $argv[1])"
  mv -nv "$argv[1]" "$__res_path"
end

function __img_move_probe_bulk
  for i in (seq 2 (count $argv))
    __img_move_probe "$argv[$i]" "$argv[1]"
  end
end
