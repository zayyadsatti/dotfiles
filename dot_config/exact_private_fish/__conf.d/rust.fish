function get_idx
  for i in 1 2
    if string match -rq -- $argv[$i] "-i|--include-crate"
      echo $i
    end
  end
end

function path_to_rust
  set --local argc (count $argv)

  if test $argc -eq 1 
    path change-extension '' $argv[1] | sed 's/\//::/g'
    return 0
  end

  if [ $argc != 2 ]
    echo 'usage [-i|--include-crate] <path_to_rust_file>' >&2
    return 1
  end

  set -l idx (get_idx $argv)
  if test -z $idx
    echo 'usage [-i|--include-crate] <path_to_rust_file>' >&2
    return 1
  end

  if [ $idx -eq 1 ]
    set idx 2
  else
    set idx 1
  end

  if [ ! -f "Cargo.toml" ]
    echo 'No Cargo.toml found at current directory' >&2
    return 1
  end

  set -l lib_name (awk -F'"' '/^[[:space:]]*name/ { print $2 }' Cargo.toml ) 
  echo $lib_name::(path change-extension '' $argv[$idx] | sed 's/\//::/g')
end
