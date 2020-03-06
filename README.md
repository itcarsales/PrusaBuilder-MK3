# Linux Build
### This creates a PrusaResearch directory under the user's home directory to organize files and projects.  It maintains user permissions and security.  It allows the build environment to be created once, and the build script can be rerun without additional downloads.  To erase and start over, simply remove the PrusaResearch directory and rerun the environment setup.

1. If you do not have GIT installed, run:

   ```sudo apt-get -y update -y; sudo apt-get -y install git```

2. To install the environment, run:

   ```bash <(curl -Ls https://raw.githubusercontent.com/itcarsales/PrusaBuilder-MK3/master/buildENV.sh)```

3. Select your printer model. 
   - For MK3 --> skip to step 4. 
   - For Others, in the subdirectory `"Firmware/variants/"` select the configuration file (`.h`) corresponding to your printer model, make a copy named `"Configuration_prusa.h"` and copy it into `"Firmware/"` directory.  
   
4. To build the firmware, run:

   ```bash <(curl -Ls https://raw.githubusercontent.com/itcarsales/PrusaBuilder-MK3/master/buildBIN.sh)```

   - Output hex file is at `"~/PrusaResearch/MK3/Prusa-Firmware/lang/firmware.hex"` . In the same folder you can hex files for other languages as well.

5. Connect your printer and flash with PrusaSlicer ( Configuration --> Flash printer firmware ) or Slic3r PE.