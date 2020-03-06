# Build
## Linux

1. run ```bash buildENV.sh```

2. Set your printer model. 
   - For MK3 --> skip to step 3. 
   - For Others, in the subdirectory `"Firmware/variants/"` select the configuration file (`.h`) corresponding to your printer model, make a copy named `"Configuration_prusa.h"` and copy it into `"Firmware/"` directory.  
   
3. Run ```bash buildBIN.sh```
   - Output hex file is at `"Prusa-Firmware/lang/firmware.hex"` . In the same folder you can hex files for other languages as well.

4. Connect your printer and flash with PrusaSlicer ( Configuration --> Flash printer firmware ) or Slic3r PE.