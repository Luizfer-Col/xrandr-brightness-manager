
# xrandr Brightness Manager

This repository contains a simple Bash script to adjust the brightness of an external display using `xrandr` in Linux.

### Important Notes

- **Wayland vs X11**: This script works **only on X11** (the X Window System). If you're using **Wayland** (e.g., Fedora, Ubuntu 21.04+, GNOME, or others), `xrandr` may not function properly. For Wayland, alternative methods for adjusting brightness may be required.

- **Check your display output name**: The script uses `HDMI-0` as the default output. You may need to check the name of your display output if it's different (e.g., `DP-1`, `eDP-1`, etc.). You can list your available outputs using the following command:
  ```bash
  xrandr
  ```
  This will display a list of all connected displays and their respective names. Update the script with the correct output name if necessary.

- **Hardware Compatibility**: The script may not work on all devices due to differences in hardware, such as the type of graphics card (e.g., Intel, NVIDIA, AMD) or display technology (e.g., some monitors may not support brightness control through `xrandr`). If the script doesn't work, you may need to explore alternative methods for adjusting brightness specific to your hardware.

## Script Overview

The `set_brightness.sh` script allows you to set the brightness of your display by passing a value between 0 and 1.

### Requirements

- `xrandr` must be installed on your system. Most Linux distributions include it by default. You can check if it is installed by running:
  ```bash
  xrandr --version
  ```

For distributions like **Ubuntu** and **Debian** (with X11):
```bash
sudo apt update
sudo apt install x11-xserver-utils
```
For **Arch Linux**:
```bash
sudo pacman -S xorg-xrandr
```
For **openSUSE**:
```bash
sudo zypper install xrandr
```

### Creating or Downloading the Script

You can either create the script manually or download it directly from this repository.

#### 1. Create the script using `nano`:

```bash
nano set_brightness.sh
```

Then, paste the following content into the file:

```bash
#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <brightness value between 0 and 1>"
    exit 1
fi

# Check if the argument is in the correct range (0 to 1)
if (( $(echo "$1 < 0 || $1 > 1" | bc -l) )); then
    echo "Error: The brightness value must be between 0 (min) and 1 (max)."
    exit 1
fi

# Set the brightness based on the provided value
xrandr --output HDMI-0 --brightness $1
echo "Brightness set to $1"
```

After pasting, save the file by pressing `Ctrl + X`, then `Y`, and `Enter`.

#### 2. Download the script directly:

You can download the `set_brightness.sh` file directly from this repository using `wget` or `curl`. For example:

- Using `wget`:
  ```bash
  wget https://raw.githubusercontent.com/Luizfer-Col/xrandr-brightness-manager/master/set_brightness.sh
  ```

- Using `curl`:
  ```bash
  curl -O https://raw.githubusercontent.com/Luizfer-Col/xrandr-brightness-manager/master/set_brightness.sh
  ```

### Usage

1. **Make the script executable**:
   ```bash
   chmod +x set_brightness.sh
   ```

2. **Run the script with a brightness value**:
   ```bash
   ./set_brightness.sh <brightness value>
   ```
   - Example to set brightness to 20%:
     ```bash
     ./set_brightness.sh 0.2
     ```

### Aliases (Optional)

For quick access, you can add aliases to your `.bashrc` or `.zshrc` file for all brightness levels from 10% to 100%. For example:
```bash
alias set_br_10="~/set_brightness.sh 0.1"
alias set_br_20="~/set_brightness.sh 0.2"
alias set_br_30="~/set_brightness.sh 0.3"
alias set_br_40="~/set_brightness.sh 0.4"
alias set_br_50="~/set_brightness.sh 0.5"
alias set_br_60="~/set_brightness.sh 0.6"
alias set_br_70="~/set_brightness.sh 0.7"
alias set_br_80="~/set_brightness.sh 0.8"
alias set_br_90="~/set_brightness.sh 0.9"
alias set_br_100="~/set_brightness.sh 1.0"
```
After adding the aliases, run the following command to apply the changes:
```bash
source ~/.bashrc
```

### Disclaimer

The use of this script is at your own risk. I am not responsible for any damage or issues that may arise from improper use or execution of the script.

### License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.