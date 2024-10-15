Here's a `README.md` that explains how to add an active response in Wazuh for blocking IPs based on brute-force attempts and how to restart Wazuh Manager:

```markdown
# Wazuh Active Response for Blocking Brute-Force Attacks

This guide explains how to configure Wazuh to automatically block IP addresses that exhibit brute-force behavior, such as repeated failed login attempts. We’ll set up an active response that blocks the attacker’s IP for a specified duration.

## Prerequisites

- Wazuh Manager is installed and running.
- You have access to edit the Wazuh configuration files (e.g., `ossec.conf`).
- Sudo privileges to restart Wazuh services.

## Steps to Configure the Active Response

### Step 1: Edit the `ossec.conf` Configuration File

1. Open the Wazuh Manager configuration file located in `/var/ossec/etc/ossec.conf`:

    ```bash
    sudo nano /var/ossec/etc/ossec.conf
    ```

2. Add the following active response configuration under the `<ruleset>` section:

    ```xml
    <active-response>
      <command>firewall-drop</command>
      <location>any</location>
      <level>8</level>
      <timeout>30</timeout>
    </active-response>
    ```

   - **`<command>`**: Specifies the action (`firewall-drop`) to be executed when the response is triggered.
   - **`<location>`**: Set to `any` to apply the response to all locations.
   - **`<level>`**: Sets the alert level threshold. Alerts with a severity of 8 or higher will trigger this response.
   - **`<timeout>`**: The duration (in seconds) that the IP will remain blocked. In this example, the IP will be blocked for 30 seconds.

3. Save and close the `ossec.conf` file.

### Step 2: Configure the Rule Threshold (Optional)

To ensure the response is triggered only after a specified number of attacks, configure the appropriate rule with frequency and timeframe limits. Locate the rule file (e.g., `ossec_rules.xml`) and modify or add the following settings:

```xml
<rule id="100001" level="8">
  <decoded_as>ssh_failed</decoded_as>
  <description>SSH brute-force attack detected</description>
  <group>ssh,authentication_failed</group>
  <frequency>5</frequency> <!-- Number of attempts -->
  <timeframe>60</timeframe> <!-- Time window in seconds -->
  <alert_by>srcip</alert_by> <!-- Group alerts by source IP -->
</rule>
```

This example configuration triggers an alert (and the active response) when 5 failed login attempts occur within 60 seconds from the same IP.

### Step 3: Restart Wazuh Manager

After making changes to the configuration files, restart Wazuh Manager to apply them:

```bash
sudo systemctl restart wazuh-manager
```

To verify that Wazuh Manager restarted successfully, check the service status:

```bash
systemctl status wazuh-manager
```

## Testing the Active Response

To test this configuration, simulate a brute-force attack (e.g., multiple failed login attempts) from a specific IP within the timeframe you configured. You can check if the IP is blocked by listing the firewall rules:

```bash
sudo iptables -L -n
```

## Troubleshooting

If Wazuh Manager fails to restart or the active response isn’t triggered as expected, check the following:

- **Configuration errors**: Run `journalctl -xeu wazuh-manager` to view detailed logs of the restart process.
- **Wazuh logs**: Check `/var/ossec/logs/ossec.log` for additional error messages.

## Additional Notes

- Setting `<timeout>0</timeout>` would make the ban permanent until manually removed.
- Wazuh Manager may require additional permissions to modify firewall rules; ensure the user running Wazuh has the appropriate permissions.

This configuration provides automated blocking of brute-force attackers, enhancing the security of your system.
```

This `README.md` provides a structured overview of configuring and applying the active response, with clear steps and troubleshooting tips.