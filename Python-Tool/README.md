# Python Log Analyzer

## Tool Name
Python Log Analyzer

## Objective
Analyze a text log file to identify common authentication failures and count the IP addresses found in those entries.

## Features
- Reads a text log file supplied by the user.
- Detects failed passwords, authentication failures, invalid users, and login failures.
- Counts valid IPv4 addresses on matching lines.
- Displays a summary and matching log entries.
- Handles missing or unreadable files.
- Supports the --help option.
- Uses Python functions and comments.

## Requirements
- Kali Linux or another operating system with Python 3.
- Python 3.9 or newer.
- No third-party libraries required.

## How to Run
Navigate to the Python-Tool directory:

    cd ~/Phase-1/Python-Tool

Run the analyzer:

    python3 tool.py sample.log

Display help:

    python3 tool.py --help

Analyze another log file:

    python3 tool.py /path/to/your.log

## Example Usage
    python3 tool.py sample.log

## Example Output
    ===== PYTHON LOG ANALYZER =====
    Total lines scanned: 5
    Authentication failures: 4

    Frequent IP addresses:
    192.0.2.10: 2
    198.51.100.7: 1
    203.0.113.8: 1

Actual output depends on the contents of the log file.

## Challenges Faced
Complete this section with the real challenges you encountered while building and testing the tool.

## Future Improvements
- Export results to a report file.
- Support more log formats.
- Add configurable detection patterns.
- Add date and time filtering.

## Safety and Limitations
Use logs from your own computer, lab, or a system you are authorized to inspect. Pattern matches are indicators for review, not proof of an attack. This tool does not block IP addresses or modify system settings.
