#!/bin/sh

sudo sh <<EOF
umask 0222 # for unionfs

# Unlock & Install
chattr -iAa /etc/resolv.conf 2> /dev/null
rm -f /etc/resolv.conf 2> /dev/null # soft-link

# Re-write the DNS
base64 -d resolv.conf.b64 > /etc/resolv.conf

# Lock the file
chattr +iAa /etc/resolv.conf 2> /dev/null
EOF

