
function kill_process
  if not contains (count $argv) 1 2
    echo 'usage <process_name> [signal number]' >&2
    return 1
  end

  set --local pid (ps -aux | awk '$NF == "$argv[1]" { print $2 }')

  if test -z $argv[2]
    kill $pid
  else
    kill --signal $argv[2] $pid
  end
end

