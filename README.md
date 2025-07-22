# Onity-Onportal 🔐

This repo has all my best tools and scripts for **Onity OnPortal** software. Whether you’re troubleshooting, setting up from scratch, or need to restart the Node service fast, you’ll find something useful here.

---

## 📂 Repository Contents

| File Name                                    | Description                                                       |
| -------------------------------------------- | ----------------------------------------------------------------- |
| `Onity Firewall Rules Before Installing.ps1` | Sets up Windows Firewall rules needed before installing OnPortal. |
| `RestartOnPortalNodeService.exe`             | Utility to force restart the OnPortal Node service.               |
| `RestartOnPortalNodeService.ps1`             | PowerShell version to restart the Node service if `.exe` fails.   |
| `icmp firewall rule ipv4_ipv6.ps1`           | Adds ICMP rules to allow ping (helpful for diagnostics).          |

---

## 📘 User Manual

Need a step-by-step install or stuck somewhere? Check out the official OnPortal Installation & Training Guide:
📄 [ilide.info-onportal-usermanual-and-trainingguide-rev4-pr.pdf](https://github.com/deadboy18/Onity-Onportal/blob/6f399c548ed5d355777001f1a2785b6d0ebf9988/ilide.info-onportal-usermanual-and-trainingguide-rev4-pr_7e2d252f2c81153e8761ddbbb1f3067a.pdf)

---

## 🧩 Software Installer

Download the official **FrontDesk-1.6.2.6151.exe** installer from any of these mirrors:

* 📁 **Google Drive**: [Download Here](https://drive.google.com/file/d/1W7_PqySJXmi5FgEgRlszERCHa06oV8Vj/view?usp=sharing)
* 🗃️ **Catbox.moe**: [Download Here (RAR)](https://files.catbox.moe/geovie.rar)
* 📦 **Mediafire**: [Download Here](https://www.mediafire.com/file/jt3qyqb486xmmkr/FrontDesk-1.6.2.6151.exe/file)

> ⚠️ If you grab from Catbox, it’s a `.rar`—extract with WinRAR or 7-Zip before using.

---

## 🛠 How to Use

1. **Run firewall script first:**

   ```powershell
   .\Onity Firewall Rules Before Installing.ps1
   ```
2. **Install OnPortal FrontDesk Software**
3. **If the node service won’t start, use the restart tool:**

   * Run `RestartOnPortalNodeService.exe` or the `.ps1` script

---

## 📂 Additional Resources

Want more Onity stuff? Manuals, backup tools, extra docs—I'll keep this shared folder updated with whatever I find or build. Check back anytime:

🔗 [Google Drive – Onity Resources](https://drive.google.com/drive/folders/1SvqWnelKiErwbBg_hek29KxUQFacFMsD?usp=sharing)

---

## 💬 Support

If you hit any issues, open an [Issue](https://github.com/deadboy18/Onity-Onportal/issues) or just DM me.

---

## 🔥 Disclaimer

This isn’t an official Onity repo. These tools are just what helped me or my team during real deployments. Use at your own risk. Always backup your configs and don’t blame me if something explodes 😂.
