# Links

https://www.techradar.com/pro/security/secure-boot-has-a-major-security-issue-hundreds-of-devices-from-dell-supermicro-and-more-all-affected-heres-what-we-know

https://www.binarly.io/advisories/brly-2024-005-usage-of-default-test-keys-leads-to-complete-secure-boot-bypass

```ps
[System.Text.Encoding]::ASCII.GetString((Get-SecureBootUEFI PK).bytes) -match "DO NOT TRUST|DO NOT SHIP"
```

```bash
sudo apt install efitools
efi-readvar -v PK
```