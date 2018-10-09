# Getting Started

1. Run the command `./startup.sh`, you may have to run the command `sudo chmod 777 install.sh`
2. Then run the command `./install.sh`
3. You may have to run `./symlink_rc.sh` to get rid of .files that already exist on the machine.
4. You'll now have to initialize and update the vim plugin submodules.
5. Run the commands `git submodule init` and `git submodule update`.
6. You will also need to update the submodule for the `youcompleteme` plugin with `git submodule update --init--recursive`
7. Lastly source `.vimrc` and `.zshrc`

