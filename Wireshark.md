# How to Decrypt SSL with Wireshark – HTTPS Decryption Guide
https://www.comparitech.com/net-admin/decrypt-ssl-with-wireshark/
https://unit42.paloaltonetworks.com/wireshark-tutorial-decrypting-https-traffic/

# Edit user environment variables

SSLKEYLOGFILE
%USERPROFILE%\Documents\Wireshark\ssl-keys.log

# Wireshark preferences -> TLS
Change (Pre) Master Secrete log
%USERPROFILE%\Documents\Wireshark\ssl-keys.log

# Test
Go to https://www.wireshark.org/

# Filter
frame contains "wireshark"