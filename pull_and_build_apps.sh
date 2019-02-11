#!/bin/bash

TOOLS_DIR=~/.tools

mkdir "${TOOLS_DIR}"

pushd "${TOOLS_DIR}"

# dwm
git clone https://git.suckless.org/dwm "${TOOLS_DIR}/dwm"
cd "${TOOLS_DIR}/dwm"
sudo make clean install

# st
git clone https://git.suckless.org/st "${TOOLS_DIR}/st"
cp st/config.h "${TOOLS_DIR}/st" 
cd "${TOOLS_DIR}/st"
sudo make clean install

# surf
git clone https://git.suckless.org/surf "${TOOLS_DIR}/surf"
cd "${TOOLS_DIR}/surf" 
sudo make clean install

gcc -O barM barM.c -02 -s -lX11
sudo cp barM /usr/local/bin/

popd
