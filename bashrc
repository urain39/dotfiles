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
  done && unset cnt
}

## Init function(s)
_init_sshd_() {
  # SSH for HEOS EZ01
  if type sshd; then
	pgrep sshd || sshd
  fi
}

_init_start_() {
  _init_sshd_
}

_init_start_ > /dev/null 2>&1
