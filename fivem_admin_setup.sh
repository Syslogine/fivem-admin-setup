#!/bin/bash

# Function to display error message and exit
exit_with_error() {
    echo "$1 Exiting..."
    exit 1
}

# Function to install required dependencies
install_dependencies() {
    echo "Installing required dependencies..."
    apt update || exit_with_error "Failed to update package lists."
    apt install -y sudo git unzip curl wget xz-utils || exit_with_error "Failed to install dependencies."
    echo "Dependencies installed successfully."
}

# Function to create Fivem user
create_fivem_user() {
    read -p "Enter the desired username for the Fivem Server: " fivem_username
    [[ -z "${fivem_username// }" ]] && exit_with_error "Username cannot be empty."
    echo "Creating a dedicated user '$fivem_username' for the Fivem Server..."
    adduser "$fivem_username" || exit_with_error "Failed to create Fivem user."
    usermod -aG sudo "$fivem_username" || exit_with_error "Failed to grant sudo privileges to user $fivem_username."
    echo "Sudo privileges granted to user $fivem_username."
    echo "Cloning the server management script..."
    git clone https://github.com/Syslogine/fivem-server-manager.git "/home/$fivem_username/fivem-server-manager" || exit_with_error "Failed to clone server management script."
    chown -R "$fivem_username:$fivem_username" "/home/$fivem_username/fivem-server-manager" || exit_with_error "Failed to set ownership of cloned directory."
    echo "Server management script cloned and ownership set for user $fivem_username."
    echo "Granting execute permissions to the script..."
    chmod +x "/home/$fivem_username/fivem-server-manager/fivemanager.sh" || exit_with_error "Failed to grant execute permissions to server management script."
    echo "Logging in as user $fivem_username..."
    su - "$fivem_username" || exit_with_error "Failed to log in as user $fivem_username."
}

# Execute the main function
install_dependencies
create_fivem_user
