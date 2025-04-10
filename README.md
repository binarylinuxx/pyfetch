# PYFETCH
a python system-fetch tool that fully python based.

# INSTALL
MAKE SURE **python-colorama**, **python-psutil** ARE INSTALLED.
FOR ARCH-LINUX/BASED
```
git clone https://github.com/binarylinuxx/pyfetch
cd pyfetch
makepkg -si
```

OTHER LINUX DISTROS
```
git clone https://github.com/binarylinuxx/pyfetch
cd pyfetch
sudo make install
```

# SCREENS
![fetch](fetch.png)

# CONFIG
YOU CAN CONFIGURE AS YOU PLEASE IN **~/.config/pyfetch/config.ini** LIKE:
```
[display] #ENABLE OR DISABLE MODULES
show_host = true
show_os = true
show_kernel = true
show_uptime = true
show_cpu = true
show_memory = true
show_gpu = false
show_shell = true

[ascii] #HERE YOU CAN CHANGE COLOR OF OUTPUT LOGO AND IMPORT CUSTOM ASCII
art_style = pyfetch
custom_art =
color = blue

[format] #COLORS
info_prefix =
info_color = white
label_color = yellow
title_color = magenta
```
