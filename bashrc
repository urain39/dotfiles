export TERM=linux

# for NodeJS
export NODE_PATH=$PREFIX/lib/node_modules

# Drop current works, and force checkout last commit.
git_drop() {
	if [ ! -d .git ]; then
		echo "Not a git repo, give up."
		return
	fi
	
	rm -i -r * && git checkout -f HEAD^
}

# EasyAria2Config
# Add ~/.local/bin
export PATH=$PATH:~/.local/bin
