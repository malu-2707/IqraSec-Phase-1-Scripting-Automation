#!/usr/bin/env python3

# Python Log Analyzer
# Detects common authentication failures in a text log.

import argparse
import re
import sys
from collections import Counter
from pathlib import Path


# Patterns commonly found in authentication failure logs.
FAILURE_PATTERNS = [
    r"failed password",
    r"authentication failure",
    r"invalid user",
    r"login failed",
]

IP_PATTERN = re.compile(r"\b(?:\d{1,3}\.){3}\d{1,3}\b")


def read_log(filename):
    """Read a text log file safely."""
    try:
        return Path(filename).read_text(
            encoding="utf-8", errors="replace"
        ).splitlines()
    except (OSError, ValueError) as error:
        print(f"Error reading file: {error}", file=sys.stderr)
        return None


def analyze_log(lines):
    """Find authentication failures and count IP addresses."""
    matches = []
    ip_counts = Counter()

    for line in lines:
        if any(
            re.search(pattern, line, re.IGNORECASE)
            for pattern in FAILURE_PATTERNS
        ):
            matches.append(line)

            for ip in IP_PATTERN.findall(line):
                octets = ip.split(".")
                if all(0 <= int(part) <= 255 for part in octets):
                    ip_counts[ip] += 1

    return matches, ip_counts


def main():
    """Parse arguments and display the analysis report."""
    parser = argparse.ArgumentParser(
        description="Analyze logs for authentication failures."
    )
    parser.add_argument(
        "logfile",
        nargs="?",
        default="sample.log",
        help="path to a text log file (default: sample.log)",
    )
    args = parser.parse_args()

    lines = read_log(args.logfile)
    if lines is None:
        return 1

    matches, ip_counts = analyze_log(lines)

    print("===== PYTHON LOG ANALYZER =====")
    print(f"Total lines scanned: {len(lines)}")
    print(f"Authentication failures: {len(matches)}")

    print("\nFrequent IP addresses:")
    if ip_counts:
        for ip, count in ip_counts.most_common(5):
            print(f"{ip}: {count}")
    else:
        print("No valid IPv4 addresses found on matching lines.")

    print("\nMatching log entries:")
    if matches:
        for entry in matches:
            print(entry)
    else:
        print("No matching entries found.")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
