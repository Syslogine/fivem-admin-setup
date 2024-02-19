# Fivem Server Admin Setup Guide

Automate the setup of your Fivem server admin environment on Debian-based Linux systems with our comprehensive script. This guide outlines the steps to prepare your system, ensuring a smooth and efficient setup process.

## Overview

This setup script automates the following tasks:
- Installs necessary dependencies for the Fivem server.
- Creates a dedicated user account for server administration.
- Clones a server management script from a specified GitHub repository.
- Sets execute permissions for the server management script.
- Switches to the newly created admin user for immediate server management.

## Prerequisites

- **Root Access**: Ensure you have root access to your system. Use `su -` to switch to the root user if necessary.
- **Internet Connection**: A stable internet connection is required to download dependencies and clone scripts from GitHub.
- **Debian-based Linux Distribution**: This script is designed for Debian-based systems, including Ubuntu.

## Installation

### Quick Start

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/Syslogine/fivem-admin-setup.git && cd fivem-admin-setup
    ```

2. **Make the Script Executable**:
    ```bash
    chmod +x fivem_admin_setup.sh
    ```

3. **Execute the Script**:
    ```bash
    ./fivem_admin_setup.sh
    ```

### Detailed Instructions

If you prefer manual setup or lack `git`, follow these detailed instructions:

- **Text Editor Method**: Use `nano` or `vim` to create and edit the script file.
    - Nano: `nano fivem_admin_setup.sh`
    - Vim: `vim fivem_admin_setup.sh`
    Copy and paste the script content, save, and exit the editor.

- **Direct Download**: Use `wget` or `curl` to download the script directly.
    - wget: `wget https://raw.githubusercontent.com/Syslogine/fivem-admin-setup/main/fivem_admin_setup.sh`
    - curl: `curl -O https://raw.githubusercontent.com/Syslogine/fivem-admin-setup/main/fivem_admin_setup.sh`

After creating or downloading the script, ensure it is executable with `chmod +x fivem_admin_setup.sh` and run it with `./fivem_admin_setup.sh`.

## Usage

Follow the script's prompts to enter the desired username for the Fivem server admin. The script will then automatically:
- Install dependencies (`sudo`, `git`, `unzip`, `curl`, `wget`, `xz-utils`).
- Create and configure the admin user account.
- Clone and set up the server management script for immediate use.

Upon completion, you'll be ready to manage your Fivem server with the newly created admin account.

## Important Notes

- Review the script before running to ensure it meets your system's needs.
- The script and server management script are located in the specified GitHub repository. Adjustments can be made to suit your specific setup requirements.

## Resources

- **Script Source**: Access the setup script via GitHub at [fivem_admin_setup.sh](https://github.com/Syslogine/fivem-admin-setup/blob/main/fivem_admin_setup.sh).

## Conclusion

This guide provides a streamlined process to set up your Fivem server admin environment, automating routine tasks for a hassle-free server management experience. Customize the script as needed to fit your specific server configuration.