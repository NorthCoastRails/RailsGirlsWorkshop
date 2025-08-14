# Windows Setup Guide for Rails Development

This comprehensive guide will help you set up a complete Ruby on Rails development environment on Windows using Windows Subsystem for Linux (WSL).

## Prerequisites

### Check Your Windows Version

Press `Windows + R`, type `winver`, and press Enter.

**Required:** Windows 10 version 2004 and higher (Build 19041 and higher) or Windows 11.

If your version is older, please update Windows first.

## Step 1: Install WSL 2

### Enable WSL

1. Open PowerShell as Administrator:
   - Press `Windows + X`
   - Select "Windows PowerShell (Admin)"

2. Run the installation command:
   ```powershell
   wsl --install
   ```

3. This command will:
   - Enable the WSL feature
   - Enable the Virtual Machine Platform feature
   - Install the latest Linux kernel
   - Set WSL 2 as default
   - Install Ubuntu distribution

4. Restart your computer when prompted.

### Alternative Manual Installation

If the automatic installation doesn't work:

1. Enable WSL and Virtual Machine Platform features:
   ```powershell
   dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
   dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
   ```

2. Download and install the WSL2 Linux kernel update package from Microsoft.

3. Set WSL 2 as default:
   ```powershell
   wsl --set-default-version 2
   ```

4. Install Ubuntu from Microsoft Store.

## Step 2: Setup Ubuntu

1. Launch Ubuntu from Start Menu
2. Wait for installation to complete
3. Create a username and password (remember these!)
4. Update the system:
   ```bash
   sudo apt update && sudo apt upgrade -y
   ```

## Step 3: Install Development Tools

### Install Essential Build Tools

```bash
sudo apt install -y curl git build-essential libssl-dev libreadline-dev zlib1g-dev libsqlite3-dev
```

### Install Node.js (for Rails asset pipeline)

```bash
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs
```

### Install Yarn (package manager)

```bash
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn
```

## Step 4: Install Ruby

### Using rbenv (Recommended)

```bash
# Install rbenv
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash

# Add rbenv to your PATH
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

# Reload your shell
source ~/.bashrc

# Install Ruby 3.2.3
rbenv install 3.2.3
rbenv global 3.2.3

# Verify installation
ruby --version
```

### Install Rails and Bundler

```bash
gem install rails bundler
```

## Step 5: Install Text Editor

### Visual Studio Code (Recommended)

1. Download VS Code from [https://code.visualstudio.com/](https://code.visualstudio.com/)
2. Install the WSL extension:
   - Open VS Code
   - Go to Extensions (Ctrl+Shift+X)
   - Search for "WSL"
   - Install the official WSL extension by Microsoft

3. Open your project in VS Code from WSL:
   ```bash
   cd your-project-directory
   code .
   ```

### Useful VS Code Extensions for Rails

- Ruby
- Ruby Solargraph
- Rails
- GitLens
- Prettier
- Auto Rename Tag

## Step 6: Configure Git

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## Step 7: Test Your Setup

Create a test Rails application:

```bash
# Create a new Rails app
rails new test_app
cd test_app

# Start the server
rails server

# Open browser to http://localhost:3000
```

## Troubleshooting

### Common Issues

1. **WSL installation fails:**
   - Make sure Windows is updated
   - Enable virtualization in BIOS
   - Try manual installation steps

2. **Ruby installation fails:**
   - Install additional dependencies:
     ```bash
     sudo apt install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev
     ```

3. **Rails server doesn't start:**
   - Check if all dependencies are installed
   - Try `bundle install` in your project directory

4. **Permission issues:**
   - Never use `sudo` with gem or rbenv commands
   - If you see permission errors, check your rbenv installation

### Getting Help

- [WSL Documentation](https://docs.microsoft.com/en-us/windows/wsl/)
- [Rails Girls Community](https://railsgirls.com/)
- [Stack Overflow WSL tag](https://stackoverflow.com/questions/tagged/wsl)

## Next Steps

Once your environment is set up:

1. Complete the Rails Girls workshop tutorial
2. Join the Rails Girls community
3. Start building your own projects
4. Consider contributing to open source projects

## File System Notes

### Working with Files

- Your Ubuntu files are located at: `\\wsl$\Ubuntu\home\yourusername\`
- You can access Windows files from Ubuntu at: `/mnt/c/`
- It's recommended to keep your code projects in the Ubuntu file system for better performance

### Best Practices

- Keep all your development work in the Ubuntu file system
- Use VS Code with WSL extension for editing
- Access files through the terminal rather than Windows Explorer when possible