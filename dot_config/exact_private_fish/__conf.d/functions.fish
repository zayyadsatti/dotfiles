

function mkcd 
  if test -z "$argv[1]"
    echo "usage: mkcd <dir_to_create>" >&2
    return 1
  end

  mkdir "$argv[1]" && cd "$argv[1]"
end

function replace
	set __num_args "$(count $argv)"
	if test "$__num_args" -ne 2
		echo "Extra Arguments. Expected 2 found $__num_args" >&2
		echo "Usage: <TO_MATCH> <TO_REPLACE>" >&2
		return 1
	end

  wl-paste | string replace --all --regex -- "$argv[1]" "$argv[2]" | wl-copy
end

function copy
  echo $argv | wl-copy
end

function touch
  if [ -z "$argv[-1]" ]
    echo 'usage: touch <path_to_file_to_create>' >&2
    return 1
  end

  # todo: add support for flags
  
  set -l exit_code 0
  for i in $argv
    if string match --regex --quiet -- '/$' "$i"
      echo "expected file. Found directory: $i"
      set exit_code 1
      continue
    end

    set __dir_path (path dirname -- "$i")
    [ -d "$__dir_path" ] || mkdir --parents "$__dir_path" 
    command touch "$i"
  end

  return "$exit_code"
end

