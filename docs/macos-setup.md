# macOS Setup Guide for Rails Development

This guide will help you set up a complete Ruby on Rails development environment on macOS.

## Prerequisites

- macOS 10.15 (Catalina) or later
- Admin access to your Mac
- Stable internet connection

## Step 1: Install Xcode Command Line Tools

First, install the essential development tools:

```bash
xcode-select --install
```

This will open a dialog box. Click "Install" and wait for the installation to complete.

## Step 2: Install Homebrew

Homebrew is the package manager for macOS that makes installing development tools easy.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Follow the installation prompts and add Homebrew to your PATH as instructed.

### For Apple Silicon Macs (M1/M2)

Add Homebrew to your PATH by running:

```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### For Intel Macs

Homebrew should automatically be added to your PATH.

## Step 3: Install Git

```bash
brew install git
```

Configure Git with your information:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## Step 4: Install Ruby

### Using rbenv (Recommended)

rbenv allows you to manage multiple Ruby versions easily.

```bash
# Install rbenv and ruby-build
brew install rbenv

# Add rbenv to your shell
echo 'eval "$(rbenv init -)"' >> ~/.zshrc

# Reload your shell
source ~/.zshrc

# Install Ruby 3.2.3
rbenv install 3.2.3

# Set it as your global version
rbenv global 3.2.3

# Verify installation
ruby --version
```

### Alternative: Using RVM

If you prefer RVM over rbenv:

```bash
# Install RVM
\curl -sSL https://get.rvm.io | bash -s stable

# Reload your shell
source ~/.rvm/scripts/rvm

# Install Ruby
rvm install 3.2.3
rvm use 3.2.3 --default
```

## Step 5: Install Rails and Essential Gems

```bash
# Install Rails
gem install rails

# Install Bundler (if not already installed)
gem install bundler

# Verify installation
rails --version
```

## Step 6: Install Node.js and Yarn

Rails applications often need Node.js for asset compilation:

```bash
# Install Node.js
brew install node

# Install Yarn
brew install yarn

# Verify installations
node --version
yarn --version
```

## Step 7: Install Database Systems

### SQLite (Included with Rails)

SQLite comes bundled with Rails and is perfect for development. No additional installation needed.

### PostgreSQL (Optional)

For production-like databases:

```bash
# Install PostgreSQL
brew install postgresql

# Start PostgreSQL service
brew services start postgresql

# Create a database user (optional)
createuser -s postgres
```

### MySQL (Optional)

Alternative database option:

```bash
# Install MySQL
brew install mysql

# Start MySQL service
brew services start mysql

# Secure installation
mysql_secure_installation
```

## Step 8: Install Text Editor

### Visual Studio Code (Recommended)

```bash
brew install --cask visual-studio-code
```

#### Useful VS Code Extensions

Install these extensions for Rails development:
- Ruby
- Ruby Solargraph
- Rails
- GitLens
- Prettier
- Auto Rename Tag
- Bracket Pair Colorizer

### Alternative Editors

```bash
# Sublime Text
brew install --cask sublime-text

# Atom
brew install --cask atom

# Vim (enhanced version)
brew install vim
```

## Step 9: Install Additional Development Tools

### Helpful Command Line Tools

```bash
# Modern replacement for ls
brew install exa

# Better grep
brew install ripgrep

# Modern replacement for find
brew install fd

# Git GUI tool
brew install --cask sourcetree

# API testing tool
brew install --cask postman
```

### Terminal Enhancements

```bash
# Oh My Zsh for better terminal experience
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Or iTerm2 for a better terminal app
brew install --cask iterm2
```

## Step 10: Test Your Setup

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

Open your browser and navigate to `http://localhost:3000`. You should see the Rails welcome page!

## Troubleshooting

### Common Issues

1. **Command not found errors:**
   - Make sure you've reloaded your shell: `source ~/.zshrc`
   - Check that the tool is in your PATH

2. **Ruby installation fails:**
   - Make sure Xcode Command Line Tools are installed
   - Try installing with specific flags:
     ```bash
     RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)" rbenv install 3.2.3
     ```

3. **Bundle install fails:**
   - Make sure you have the latest bundler: `gem update bundler`
   - Try `bundle config set --local force_ruby_platform true`

4. **Permission errors:**
   - Never use `sudo` with gem commands when using rbenv
   - If you see permission errors, check your rbenv installation

### macOS Specific Notes

#### For Apple Silicon Macs (M1/M2)

Some gems might need compilation flags:

```bash
# Add to your ~/.zshrc
export LDFLAGS="-L/opt/homebrew/lib"
export CPPFLAGS="-I/opt/homebrew/include"
export PKG_CONFIG_PATH="/opt/homebrew/lib/pkgconfig"
```

#### For Intel Macs

Generally, fewer compatibility issues, but you might still need:

```bash
# If you encounter OpenSSL issues
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
```

## Environment Configuration

Add these to your `~/.zshrc` file for a better development experience:

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
```

## Security Considerations

1. **Keep your system updated:**
   ```bash
   brew update && brew upgrade
   ```

2. **Regularly update gems:**
   ```bash
   gem update
   bundle update
   ```

3. **Use environment variables for secrets:**
   ```bash
   # Install dotenv for environment management
   gem install dotenv
   ```

## Next Steps

1. Complete the Rails Girls workshop tutorial
2. Set up your GitHub account and SSH keys
3. Join the Rails community
4. Start building your first project
5. Consider deploying to Heroku or another platform

## Getting Help

- [Homebrew Documentation](https://docs.brew.sh/)
- [rbenv GitHub Repository](https://github.com/rbenv/rbenv)
- [Rails Guides](https://guides.rubyonrails.org/)
- [Rails Girls Community](https://railsgirls.com/)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/ruby-on-rails)

## Performance Tips

1. **SSD Storage:** Ensure your projects are on SSD storage for better performance
2. **RAM:** Rails development benefits from at least 8GB RAM
3. **Terminal:** Use iTerm2 with Oh My Zsh for a better development experience
4. **Shortcuts:** Learn keyboard shortcuts for your editor and terminal