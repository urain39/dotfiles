export TERM=linux

# for NodeJS
export NODE_PATH=$PREFIX/lib/node_modules

# Drop current works, and force checkout last commit.
git_drop() {
  if [ ! -d .git ]; then
    echo "Not a git repo, give up."
    return
  fi

  rm -i -r * && git checkout -f HEAD
}

# EasyAria2Config
# Add ~/.local/bin
export PATH=$PATH:~/.local/bin

# Alias function(s)
rmedir() {
  ls -d * | while read dir; do
    if [ -d "$dir" ]; then
      cnt=$(ls "$dir" | wc -l)
      if [ "$cnt" -lt 1 ]; then
        rm -r "$dir"
      fi
    fi
  done && unset cnt && unset dir
}

## Init function(s)
_init_exec_() {
  test x"$1" = "x" && return

  # Support script its wrapped a command.
  case "$2" in
    "")
      prg="$1"
      # The non-wrapped command its wrapper it is itself.
      wrp="$1"
      ;;
    *)
      prg="$1"
      wrp="$2"
      ;;
  esac

  if type "$prg"; then
    pgrep "$prg" || {
      nohup "$wrp" > /dev/null 2>&1 &
    }
  fi

  unset prg wrp
}

_init_start_() {
  _init_exec_ "sshd"
  _init_exec_ "aria2c" "aria2d"
}

_init_start_ > /dev/null 2>&1
