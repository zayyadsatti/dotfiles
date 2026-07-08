
def __nu_open_file [] {
  commandline edit --insert (
    fd --base-directory ~ -tf |
      fzf --multi --style minimal --height 40% |
      sed -r $"s#\(.*\)#"($env.HOME)/\\1"#" |
      tr '\n' ' '
  )
}

$env.config.keybindings ++= [{
  name: list-file
  modifier: control
  keycode: char_t
  mode: emacs
  event: {
    send: executehostcommand
    cmd: __nu_open_file
  }
}]

