export TERM="linux"
export PATH="$PATH:$HOME/.local/bin"
export NODE_PATH="$PREFIX/lib/node_modules"

# Drop current works, and force checkout last commit.
function git_drop
	if not test -d .git
		echo "Not a git repo, give up."
		return
	end

	rm -i -r *
	git checkout -f HEAD^
end


function _init_sshd_
  # SSH for HEOS EZ01
  if type sshd
    pgrep sshd; or sshd
  end
end

function _init_start_
  _init_sshd_
end

_init_start_ > /dev/null 2>&1

