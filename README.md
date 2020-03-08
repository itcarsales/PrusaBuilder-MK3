# Linux Build - Debian

### This creates a PrusaResearch directory under the user's home directory to organize files and projects.  It maintains user permissions and security, and uses a portable version of Arduino IDE.  It allows the build environment to be created once, and the build script can be rerun without additional downloads.  To erase and start over, simply remove the PrusaResearch directory and rerun the environment setup.

### Development Directory: /home/*user*/PrusaResearch/

1. The following will istall GIT and setup alternatives for python:

   ```sudo apt-get -y update -y; sudo apt-get -y install git python3```

   ```sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 2```

   ```sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.5 1```

2. To install the environment, run:

   ```bash <(curl -Ls https://raw.githubusercontent.com/itcarsales/PrusaBuilder-MK3/master/buildENV.sh)```

3. Select your printer model. 
   - For MK3 --> skip to step 4. 

   - For Others, in the subdirectory `"~/PrusaResearch/MK3/Prusa-Firmware/Firmware/variants/"` select the configuration file (`.h`) corresponding to your printer model, make a copy named `"Configuration_prusa.h"` and copy it into `"~/PrusaResearch/MK3/Prusa-Firmware/Firmware/"` directory.  
   
4. To build the firmware, first

      - Select python 3.5 using the following command: (repeat this when finished building and return to python 2.7 - because Debian)

         ```sudo update-alternatives --config python```

      - Now run:

         ```bash <(curl -Ls https://raw.githubusercontent.com/itcarsales/PrusaBuilder-MK3/master/buildBIN.sh)```

   - Output hex file is at `"~/PrusaResearch/MK3/Prusa-Firmware/lang/firmware.hex"` . In the same folder you can hex files for other languages as well.

5. Connect your printer and flash with PrusaSlicer ( Configuration --> Flash printer firmware ) or Slic3r PE.