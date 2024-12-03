#!/bin/bash

# Define an array of port/protocol pairs to deny
port_rules=(
    "22/tcp"    # SSH (Secure Shell)
    "22/udp"    # SSH (Secure Shell)
    "5800/tcp"  # VNC (Virtual Network Computing)
    "5800/udp"  # VNC (Virtual Network Computing)
    "5900/tcp"  # VNC (Virtual Network Computing)
    "5900/udp"  # VNC (Virtual Network Computing)
    "20/tcp"    # FTP (File Transfer Protocol) - Data
    "20/udp"    # FTP (File Transfer Protocol) - Data
    "21/tcp"    # FTP (File Transfer Protocol) - Control
    "21/udp"    # FTP (File Transfer Protocol) - Control
    "137/tcp"   # NetBIOS Name Service
    "137/udp"   # NetBIOS Name Service
    "138/tcp"   # NetBIOS Datagram Service
    "138/udp"   # NetBIOS Datagram Service
    "139/tcp"   # NetBIOS Session Service
    "139/udp"   # NetBIOS Session Service
    "445/tcp"   # Microsoft-DS (Microsoft Directory Services)
    "445/udp"   # Microsoft-DS (Microsoft Directory Services)
    "3389/tcp"  # RDP (Remote Desktop Protocol)
    "3389/udp"  # RDP (Remote Desktop Protocol)
    "23/tcp"    # Telnet
    "23/udp"    # Telnet
    "1900/tcp"  # UPnP (Universal Plug and Play)
    "1900/udp"  # UPnP (Universal Plug and Play)
    "80/tcp"    # HTTP (Hypertext Transfer Protocol)
    "80/udp"    # HTTP (Hypertext Transfer Protocol)
    "25/tcp"    # SMTP (Simple Mail Transfer Protocol)
    "143/tcp"   # IMAP (Internet Message Access Protocol)
    "993/tcp"   # IMAPS (IMAP Secure)
    "110/tcp"   # POP3 (Post Office Protocol - Version 3)
    "995/tcp"   # POP3S (POP3 Secure)
    "990/tcp"   # FTPS (File Transfer Protocol Secure)
    "389/tcp"   # LDAP (Lightweight Directory Access Protocol)
    "636/tcp"   # LDAPS (LDAP Secure)
    "3306/tcp"  # MySQL Database
    "5432/tcp"  # PostgreSQL Database
    "514/udp"   # Syslog
    "631/udp"   # CUPS (Common UNIX Printing System)
    "631/tcp"   # CUPS
    "6881-6889/tcp"  # BitTorrent

    # Additional ports
    "161/udp"   # SNMP (Simple Network Management Protocol)
    "162/udp"   # SNMP Trap
    "179/tcp"   # BGP (Border Gateway Protocol)
    "465/tcp"   # SMTPS (SMTP Secure)
    "587/tcp"   # Submission (Mail Message Submission)
    "873/tcp"   # Rsync
    "1433/tcp"  # Microsoft SQL Server
    "1521/tcp"  # Oracle Database
    "2049/tcp"  # NFS (Network File System)
    "5901/tcp"  # VNC - Alternate port
    "8080/tcp"  # HTTP Alternate
    "8443/tcp"  # HTTPS Alternate
)

# Loop through the array and deny each port/protocol pair
for rule in "${port_rules[@]}"; do
    sudo ufw deny $rule
done

# Reload UFW to apply the changes
sudo ufw reload

# Display the updated rules
sudo ufw status numbered
