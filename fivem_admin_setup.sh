#!/bin/bash

# Configuration Variables
LOG_FILE="./fivem_server_setup.log"
SERVER_MANAGER_REPO="https://github.com/Syslogine/fivem-server-manager.git"

# Dependencies to install
DEPENDENCIES="sudo git unzip curl wget xz-utils"

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root. Exiting..."
    exit 1
fi

# Function to log messages
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

# Function to display error message, log it, and exit
exit_with_error() {
    log_message "ERROR: $1"
    echo "Exiting..."
    exit 1
}

# Function to check and install required dependencies
install_dependencies() {
    log_message "Checking and installing required dependencies..."
    for package in $DEPENDENCIES; do
        if dpkg -l | grep -qw "$package"; then
            log_message "$package is already installed. Skipping..."
        else
            log_message "Installing $package..."
            apt-get install -y "$package" || exit_with_error "Failed to install $package."
        fi
    done
    log_message "All dependencies installed successfully."
}

# Function to create Fivem user and setup server management script
create_fivem_user() {
    read -p "Enter the desired username for the Fivem Server: " fivem_username
    [[ -z "${fivem_username// }" ]] && exit_with_error "Username cannot be empty."
    log_message "Creating a dedicated user '$fivem_username' for the Fivem Server..."
    adduser "$fivem_username" --gecos "" --disabled-password || exit_with_error "Failed to create Fivem user."
    echo "$fivem_username ALL=(ALL) NOPASSWD:ALL" | tee -a /etc/sudoers
    log_message "User $fivem_username created and granted sudo privileges without password."

    # Cloning the server management script
    log_message "Cloning the server management script..."
    git clone "$SERVER_MANAGER_REPO" "/home/$fivem_username/fivem-server-manager" || exit_with_error "Failed to clone server management script."
    chown -R "$fivem_username:$fivem_username" "/home/$fivem_username/fivem-server-manager" || exit_with_error "Failed to set ownership of cloned directory."
    log_message "Server management script cloned and ownership set for user $fivem_username."

    # Granting execute permissions to the script
    log_message "Granting execute permissions to the server management script..."
    chmod +x "/home/$fivem_username/fivem-server-manager/fivemanager.sh" || exit_with_error "Failed to grant execute permissions to server management script."

    log_message "Setup for user $fivem_username completed. Please manually log in as user $fivem_username to proceed."
}

# Main menu for user selection
log_message "Script started."
echo "Select an option:"
echo "1) Install dependencies"
echo "2) Create Fivem Server user"
read -p "Enter choice [1-2]: " choice

case $choice in
    1)
        install_dependencies
        ;;
    2)
        create_fivem_user
        ;;
    *)
        log_message "Invalid selection."
        echo "Invalid selection. Exiting..."
        exit 1
        ;;
esac

log_message "Script completed."
