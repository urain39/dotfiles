export TERM="linux"
export PATH="$PATH:$HOME/.local/bin"
export NODE_PATH="$PREFIX/lib/node_modules"

# Drop current works, and force checkout last commit.
function git_drop
  if not test -d .git
    echo "Not a git repo, give up."
    return
  end

  rm -i -r *; and git checkout -f HEAD
end

# Alias function(s)
function rmedir
  ls -d * | while read dir
    if test -d "$dir"
      set cnt (ls "$dir" | wc -l)
      if test "$cnt" -lt 1
        rm -r "$dir"
      end
    end
  end; and set -e cnt; and set -e dir
end

# Init function(s)
function _init_exec_
  test (count argv) -lt 1; and return

  switch (count argv)
    case "1"
      set prg "$argv[1]"
      set wrp "$argv[1]"
    case "*"
      set prg "$argv[1]"
      set wrp "$argv[2]"
  end

  if type "$prg"
    pgrep "$prg"; or begin
      nohup "$wrp" > /dev/null 2>&1 &
    end
  end

  set -e prg; and set -e wrp
end

function _init_start_
  _init_exec_ "sshd"
  _init_exec_ "aria2d"
end

_init_start_ > /dev/null 2>&1

