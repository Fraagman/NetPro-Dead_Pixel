# NetPro: Network Testing Sandbox

A containerized, isolated environment for manual network diagnostics and protocol analysis. Designed for authorized security assessments, network troubleshooting, and educational purposes.

---

## Project Overview

NetPro provides a Docker-based terminal workspace pre-configured with industry-standard network testing utilities. All operations are executed manually by the user within an isolated container environment, ensuring controlled and auditable testing workflows.

**Core Capabilities:**
- Network discovery and port scanning
- Packet capture and protocol analysis
- TCP/UDP connection testing
- DNS resolution and HTTP diagnostics

---

## Ethical Compliance & Usage Policy

**AUTHORIZED USE ONLY**

This tool is intended exclusively for:
- Authorized penetration testing with written permission
- Internal network diagnostics on owned infrastructure
- Educational lab environments and training scenarios
- Security research in controlled, isolated networks

**Prohibited Activities:**
- Unauthorized scanning of third-party networks
- Exploitation attempts against systems you do not own
- Any activity violating local, national, or international law

**User Responsibility:** By using this tool, you accept full legal and ethical responsibility for your actions. Always obtain proper authorization before testing any network or system.

---

## System Architecture & Isolation

**Container Design:**
- Base: Ubuntu 22.04 LTS
- Network Mode: Bridge (isolated from host)
- Capabilities: Minimal privilege model (NET_RAW, NET_ADMIN only)
- No persistent services or background processes

**Security Boundaries:**
- All commands executed manually via interactive bash shell
- Volume mounts for logs and scripts (read/write isolation)
- Container stops on shell exit (no restart policy)

---

## Operational Environment (Included Toolset)

| Tool | Purpose | Use Case |
|------|---------|----------|
| **nmap** | Network discovery & port scanning | Identify active hosts and open services |
| **tcpdump** | Packet capture & analysis | Monitor network traffic and protocols |
| **netcat** | TCP/UDP connection testing | Verify connectivity and service availability |
| **dig/nslookup** | DNS resolution | Troubleshoot domain name queries |
| **ping** | ICMP reachability testing | Verify network connectivity |
| **curl** | HTTP/HTTPS requests | Test web services and APIs |

---

## Manual Workflow Description

1. **Start the container:**
   ```bash
   docker-compose up -d
   docker exec -it network-testing-sandbox /bin/bash
   ```

2. **Run diagnostic commands:**
   ```bash
   # Example: Scan local network (authorized only)
   nmap -sn 192.168.1.0/24
   
   # Example: Capture packets on interface
   tcpdump -i eth0 -w /workspace/logs/capture.pcap
   
   # Example: Test TCP connection
   nc -zv example.com 80
   ```

3. **Review logs:**
   ```bash
   # Logs persist in ./logs/ directory on host
   cat /workspace/logs/scan_results.txt
   ```

4. **Exit and cleanup:**
   ```bash
   exit
   docker-compose down
   ```

---

## Configuration & Customization

**Custom Scripts:**
Place reusable bash or Python scripts in `./scripts/` directory. They will be available at `/workspace/scripts/` inside the container.

**Tool Configurations:**
Store custom tool profiles (e.g., nmap scan templates) in `./config/` directory.

**Example Script Structure:**
```bash
# scripts/quick_scan.sh
#!/bin/bash
nmap -sV -oN /workspace/logs/scan_$(date +%Y%m%d_%H%M%S).txt $1
```

---

## License

MIT License - See LICENSE file for details.

**Disclaimer:** This software is provided "as-is" without warranty. Users are solely responsible for compliance with applicable laws and regulations.
