# Onity-Onportal 🔐

This repo contains helpful tools and scripts related to the **Onity OnPortal** software.  
Whether you're troubleshooting, doing fresh installs, or restarting the Node services, this repo has you covered.

---

## 📂 Repository Contents

| File Name                           | Description                                                                 |
|------------------------------------|-----------------------------------------------------------------------------|
| `Onity Firewall Rules Before Installing.ps1` | Sets up Windows Firewall rules needed before installing OnPortal.          |
| `RestartOnPortalNodeService.exe`   | Utility to force restart the OnPortal Node service.                         |
| `RestartOnPortalNodeService.ps1`   | PowerShell version to restart the Node service if `.exe` fails or not allowed. |
| `icmp firewall rule ipv4_ipv6.ps1` | Adds ICMP rules to allow ping (useful for diagnostics).                     |

---

## 📘 User Manual

Refer to the official **OnPortal Installation & Training Guide** if you need a step-by-step walkthrough:  
📄 [ilide.info-onportal-usermanual-and-trainingguide-rev4-pr.pdf](https://github.com/deadboy18/Onity-Onportal/blob/6f399c548ed5d355777001f1a2785b6d0ebf9988/ilide.info-onportal-usermanual-and-trainingguide-rev4-pr_7e2d252f2c81153e8761ddbbb1f3067a.pdf)


## 🧩 Software Installer

You can download the official **FrontDesk-1.6.2.6151.exe** installer using any of the mirrors below:

- 📁 **Google Drive**: [Download Here](https://drive.google.com/file/d/1W7_PqySJXmi5FgEgRlszERCHa06oV8Vj/view?usp=sharing)
- 🗃️ **Catbox.moe**: [Download Here (RAR)](https://files.catbox.moe/geovie.rar)
- 📦 **Mediafire**: [Download Here](https://www.mediafire.com/file/jt3qyqb486xmmkr/FrontDesk-1.6.2.6151.exe/file)

> ⚠️ Note: If you're downloading from Catbox, make sure to extract the `.rar` file using WinRAR or 7-Zip.


## 🛠 How to Use

1. **Run firewall scripts before installation**
   ```powershell
   .\Onity Firewall Rules Before Installing.ps1
````

2. **Install OnPortal FrontDesk Software**

3. **Use the restart service tool if the node service fails to start**

   * Run `RestartOnPortalNodeService.exe` or the `.ps1` script


## 💬 Support

Got issues? Open an [Issue](https://github.com/deadboy18/Onity-Onportal/issues) or DM me.


## 🔥 Disclaimer

This is not an official Onity repo. These tools were built to assist with deployments and are shared as-is. Use with caution and always backup your configs.
