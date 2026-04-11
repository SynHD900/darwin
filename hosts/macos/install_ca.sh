#!/usr/bin/env bash

# Function that can fail
function risky_command() {
        # Capture output and store it in a variable
        output=$(security find-certificate -c "lab-ca" -p /Library/Keychains/System.keychain 2>&1)
        exit_code=$? # Store the exit code

        # Return the exit code to the caller
        return $exit_code
}

# Try the risky command
risky_command

# Check the exit code
if [ $exit_code -eq 0 ]; then
        CA=$(cat /Users/synhd/nix_v1/certs/lab-ca.crt)
        if [[ "$output" == "$CA" ]]; then
                echo "The certificates are identical."
                exit 0
        fi
fi

sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain /Users/synhd/nix_v1/certs/lab-ca.crt
