export TERM=linux
export NODE_PATH=$PREFIX/lib/node_modules

# Drop current works, and force checkout last commit.
function git_drop
	if not test -d .git
		echo "Not a git repo, give up."
		return
	end

	rm -i -r *
	git checkout -f HEAD^
end

