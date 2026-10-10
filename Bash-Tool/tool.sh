#!/bin/bash

# Linux Security Checker
# Performs basic, read-only security checks on Linux.

show_help() {
    echo "Linux Security Checker"
    echo "Usage: ./tool.sh [--help]"
    echo "Checks basic Linux security settings."
}

# Display help when requested.
if [[ "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
    show_help
    exit 0
fi

# Reject unsupported arguments.
if [[ $# -gt 0 ]]; then
    echo "Error: Unknown argument: $1"
    show_help
    exit 1
fi

echo "================================"
echo "      LINUX SECURITY CHECKER"
echo "================================"

# Display basic system information.
echo
echo "[1] SYSTEM INFORMATION"
echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Kernel: $(uname -r)"

# Check firewall tools and status.
echo
echo "[2] FIREWALL CHECK"

if command -v ufw >/dev/null 2>&1; then
    sudo ufw status
elif command -v firewall-cmd >/dev/null 2>&1; then
    firewall-cmd --state 2>/dev/null || echo "Firewall status unavailable."
elif command -v nft >/dev/null 2>&1; then
    if sudo nft list ruleset >/dev/null 2>&1; then
        echo "nftables is available. Review rules with: sudo nft list ruleset"
    else
        echo "Unable to inspect nftables rules."
    fi
else
    echo "No supported firewall tool found."
fi

# Check important system files.
echo
echo "[3] IMPORTANT FILE CHECK"

for file in /etc/passwd /etc/shadow /etc/ssh/sshd_config; do
    if [[ -e "$file" ]]; then
        echo "[FOUND] $file"
    else
        echo "[MISSING] $file"
    fi
done

# Check for automatic security updates.
echo
echo "[4] AUTOMATIC UPDATE CHECK"

if command -v dpkg-query >/dev/null 2>&1; then
    if dpkg-query -W -f='${Status}' unattended-upgrades 2>/dev/null \
        | grep -q "install ok installed"; then
        echo "unattended-upgrades is installed."
    else
        echo "unattended-upgrades is not installed."
    fi
else
    echo "Debian package manager not detected."
fi

echo
echo "================================"
echo "Security check completed."
echo "This tool does not change settings."
echo "================================"
