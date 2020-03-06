# Build
## Linux
### This creates a PrusaResearch directory under the users home directory to organize files and projects.  It maintains user permissions and security.

1. run ```bash https://raw.githubusercontent.com/itcarsales/PrusaBuilder-MK3/master/buildENV.sh```

2. Set your printer model. 
   - For MK3 --> skip to step 3. 
   - For Others, in the subdirectory `"Firmware/variants/"` select the configuration file (`.h`) corresponding to your printer model, make a copy named `"Configuration_prusa.h"` and copy it into `"Firmware/"` directory.  
   
3. Run ```bash https://raw.githubusercontent.com/itcarsales/PrusaBuilder-MK3/master/buildBIN.sh```
   - Output hex file is at `"~/PrusaResearch/MK3/Prusa-Firmware/lang/firmware.hex"` . In the same folder you can hex files for other languages as well.

4. Connect your printer and flash with PrusaSlicer ( Configuration --> Flash printer firmware ) or Slic3r PE.