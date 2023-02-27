#!/bin/bash

current_dir=$(pwd)
echo ""
echo "# Copying files to home ${HOME}"
cd ${current_dir}
cp -rf * ${HOME}
cp -rf .config* ${HOME}/
rm -f ${HOME}/README.MD
