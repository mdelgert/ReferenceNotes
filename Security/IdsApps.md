For detecting network intrusions in a homelab setup, here are some popular Docker-compatible tools that can alert you to suspicious activity:

### 1. **Suricata**
   - **Description**: An open-source intrusion detection (IDS), intrusion prevention system (IPS), and network security monitoring engine.
   - **Features**: Monitors network traffic, identifies suspicious patterns, and generates alerts.
   - **Docker Availability**: Easily deployed with Docker.
   - **Docker Compose Example**:
     ```yaml
     version: '3'
     services:
       suricata:
         image: jasonish/suricata:latest
         network_mode: "host"
         volumes:
           - ./suricata.yaml:/etc/suricata/suricata.yaml
           - ./logs:/var/log/suricata
     ```
   - **Notes**: Requires configuration of rules and network interfaces.

### 2. **Zeek (formerly Bro)**
   - **Description**: A powerful network analysis framework that can detect intrusions, log network activity, and inspect packets.
   - **Features**: Advanced detection and logging capabilities for network events.
   - **Docker Availability**: Available on Docker Hub.
   - **Docker Compose Example**:
     ```yaml
     version: '3'
     services:
       zeek:
         image: blacktop/zeek
         network_mode: "host"
         volumes:
           - ./zeek_logs:/opt/zeek/logs
     ```
   - **Notes**: Often used alongside Suricata for complementary detection.

### 3. **Security Onion**
   - **Description**: A comprehensive security monitoring and threat-hunting distribution that includes Suricata, Zeek, Elastic Stack, and more.
   - **Features**: Full-featured SIEM (Security Information and Event Management) solution.
   - **Docker Availability**: Though heavy, it has containerized versions available through Docker.
   - **Notes**: Requires substantial system resources, best for those seeking an integrated, all-in-one solution.

### 4. **Fail2Ban**
   - **Description**: A simpler, lightweight tool primarily for SSH and web applications that blocks suspicious IP addresses after failed login attempts.
   - **Features**: Protects against brute-force attacks and detects abnormal traffic patterns.
   - **Docker Availability**: Lightweight and easy to set up.
   - **Docker Compose Example**:
     ```yaml
     version: '3'
     services:
       fail2ban:
         image: crazymax/fail2ban
         volumes:
           - ./data:/data
           - /var/log:/var/log:ro
     ```
   - **Notes**: Works best as a supplemental tool alongside other IDS/IPS solutions.

### 5. **Wazuh**
   - **Description**: A security monitoring platform that provides threat detection, integrity monitoring, and incident response.
   - **Features**: Combines SIEM, vulnerability detection, and incident response into a single platform.
   - **Docker Availability**: Available with Docker Compose.
   - **Docker Compose Example**:
     ```yaml
     version: '3'
     services:
       wazuh:
         image: wazuh/wazuh
         ports:
           - "5601:5601"  # Kibana
           - "1514:1514"  # Wazuh manager
         volumes:
           - ./wazuh-config:/etc/wazuh-manager
           - ./wazuh-logs:/var/ossec/logs
     ```
   - **Notes**: More complex, but provides comprehensive monitoring across multiple hosts.

### Tips for Using These Tools:
   - **Combine Tools**: Many users run Suricata and Zeek together for comprehensive network monitoring.
   - **Logging & Alerts**: Set up alerts to notify you of anomalies, possibly through email, Slack, or another alerting system.
   - **System Resources**: Some tools like Security Onion or Wazuh require substantial resources, so ensure your homelab server can handle the load.
   - **Network Mode**: For network monitoring, use `network_mode: "host"` in Docker Compose to allow tools to access the host's network directly.

These tools will help you detect unusual activity and stay on top of potential threats to your network.