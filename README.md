# Scripting & Automation — Phase 1

**Internship:** IqraSec Academy
**Author:** Malini S

## Project Overview

This project contains two command-line tools developed for Phase 1 using Bash and Python.

### 1. Bash Tool — Linux Security Checker

**Location:** `Bash-Tool/tool.sh`

Checks basic Linux system information and selected security-related settings.

Features:

* Displays the current username, hostname, and kernel information.
* Checks for available firewall tools.
* Checks important system configuration files.
* Checks whether the `unattended-upgrades` package is installed.
* Supports help and invalid-argument handling.

Run in Kali Linux:

```bash
cd Bash-Tool
chmod +x tool.sh
./tool.sh
```

Display help:

```bash
./tool.sh --help
```

### 2. Python Tool — Log Analyzer

**Location:** `Python-Tool/tool.py`

Analyzes log files for common authentication-failure messages and summarizes IP addresses found in matching entries.

Features:

* Counts total lines and authentication failures.
* Identifies IP addresses associated with matching log entries.
* Displays matching log lines.
* Handles missing or unreadable files.
* Supports command-line arguments and help.

Run in Kali Linux:

```bash
cd Python-Tool
python3 tool.py sample.log
```

Display help:

```bash
python3 tool.py --help
```

## Project Structure

```text
Phase-1/
├── README.md
├── Bash-Tool/
│   ├── tool.sh
│   ├── README.md
│   └── screenshots/
│       └── Bash.png
└── Python-Tool/
    ├── tool.py
    ├── README.md
    ├── sample.log
    └── screenshots/
        └── Python.png
```

## Testing

* Bash syntax checked with `bash -n tool.sh`.
* Python syntax checked with `python3 -m py_compile tool.py`.
* Both tools tested using their help options.
* Python analyzer tested with the sample log.

## Safety Note

These tools are intended for basic educational security checks and log analysis. They do not intentionally modify system security settings. Test them only on systems and logs you are authorized to access.
