# Fivem Admin Setup

This script automates the setup of a Fivem server admin environment on a Debian-based system.

## Overview

The script performs the following tasks:

- Installs required dependencies.
- Creates a dedicated user for Fivem server administration.
- Clones a server management script from a GitHub repository.
- Grants execute permissions to the server management script.
- Logs in as the newly created admin user.

## Prerequisites

- This script is designed for use on Debian-based systems.
- You should have root access to run the script. If you're not logged in as root, you can use the `su -` command to switch to the root user before executing the script. Ensure that you have an active internet connection to install dependencies and clone the server management script from GitHub.


## Usage

1. **Download the Script**: If you have `git` installed, you can clone the repository using the following command:

    ```bash
    git clone https://github.com/Syslogine/fivem-admin-setup.git
    ```

    Alternatively, you can create the script manually. Here are a few ways to do it:

    - **Using nano Text Editor**: Nano is a simple text editor available on most Unix-like systems. You can create the script using the following command:

        ```bash
        nano fivem_admin_setup.sh
        ```

        This command will open the nano text editor. Copy the script content from the GitHub repository and paste it into the nano editor. To save the file, press `Ctrl + O`, then press `Enter`. To exit nano, press `Ctrl + X`.

    - **Using Vi or Vim Text Editor**: Vi and Vim are powerful text editors available on Unix-like systems. You can create the script using the following command:

        ```bash
        vi fivem_admin_setup.sh
        ```

        This command will open the Vi or Vim text editor. Press `i` to enter insert mode, then copy the script content from the GitHub repository and paste it into the editor. To save the file and exit, press `Esc` to exit insert mode, then type `:wq` and press `Enter`.

    - **Using a Graphical Text Editor**: If you're using a graphical user interface (GUI), you can use any text editor of your choice, such as Gedit, Kate, or Sublime Text. Simply open the text editor, create a new file named `fivem_admin_setup.sh`, copy the script content from the GitHub repository, and save the file.

    - **Using wget or curl**: If you're comfortable with downloading files directly from the internet, you can use `wget` or `curl` to fetch the script:

        ```bash
        wget https://raw.githubusercontent.com/Syslogine/fivem-admin-setup/main/fivem_admin_setup.sh
        ```

        or

        ```bash
        curl -O https://raw.githubusercontent.com/Syslogine/fivem-admin-setup/main/fivem_admin_setup.sh
        ```

        This will download the script file directly to your current directory.

    Choose the method that best suits your preferences and system setup.


2. **Make the Script Executable**: Run the following command to make the script executable:

    ```bash
    chmod +x fivem_admin_setup.sh
    ```

3. **Run the Script**: Execute the script with sudo privileges:

    ```bash
    sudo ./fivem_admin_setup.sh
    ```

4. **Follow the Prompts**: The script will prompt you to enter a username for the Fivem server admin. Provide the desired username when prompted.

5. **Script Execution**: The script will then proceed to:

    - Install required dependencies (sudo, git, unzip, curl, wget, xz-utils).
    - Create the specified user for Fivem server administration and grant sudo privileges.
    - Clone the server management script from GitHub.
    - Grant execute permissions to the server management script.
    - Log in as the newly created admin user.

6. **Post-Installation**: After the script execution, you will be logged in as the newly created admin user. You can proceed with further configuration or management tasks for your Fivem server.

## Notes

- Ensure that you review and understand the script before executing it, especially if you're running it on a production system.
- The script assumes that the server management script is available at the specified GitHub repository.
- You can customize the server management script URL or adjust any other parameters to fit your specific requirements.

## Script Source

You can find the script on GitHub: [fivem_admin_setup.sh](https://github.com/Syslogine/fivem-admin-setup/blob/main/fivem_admin_setup.sh)

## Conclusion

This script simplifies the setup process for managing a Fivem server by automating the installation of dependencies and admin user creation. It provides a convenient way to prepare your server environment for Fivem server administration.

Feel free to modify the script according to your needs or contribute improvements if you find it useful!
