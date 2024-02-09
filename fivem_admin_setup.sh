#!/bin/bash

# Function to display error message and exit
exit_with_error() {
    echo "$1 Exiting..."
    exit 1
}

# Function to install sudo and git
install_dependencies() {
    echo "Installing sudo and git..."
    sudo apt update && sudo apt install -y sudo git || exit_with_error "Failed to install dependencies."
}

# Function to grant sudo privileges
grant_sudo_privileges() {
    read -p "Enter the username to grant sudo privileges: " username
    [[ -z "${username// }" ]] && exit_with_error "Username cannot be empty."
    sudo usermod -aG sudo "$username" || exit_with_error "Failed to grant sudo privileges to user $username."
    echo "Sudo privileges granted to user $username."
}

# Function to create Fivem user
create_fivem_user() {
    read -p "Enter the desired username for the Fivem Server: " fivem_username
    [[ -z "${fivem_username// }" ]] && exit_with_error "Username cannot be empty."
    echo "Creating a dedicated user '$fivem_username' for the Fivem Server..."
    sudo adduser "$fivem_username" || exit_with_error "Failed to create Fivem user."
    # Note: Switching user in a script requires careful handling if further commands are run as the new user.
}

# Function to clone the server management script
clone_server_management_script() {
    echo "Cloning the server management script..."
    git clone https://github.com/Syslogine/fivem-server-manager.git "/home/$fivem_username/fivem-server-manager" || exit_with_error "Failed to clone server management script."
}

# Function to grant execute permissions to the script
grant_execute_permissions() {
    echo "Granting execute permissions to the script..."
    chmod +x "/home/$fivem_username/fivem-server-manager/fivemanager.sh" || exit_with_error "Failed to grant execute permissions to server management script."
}

# Function to run the server management script
run_server_management_script() {
    echo "Running the server management script..."
    cd "/home/$fivem_username/fivem-server-manager" || exit_with_error "Failed to change directory."
    ./fivemanager.sh start || exit_with_error "Failed to run server management script."
}

# Main function to execute the selected steps
main() {
    echo "Choose an option:"
    echo "1. Install sudo and git, and grant sudo privileges."
    echo "2. Create Fivem user, clone server management script, grant execute permissions, and run server management script."
    read -p "Enter your choice (1 or 2): " choice

    case $choice in
        1)
            echo "Running option 1..."
            install_dependencies
            grant_sudo_privileges
            ;;
        2)
            echo "Running option 2..."
            create_fivem_user
            clone_server_management_script
            grant_execute_permissions
            run_server_management_script
            ;;
        *)
            echo "Invalid choice."
            exit 1
            ;;
    esac
}

# Execute main function
main
