# RABrL.Dots

## Description

This repository contains my customized configurations.

## Installation (Automatic Recommended!)

### The Easy Way! Test the automated process and let the script do all the work for you 😘

The **automatic installation script** is the quickest and easiest way to set up your development environment. This script handles all the heavy lifting, but remember that you **must install the font** mentioned below before running it. The script is designed for macOS, Linux, and WSL systems. If you’re on Windows, you’ll need to follow the manual steps first before attempting to run this script.

```bash
curl -O https://raw.githubusercontent.com/Gentleman-Programming/Gentleman.Dots/main/install-linux-mac.sh

sudo chmod +x install-linux-mac.sh
bash ./install-linux-mac.sh
```

This script saves you time and eliminates common errors by automating your environment setup. Give it a try and let me know how it goes!

---

## Manual Installation

### For Windows

**Important:** Windows users must follow these manual installation steps before running the automated script.

#### 1. Install WSL

WSL (Windows Subsystem for Linux) allows you to run Linux on Windows. Install it and set it to version 2:

```bash
wsl --install
wsl --set-default-version 2
```

#### 2. Install a Linux Distribution

Install a Linux distribution (e.g., Ubuntu) in WSL:

```bash
wsl --install -d Ubuntu
```

To list available distributions:

```bash
wsl --list --online
```

Install your preferred distribution:

```bash
wsl --install -d <distribution-name>
```

#### 3. Launch and Configure the Distribution

Open the installed distribution to complete setup. Update it with:

```bash
sudo apt-get update
sudo apt-get upgrade
```

#### 4. Install WezTerm Terminal Emulator

Choose and install one of the following terminal emulators:

- **WezTerm**: [Download and Install](https://wezfurlong.org/wezterm/installation.html).

#### 5. Configuration Transfer for Terminal Emulators

**WezTerm Configuration**

```powershell
cp .wezterm.lua %userprofile%

# Uncomment for Windows settings

# config.default_domain = 'WSL:Ubuntu'

# config.front_end = "WebGpu"
# config.max_fps = 120
```

### For macOS/Linux/WSL

#### Step 1: Install a Terminal Emulator

Choose and install one of the following terminal emulators:

- **WezTerm**

  [Download and Install](https://wezfurlong.org/wezterm/installation.html).


#### Step 2: Configuration Transfer for Terminal Emulators

**WezTerm Configuration**

```bash
cp .wezterm.lua ~/.config/wezterm/wezterm.lua
```

### Shared Steps (for macOS, Linux, or WSL)

#### Step 3: Shell Configuration (Zsh)

##### Zsh Configuration

1. **Install Zsh**

   ```bash
   sudo apt install zsh
   ```

2. **Install Zimfw**

   ```bash
   curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
   ```

3. **Copy Zsh Configuration**

   ```bash
   cp .zshrc ~/
   ```

4. **Set Project Paths**

   Modify `PROJECT_PATHS` in `~/.zshrc`:

   ```bash
   export PROJECT_PATHS="/your/work/path/"
   ```

5. **Set Zsh as the Default Shell**

   ```bash
   sudo sh -c "echo $(which zsh) >> /etc/shells"
   sudo chsh -s $(which zsh)
   ```

6. **Apply Zsh Configuration**

   ```bash
   source ~/.zshrc
   ```

#### Step 4: Additional Configurations

##### Dependencies Install

1. **Install build-essentials for LINUX** (for Linux and WSL)

   ```bash
   sudo apt-get update
   sudo apt-get upgrade
   sudo apt-get install build-essential
   ```

2. **Install Homebrew**
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

4. **Install NVIM**

   ```bash
   brew install nvim
   ```

5. **Install the following dependencies**

   ```bash
   brew install gcc fzf fd ripgrep lazygit
   ```

6. **Install CaskaydiaCove Nerd font**

   [Download and install the CaskaydiaCove Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CascadiaCode.zip)

##### Neovim Configuration

```bash
cp -r .config ~/.config
```

Restart Neovim to apply the changes.

##### Zellij Configuration

1. **Install Zellij**

   ```bash
   brew install zellij
   ```

2. **Copy Zellij Configuration**

   ```bash
   cp -r .config/zellij ~/.config
   ```
