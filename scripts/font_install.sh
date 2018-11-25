#!/bin/bash

cd ~/Documents
git clone https://github.com/powerline/fonts.git --depth=1
cd ~/Documents/fonts
./install.sh
cd ../
rm -rf fonts
