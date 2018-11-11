# Getting Started

1. Run the command `./startup.sh` if on Linux. This can fail just init and update git submodules.
2. Then run the command `./install.sh`
3. You may have to run `./symlink_rc.sh` to get rid of .files that already exist on the machine.
4. Run `zsh_plugins.sh` to install oh-my-zsh plugins
5. You will also need to update the submodule for the `youcompleteme` plugin with `git submodule update --init--recursive`
6. Lastly source `.vimrc` and `.zshrc`

# Bash powerline

1. `pip install --user powerline-status`
2. keep an eye on Python version and update the paths in bashrc accordingly
