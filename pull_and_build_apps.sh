#!/bin/bash

TOOLS_DIR=~/.tools
CUSTOM_DIR="$(pwd)"
mkdir "${TOOLS_DIR}"

# dwm
if [ -d "${TOOLS_DIR}/dwm" ]
then
	cd "${TOOLS_DIR}/dwm"
	git pull
else
	git clone https://git.suckless.org/dwm "${TOOLS_DIR}/dwm"
	sudo make clean install
fi


# st
if [ -d "${TOOLS_DIR}/st" ]
then
	cd "${TOOLS_DIR}/st"
	git pull
	rm "${TOOLS_DIR}/st/config.h"
else
	git clone https://git.suckless.org/st "${TOOLS_DIR}/st"
fi
cp "${CUSTOM_DIR}/st/config.h" "${TOOLS_DIR}/st/config.h"
cd "${TOOLS_DIR}/st"
sudo make clean install

# surf
if [ -d "${TOOLS_DIR}/surf" ]
then
	cd "${TOOLS_DIR}/surf"
	git pull
else
	git clone https://git.suckless.org/surf "${TOOLS_DIR}/surf"
fi
cd "${TOOLS_DIR}/surf" 
sudo make clean install

# barM
gcc -o "${CUSTOM_DIR}/barM" "${CUSTOM_DIR}/barM.c" -O2 -s -lX11
sudo cp "${CUSTOM_DIR}/barM" /usr/local/bin/
