#!/bin/bash

# Script to find all users with /bin/bash as their shell
# Usage: ./find_bash_users.sh [password_file]

# Default to /etc/passwd if no file specified
PASSWORD_FILE=${1:-"/etc/passwd"}

# Check if the file exists
if [[ ! -f "${PASSWORD_FILE}" ]]; then
    echo "Error: File ${PASSWORD_FILE} not found."
    exit 1
fi

# Find all users with /bin/bash as their shell
echo "Users with /bin/bash shell:"
echo "=========================="

# Using grep to find lines ending with /bin/bash and awk to extract usernames
grep "/bin/bash$" "${PASSWORD_FILE}" | awk -F: '{print $1}'

# Count the number of bash users
BASH_USERS=$(grep -c "/bin/bash$" "${PASSWORD_FILE}")
echo "=========================="
echo "Total: ${BASH_USERS} users with /bin/bash shell"

exit 0
