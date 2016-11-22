#!/usr/bin/env bash

expect <<- DONE
eval spawn openconnect --user=$ARCHPASS_USER --cafile=root.pem remote.uga.edu
set prompt ":|#|\\\$"
expect -re "ArchPassDuo"
send "03\r"
expect -re "Password"
send "$ARCHPASS_PW\r"
expect -re "Password"
send "push\r"
expect eof
DONE

