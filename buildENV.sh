#!/bin/bash 
#Prusa MK3 Firmware Environment Builder

####### Safety Dance
# Permissions Check
if ! [ $(id -u) -ne 0 ]; then
	echo "Setup cannot be run with sudo"
	exit 1
fi
# Install Check
echo && read -p "Would you like to build the Prusa MK3 Firmware Environment? (y/n)" -n 1 -r -s installMe && echo
if [[ $installMe != "Y" && $installMe != "y" ]]; then
	echo "Environment build cancelled."
	exit 1
fi
####### End Dance

# Setup Build Environment Variables
BUILD_ENV="1.0.6.1"
BUILD_ENV_SOURCE="https://github.com/prusa3d/PF-build-env/releases/download/$BUILD_ENV-Linux64/PF-build-env-Linux64-$BUILD_ENV.zip"
#BUILD_ENV_SOURCE="https://github.com/3d-gussner/PF-build-env-1/releases/download/$BUILD_ENV-Linux64/PF-build-env-Linux64-$BUILD_ENV.zip"

# Setup/Verify Directories
mkdir $HOME/PrusaResearch
mkdir $HOME/PrusaResearch/MK3
MK3_WORKING="$HOME/PrusaResearch/MK3"
mkdir $MK3_WORKING/Prusa-Firmware-build
mkdir $MK3_WORKING/build-env

# Clone MK3 Firmware
cd $MK3_WORKING 
git clone https://github.com/prusa3d/Prusa-Firmware.git

# Download Arduino Environment Zip
cd $MK3_WORKING/build-env
wget $BUILD_ENV_SOURCE
unzip -q $MK3_WORKING/build-env/PF-build-env-Linux64-$BUILD_ENV.zip  -d $MK3_WORKING/build-env/PF-build-env-$BUILD_ENV
rm $MK3_WORKING/build-env/PF-build-env-Linux64-$BUILD_ENV.zip

# Modify Permissions of Pre-Zipped Files - removes final need for sudo
chmod -R 775 $MK3_WORKING/build-env/PF-build-env-$BUILD_ENV

exit 0