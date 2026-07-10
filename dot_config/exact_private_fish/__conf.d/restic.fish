function restic_snaps
	resticprofile --quiet snapshots --json | jq '.[].short_id' -r
end

function restic_ls_cur
	# todo: maybe parse profile.toml or parse output of resticprofile show
  set -l backed_up_dir ~/books/ ~/dev ~/dotfiles/ ~/media/ ~/notes/ ~/pix/
  # as restic ls or find print directories without leading / so trim that
  fd . $backed_up_dir | sed 's#/$##'
end

function restic_ls
  set -l arg_count (count $argv)
	if test "$arg_count" -ne 1
		echo "Expected Arguments 1. Found  $arg_count" >&2
		echo 'Usage: restic_ls <SNAPSHOT_ID>' >&2
		return 1
	end

  resticprofile --quiet ls "$argv[1]" --quiet
end

# with no args: do difference of latest snapshot and current directory
# with 1 arg: do difference of provided snapshot and current directory
# with 2 arg: do difference of first and second snapshot

function restic_diff
  set -l arg_count (count $argv)

  if test $arg_count -eq 0
    set selected_snap (restic_snaps | tail -1)
    set cmd_to_exec restic_ls_cur
  else if test $arg_count -eq 1
    set selected_snap $argv[1]
    set cmd_to_exec restic_ls_cur
  else if test $arg_count -eq 2
    set selected_snap $argv[1]
    set cmd_to_exec "restic_ls $argv[2]"
  else
    echo 'Usage: restic_diff <snapshot 1> <snapshot 2>' >&2
    return 1
  end

	# reason: we are doing difference of latest snapshot with current directory, e.t.c
	# todo: fallback to diff if delta not avail
  restic_ls $selected_snap | delta (eval $cmd_to_exec | psub) -
end

