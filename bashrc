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

_init_start_() {
  sshd
  aria2d -D
}

_init_start_ > /dev/null 2>&1
