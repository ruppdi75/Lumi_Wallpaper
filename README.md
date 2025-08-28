# 🎨 Lumi Wallpaper

<div align="center">
  
  ![GitHub stars](https://img.shields.io/github/stars/ruppdi75/Lumi_Wallpaper?style=flat-square)
  ![GitHub forks](https://img.shields.io/github/forks/ruppdi75/Lumi_Wallpaper?style=flat-square)
  ![GitHub issues](https://img.shields.io/github/issues/ruppdi75/Lumi_Wallpaper?style=flat-square)
  ![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)
  ![Platform](https://img.shields.io/badge/platform-Linux%20GNOME-orange?style=flat-square)
  
  **A beautiful minimalist cat wallpaper with easy system-wide installation for GNOME-based Linux distributions**
  
  [Features](#-features) • [Installation](#-installation) • [Usage](#-usage) • [Uninstall](#-uninstall) • [Contributing](#-contributing)
  
</div>

## 📸 Preview

<div align="center">
  <img src="lumi-wallpaper.png" alt="Lumi Wallpaper Preview" width="800">
  
  *A stylized black cat with golden eyes on a beautiful blue gradient background*
</div>

## ✨ Features

- 🖼️ **High-Quality Wallpaper**: 4K resolution (3840x2160) minimalist cat design
- 🚀 **One-Command Installation**: Simple script for system-wide wallpaper installation
- 🔧 **GNOME Integration**: Properly integrates with GNOME settings
- 🎯 **Zero Configuration**: Works out of the box with sensible defaults
- 🔄 **Easy Uninstall**: Clean removal script included
- 📦 **Self-Contained**: Wallpaper included in repository

## 📋 Prerequisites

- Linux distribution with GNOME desktop environment (Ubuntu, Fedora, AnduinOS, etc.)
- `sudo` privileges for system installation
- Git (for cloning the repository)

## 🚀 Installation

### Quick Install

```bash
# Clone the repository
git clone https://github.com/ruppdi75/Lumi_Wallpaper.git
cd Lumi_Wallpaper
# Run the installer
./install-wallpaper.sh
```

That's it! The wallpaper will be installed and available in your system settings.

### Manual Installation

If you prefer to specify custom parameters:

```bash
./install-wallpaper.sh [image_path] [wallpaper_name] [display_name]
```

**Example:**
```bash
./install-wallpaper.sh lumi-wallpaper.png "Lumi-Cat" "Lumi Cat Wallpaper"
```

## 🎯 Usage

After installation:

1. Open **Settings** → **Appearance** → **Background**
2. Find **"Lumi Cat Wallpaper"** in the wallpaper selection
3. Click to apply

> **Note:** If the wallpaper doesn't appear immediately, close and reopen Settings or log out and back in.

## 🗑️ Uninstall

To remove the wallpaper from your system:

```bash
./uninstall-wallpaper.sh
```

This will cleanly remove the wallpaper and its configuration files.

## 📁 Project Structure

```
Lumi_Wallpaper/
├── README.md                 # This file
├── LICENSE                   # MIT License
├── install-wallpaper.sh      # Installation script
├── uninstall-wallpaper.sh    # Uninstallation script
├── lumi-wallpaper.png        # The wallpaper image
├── wallpaper-info.md         # Wallpaper information
├── CONTRIBUTING.md           # Contribution guidelines
└── .gitignore               # Git ignore rules
```

## 🛠️ How It Works

The installation script:

1. **Validates** the wallpaper image file
2. **Copies** the wallpaper to `/usr/share/backgrounds/`
3. **Creates** an XML configuration in `/usr/share/gnome-background-properties/`
4. **Sets** proper file permissions
5. **Integrates** with GNOME's wallpaper selection system

## 🤝 Contributing

Contributions are welcome! Please read our [Contributing Guidelines](CONTRIBUTING.md) for details on:

- Submitting bug reports
- Proposing new features
- Creating pull requests
- Code style guidelines

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Designed for the Linux community
- Special thanks to all contributors
- Inspired by minimalist design principles

## 📧 Support

- **Issues**: [GitHub Issues](https://github.com/ruppdi75/Lumi_Wallpaper/issues)
- **Discussions**: [GitHub Discussions](https://github.com/ruppdi75/Lumi_Wallpaper/discussions)

---

<div align="center">
  Made with ❤️ for the Linux community
  
  ⭐ Star this repository if you find it useful!
</div>

