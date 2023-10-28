# ASUS WMI Screenpad Driver Installer

This Bash script automates the process of installing and configuring the ASUS WMI Screenpad driver on Linux machines. It covers a range of actions from detecting the kernel version to updating the initramfs.

## Features

- 🤖 Auto-detects the latest kernel version
- 🚚 Downloads driver source code from GitHub
- 🛠️ Builds and installs the driver
- 🚫 Blacklists conflicting modules
- 🔄 Updates initramfs
- 🔄 Reboots the system for changes to take effect

## Pre-requisites

- \`sudo\` privileges
- \`wget\` and \`unzip\` utilities
- \`dkms\` (Dynamic Kernel Module Support)

## Usage

1️⃣ **Run the script as root**

```bash

sudo ./<script_name>.sh

```

2️⃣ **Reboot the machine**

The script will automatically reboot the machine after the installation.

## Steps Performed

1. **Detect Latest Kernel Version**: Retrieves the current kernel version.
2. **Rename Conflicting Files**: Backs up existing driver files.
3. **Depmod**: Rebuilds module dependencies.
4. **Blacklist Modules**: Blacklists conflicting modules.
5. **Update Initramfs**: Updates the initial RAM filesystem.
6. **DKMS Operations**: Removes, builds, and installs the driver via DKMS.
7. **Reboot**: Reboots the machine.

## Troubleshooting

If you encounter any issues:
- 📖 Check logs for any error messages.
- 🔄 Try running the script again.
- ❓ For further assistance, consult the GitHub repository.

## Contributing

Feel free to contribute to this script by creating issues or pull requests on GitHub.

## License

This script is licensed under MIT.
