#!/bin/bash

# Finds users with /bin/bash shell
grep '/bin/bash' /etc/passwd > bash_users.txt
echo "Users with /bin/bash saved to bash_users.txt"
