function __restic_snaps
  restic snapshots -c | awk "/$hostname/ { print \$1 }"
end

function __restic_ls_cur
  # as restic ls or find print directories without leading / so trim that
  fd . ~/books/ ~/dev ~/dotfiles/ ~/media/ ~/notes/ ~/pix/ --absolute-path | sed 's#/$##'
end

function __restic_ls
  # skip first line of restic details (+2), then /home (+3) 
  # then /home/$user (+4)

  restic ls $argv[1] | tail -n +4
end

# with no args: do difference of last snapshot and current directory 
# with 1 arg: do difference of that snapshot and current directory 
# with 2 arg: do difference of first and second snapshot

function __restic_diff
  set -l __cnt (count $argv)

  if test $__cnt -eq 0 
    set __snap_first (__restic_snaps | tail -1)
    set __cmd_sec __restic_ls_cur
  else if test $__cnt -eq 1
    set __snap_first $argv[1]
    set __cmd_sec __restic_ls_cur
  else if test $__cnt -eq 2
    set __snap_first $argv[1]
    set __cmd_sec "__restic_ls $argv[2]"
  else
    echo 'usage: __restic_diff <snapshot 1> <snapshot 2>' >&2
    return 1
  end

  __restic_ls $__snap_first | delta - (eval $__cmd_sec | psub)
end

