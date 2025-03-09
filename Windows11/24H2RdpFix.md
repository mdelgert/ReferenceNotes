# Windows 11 24H2 RDP hangs on login, RDP session connecting issues reported

https://winaero.com/windows-11-24h2-has-issues-with-rdp-after-recent-udpates/

https://www.windowslatest.com/2025/02/21/windows-11-24h2-rdp-hangs-on-login-rdp-session-connecting-issues-reported/

https://learn.microsoft.com/en-us/answers/questions/2086656/upgrading-to-windows-11-24h2-causes-remote-desktop

https://community.imprivata.com/s/question/0D5WP00000GxPUq0AN/it-seems-that-windows-11-24h2-is-causing-cpamsecurelink-sessions-to-become-pixelated-normal-rdp-sessions-are-fine-but-not-the-connections-made-from-the-cpamsl-ive-tried-several-avenues-of-troubleshooting-but-not-seems-to-solve-it

To address this issue you need to change the following Group Policy settings. If you are affected, navigate to gpedit.msc > Local Computer Policy > Computer Configuration > Administrative Templates > Windows Components > Remote Desktop Services > Remote Desktop Session Host > Connections. Here, you'll find an option labeled "Select network detection on the server."

You need to enable this policy and set it to turn off both Connect Time Detect and Continuous Network Detect. Applying these changes doesn't require a system restart; instead, running the command gpupdate /force will apply the updated policies. Some users have found that disabling Continuous Network Detect is sufficient to fix the issue.
