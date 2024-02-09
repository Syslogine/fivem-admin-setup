# Fivem Admin Setup

This script automates the setup process for managing a Fivem server. It performs the following tasks:

1. **Install Dependencies:** Installs `sudo` and `git` for system management and version control.
2. **Grant Sudo Privileges:** Grants sudo privileges to a specified user.
3. **Create Fivem User:** Creates a dedicated user for the Fivem Server.
4. **Clone Server Management Script:** Clones the server management script from the provided GitHub repository.
5. **Grant Execute Permissions:** Grants execute permissions to the server management script.
6. **Run Server Management Script:** Executes the server management script to start the Fivem server.

## Usage

1. **Run the Script:**
   ```bash
   ./fivem_admin_setup.sh
   ```

2. **Choose an Option:**
   - Enter `1` to install sudo and git, and grant sudo privileges.
   - Enter `2` to create the Fivem user, clone the server management script, grant execute permissions, and run the server management script.

3. **Follow the Prompts:**
   - When prompted, provide necessary inputs such as the username for granting sudo privileges and the desired username for the Fivem Server.

## Notes

- This script assumes you're running it on a Debian-based system.
- Carefully review the choices and inputs to avoid errors.