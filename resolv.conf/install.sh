#!/bin/sh

sudo sh <<EOF
umask 022 # file 0644

# Remove soft-link
rm -rf /etc/resolv.conf 2> /dev/null

# Unlock & Install
chattr -iAa /etc/resolv.conf
base64 -d resolv.conf.b64 > /etc/resolv.conf

# Lock the file
chattr +iAa /etc/resolv.conf
EOF

