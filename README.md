# ❄️ NixOS Dotfiles

Welcome to my personal NixOS configuration! This repository manages my entire desktop environment, system utilities, and application settings using Nix Flakes and Home Manager.

---

## 🖥️ Hardware Setup
* **CPU:** AMD Ryzen 5 3600
* **GPU:** AMD Radeon RX 7700 XT
* **OS:** NixOS (Unstable Branch)
* **Display Server:** Wayland

## 🛠️ Tech Stack & Desktop Environment
* **Window Manager:** Hyprland
* **Shell:** Fish
* **Terminal:** Alacritty
* **File Manager:** Yazi
* **Editor:** Zed / Micro
* **Bar:** Waybar
* **Notifications:** Mako

---

## 🚀 Key Features
* **Flake-based Configuration:** Completely reproducible system state.
* **Home Manager Integration:** User-space configurations are kept modular and declarative.
* **Audio Optimization:** Integrated with `musnix` for real-time audio processing performance.
* **Custom Plymouth Boot:** Smooth visual transition from boot to desktop using a custom theme.

---

## 📂 Repository Structure
* `flake.nix` - Entry point for the system configuration.
* `configuration.nix` - Core system settings, hardware imports, and global packages.
* `boot.nix` - Plymouth theme and bootloader setup.
* `home/` - Home Manager configuration block.
  * `default.nix` - User profile settings and application imports.

---

## ⚠️ Disclaimer
> [!WARNING]
> This configuration is tailored specifically to my hardware and personal preferences. Do not blindly apply it to your system without updating the `hardware-configuration.nix` and checking device UUIDs!
