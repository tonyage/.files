#!/bin/sh

sudo apt update && sudo apt upgrade
sudo apt install vim git gcc g++ \
	wget \
	curl \
	make \
	cmake \
	bzip2 \
	slack \
	binutils \
	python2.7 \
	libncurses5-dev \
	libncursesw5-dev \
	silversearcher-ag
