# Linux Security Checker

## Tool Name
Linux Security Checker (Bash)

## Objective
Perform basic, read-only security checks on a Linux system.

## Features
- Displays username, hostname, and kernel version.
- Checks for common firewall tools.
- Checks important security-related files.
- Checks whether unattended-upgrades is installed.
- Supports a help option.
- Handles unknown command-line arguments.

## Requirements
- Kali Linux or another Linux distribution.
- Bash shell.
- sudo may be required to inspect firewall information.

## How to Run
Make the script executable:

    chmod +x tool.sh

Run the tool:

    ./tool.sh

Display help:

    ./tool.sh --help

## Example Usage
    ./tool.sh

## Example Output
    [1] SYSTEM INFORMATION
    Username: malu
    Hostname: Kali

    [2] FIREWALL CHECK
    nftables is available.

    [3] IMPORTANT FILE CHECK
    [FOUND] /etc/passwd

    [4] AUTOMATIC UPDATE CHECK
    unattended-upgrades is not installed.

Actual results vary by system.

## Challenges Faced
Complete this section with the real challenges you encountered while building and testing the tool.

## Future Improvements
- Check firewall rules more thoroughly.
- Add SSH configuration checks.
- Generate a security report file.
- Add severity levels for findings.

## Safety
This tool performs basic checks and does not intentionally change system settings. Run it only on systems you own or are authorized to assess.
