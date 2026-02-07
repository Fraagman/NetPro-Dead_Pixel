# Network Testing Tool Configurations

This directory contains custom configuration files for network testing tools.

## Example Configurations

### Nmap Scan Profiles
Create custom scan templates for repeated use:

```bash
# config/nmap_profiles.txt
# Quick scan profile
-sV -T4 -F

# Comprehensive scan profile
-sS -sV -O -A -p-
```

### Tcpdump Filters
Store commonly used packet capture filters:

```bash
# config/tcpdump_filters.txt
# Capture HTTP traffic only
tcp port 80

# Capture DNS queries
udp port 53
```

## Usage

Reference these configs in your commands:
```bash
nmap $(cat /workspace/config/nmap_profiles.txt | head -1) <target>
```
