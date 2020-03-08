#!/bin/bash
#Prusa MK3 Firmware Builder

####### Safety Dance
# Permissions Check
if ! [ $(id -u) -ne 0 ]; then
	echo "Setup cannot be run with sudo"
	exit 1
fi
# Install Check
echo && read -p "Would you like to build the Firmware? (y/n)" -n 1 -r -s installMe && echo
if [[ $installMe != "Y" && $installMe != "y" ]]; then
	echo "Firmware build cancelled."
	exit 1
fi
#Repo Check
if [ ! -d "$HOME/PrusaResearch/MK3/Prusa-Firmware" ]; then
    echo "Please run the Environment setup script first"
    exit 1
else
    # Set path for repo location
    REPO_PATH="$HOME/PrusaResearch/MK3/Prusa-Firmware"
fi
####### End Dance

# Setup Build Environment Variables
BUILD_ENV="1.0.6.1"
CURRENT_FIRMWARE_RELEASE="1_75mm_MK3-EINSy10a-E3Dv6full.h"
MK3_WORKING="$HOME/PrusaResearch/MK3"

# Set Paths
BUILD_ENV_PATH="$MK3_WORKING/build-env/PF-build-env-$BUILD_ENV"
BUILD_PATH="$MK3_WORKING/Prusa-Firmware-build"
cd $BUILD_PATH
variantCopy=0

# Copy firmware version into default if none exists
if [ ! -f "$REPO_PATH/Firmware/Configuration_prusa.h" ]; then
    cp $REPO_PATH/Firmware/variants/$CURRENT_FIRMWARE_RELEASE $REPO_PATH//Firmware/Configuration_prusa.h
    variantCopy=1   
fi

# Execute build with arduino environment
$BUILD_ENV_PATH/arduino $REPO_PATH/Firmware/Firmware.ino --verify --board PrusaResearchRambo:avr:rambo --pref build.path=$BUILD_PATH --pref compiler.warning_level=all
export ARDUINO=$BUILD_ENV_PATH

# Complete parse to language files
cd $REPO_PATH/lang
bash lang-build.sh

# Complete final firmware compile
bash fw-build.sh
echo "---------------------"
echo "python version used:"
echo $(python --version)
echo ""
echo "Firmware Complete"
if [ $variantCopy = 1 ]; then
    echo "$CURRENT_FIRMWARE_RELEASE file used"
else
    echo "Configuration_prusa.h located - no variant copied"
fi