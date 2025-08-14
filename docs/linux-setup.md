# Linux Setup Guide for Rails Development

This guide covers Ruby on Rails setup for Ubuntu, Debian, and other Debian-based Linux distributions. Instructions for other distributions are also included.

## Ubuntu/Debian Setup

### Step 1: Update Your System

```bash
sudo apt update && sudo apt upgrade -y
```

### Step 2: Install Essential Dependencies

```bash
sudo apt install -y curl git build-essential libssl-dev libreadline-dev zlib1g-dev \
  libsqlite3-dev libxml2-dev libxslt1-dev libcurl4-openssl-dev \
  software-properties-common libffi-dev libyaml-dev
```

### Step 3: Install Node.js and Yarn

```bash
# Install Node.js (LTS version)
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn
```

### Step 4: Install Ruby using rbenv

```bash
# Install rbenv
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash

# Add rbenv to your PATH
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

# Reload your shell configuration
source ~/.bashrc

# Install Ruby 3.2.3
rbenv install 3.2.3
rbenv global 3.2.3

# Verify installation
ruby --version
```

### Step 5: Install Rails and Bundler

```bash
gem install rails bundler

# Verify installation
rails --version
```

### Step 6: Install Database Systems

#### SQLite (Default)
SQLite is already included with the dependencies we installed.

#### PostgreSQL
```bash
sudo apt install -y postgresql postgresql-contrib libpq-dev

# Start PostgreSQL service
sudo systemctl start postgresql
sudo systemctl enable postgresql

# Create a database user
sudo -u postgres createuser -s $USER
sudo -u postgres createdb $USER
```

#### MySQL
```bash
sudo apt install -y mysql-server mysql-client libmysqlclient-dev

# Secure MySQL installation
sudo mysql_secure_installation
```

## CentOS/RHEL/Fedora Setup

### Step 1: Update System

#### CentOS/RHEL 8+
```bash
sudo dnf update -y
sudo dnf groupinstall -y "Development Tools"
```

#### CentOS/RHEL 7
```bash
sudo yum update -y
sudo yum groupinstall -y "Development Tools"
```

#### Fedora
```bash
sudo dnf update -y
sudo dnf groupinstall -y "Development Tools" "C Development Tools and Libraries"
```

### Step 2: Install Dependencies

#### CentOS/RHEL/Fedora
```bash
sudo dnf install -y curl git openssl-devel readline-devel zlib-devel \
  sqlite-devel libxml2-devel libxslt-devel libcurl-devel \
  libyaml-devel libffi-devel
```

### Step 3: Install Node.js and Yarn

```bash
# Install Node.js
curl -fsSL https://rpm.nodesource.com/setup_lts.x | sudo bash -
sudo dnf install -y nodejs

# Install Yarn
curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo dnf install -y yarn
```

### Step 4: Continue with rbenv installation (same as Ubuntu)

## Arch Linux Setup

### Step 1: Update System

```bash
sudo pacman -Syu
```

### Step 2: Install Dependencies

```bash
sudo pacman -S base-devel curl git openssl readline zlib sqlite \
  libxml2 libxslt curl yaml libffi nodejs npm yarn
```

### Step 3: Install Ruby using rbenv

```bash
# Install rbenv from AUR (using yay)
yay -S rbenv ruby-build

# Or manually:
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# Add to shell
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc

# Install Ruby
rbenv install 3.2.3
rbenv global 3.2.3
```

## Text Editors and IDEs

### Visual Studio Code

#### Ubuntu/Debian
```bash
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install code
```

#### CentOS/RHEL/Fedora
```bash
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf install code
```

#### Arch Linux
```bash
yay -S visual-studio-code-bin
```

### Alternative Editors

#### Sublime Text
```bash
# Ubuntu/Debian
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update && sudo apt install sublime-text

# Arch Linux
yay -S sublime-text-4
```

#### Vim/Neovim
```bash
# Ubuntu/Debian
sudo apt install vim neovim

# CentOS/RHEL/Fedora
sudo dnf install vim neovim

# Arch Linux
sudo pacman -S vim neovim
```

## Git Configuration

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Optional: Set default editor
git config --global core.editor "code --wait"  # for VS Code
git config --global core.editor "vim"          # for Vim
```

## Shell Enhancements

### Zsh with Oh My Zsh

```bash
# Install Zsh
# Ubuntu/Debian
sudo apt install zsh

# CentOS/RHEL/Fedora
sudo dnf install zsh

# Arch Linux
sudo pacman -S zsh

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set Zsh as default shell
chsh -s $(which zsh)
```

### Useful Aliases

Add these to your `~/.bashrc` or `~/.zshrc`:

```bash
# Rails aliases
alias be="bundle exec"
alias r="rails"
alias rt="rails test"
alias rs="rails server"
alias rc="rails console"
alias rg="rails generate"
alias rdbm="rails db:migrate"
alias rdbs="rails db:seed"

# Git aliases
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git pull"
alias gco="git checkout"

# General aliases
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"
```

## Testing Your Setup

Create a test Rails application:

```bash
# Create a new Rails app
rails new test_app
cd test_app

# Install dependencies
bundle install

# Start the server
rails server
```

Visit `http://localhost:3000` in your browser. You should see the Rails welcome page!

## Troubleshooting

### Common Issues

1. **Ruby compilation fails:**
   ```bash
   # Install additional dependencies
   sudo apt install -y autoconf bison build-essential libssl-dev \
     libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev \
     libffi-dev libgdbm6 libgdbm-dev libdb-dev
   ```

2. **Bundle install fails:**
   ```bash
   # Update bundler
   gem update bundler
   
   # Clear bundle cache
   bundle clean --force
   ```

3. **PostgreSQL connection issues:**
   ```bash
   # Check if PostgreSQL is running
   sudo systemctl status postgresql
   
   # Start if not running
   sudo systemctl start postgresql
   ```

4. **Permission issues:**
   - Never use `sudo` with gem or rbenv commands
   - Make sure your user owns the ~/.rbenv directory

### Performance Tips

1. **Preload Rails environment:**
   ```bash
   # Add to your shell config
   export RAILS_ENV=development
   ```

2. **Use Spring for faster test runs:**
   ```bash
   # Spring is included by default in new Rails apps
   bundle exec spring start
   ```

3. **Optimize your editor:**
   - Install Ruby language server for better autocomplete
   - Use project-specific settings

## Security Considerations

1. **Keep system updated:**
   ```bash
   # Ubuntu/Debian
   sudo apt update && sudo apt upgrade
   
   # CentOS/RHEL/Fedora
   sudo dnf update
   
   # Arch Linux
   sudo pacman -Syu
   ```

2. **Regularly update gems:**
   ```bash
   gem update
   bundle update
   ```

3. **Use environment variables for secrets:**
   ```bash
   # Install dotenv
   gem install dotenv
   ```

## Additional Tools

### Database Management

```bash
# PostgreSQL client
sudo apt install postgresql-client

# MySQL client  
sudo apt install mysql-client

# GUI tools
sudo apt install pgadmin4     # PostgreSQL GUI
```

### Docker (Optional)

```bash
# Ubuntu/Debian
sudo apt install docker.io docker-compose

# Add user to docker group
sudo usermod -aG docker $USER

# Start Docker service
sudo systemctl start docker
sudo systemctl enable docker
```

## Next Steps

1. Complete the Rails Girls workshop
2. Set up your development workflow
3. Learn about Linux package management
4. Join the Rails community
5. Consider contributing to open source

## Getting Help

- [Ubuntu Community Help](https://help.ubuntu.com/)
- [Arch Linux Wiki](https://wiki.archlinux.org/)
- [Rails Guides](https://guides.rubyonrails.org/)
- [rbenv GitHub](https://github.com/rbenv/rbenv)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/ruby-on-rails)