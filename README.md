# Rails Girls Workshop Platform 🎉

A comprehensive Ruby on Rails application that serves as the official guide platform for Rails Girls workshops. This platform provides step-by-step instructions, environment setup guides, and resources for learning web development with Ruby on Rails.

## 🌟 Purpose

This application serves as:
- **Workshop Guide**: Step-by-step tutorials for building your first Rails application
- **Setup Assistant**: Environment-specific installation instructions for Windows (WSL), macOS, and Linux
- **Resource Hub**: Curated learning materials, documentation, and community links
- **Community Platform**: Base for Rails Girls events worldwide

Perfect for Rails Girls workshops, coding bootcamps, and anyone starting their web development journey!

## 🚀 Quick Start

### Prerequisites

- Ruby 3.0+ 
- Rails 7.0+
- Git
- A text editor (VS Code recommended)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/NorthCoastRails/RailsGirlsWorkshop.git
   cd RailsGirlsWorkshop
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Setup the database**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. **Start the server**
   ```bash
   rails server
   ```

5. **Visit the application**
   Open your browser and go to `http://localhost:3000`

## 📚 What's Included

### Main Sections

- **🏠 Home**: Welcome page with workshop overview
- **🔧 Setup Guide**: Environment-specific installation instructions
- **📝 Workshop Steps**: Complete tutorial for building your first Rails app
- **📖 Resources**: Learning materials and community links

### Documentation

The `/docs` folder contains detailed setup guides:

- [`docs/windows-setup.md`](docs/windows-setup.md) - Windows with WSL setup
- [`docs/macos-setup.md`](docs/macos-setup.md) - macOS development environment  
- [`docs/linux-setup.md`](docs/linux-setup.md) - Linux (Ubuntu/Debian/Arch) setup

## 🛠️ For Workshop Organizers

### Customization

1. **Update branding** in `app/views/layouts/application.html.erb`
2. **Modify workshop content** in `app/views/pages/`
3. **Add your city/event info** in the homepage
4. **Customize styling** in `app/assets/stylesheets/application.css`

### Deployment Options

- **Heroku**: Easy deployment with the included `Dockerfile`
- **Render**: Modern hosting platform
- **DigitalOcean**: VPS deployment
- **GitHub Pages**: For static content only

### Contributing to Your Local Event

Fork this repository and customize it for your Rails Girls event:

1. Fork the repository
2. Update event-specific information
3. Deploy to your preferred platform
4. Share with workshop participants

## 💡 Built With

- **Ruby on Rails 8.0** - Web application framework
- **SQLite** - Default database (easily changeable)
- **Bootstrap-inspired CSS** - Responsive styling
- **Stimulus** - JavaScript framework
- **Turbo** - SPA-like page acceleration

## 🎯 Learning Path

### For Complete Beginners

1. Start with the **Setup Guide** for your operating system
2. Follow the **Workshop Steps** to build your first app
3. Explore **Resources** for continued learning
4. Join the Rails Girls community

### For Organizers

1. Fork and customize this repository
2. Update workshop content for your event
3. Deploy to your preferred platform
4. Use as the central hub for your workshop

## 🤝 Contributing

We welcome contributions! This platform is designed to be improved by the Rails Girls community.

### How to Contribute

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Areas for Contribution

- Additional setup guides for other operating systems
- Improved workshop tutorials
- More learning resources
- Accessibility improvements
- Translations for international events
- Bug fixes and performance improvements

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 🌍 Rails Girls Community

- **Global Website**: [railsgirls.com](https://railsgirls.com/)
- **Twitter**: [@railsgirls](https://twitter.com/railsgirls)
- **GitHub**: [github.com/railsgirls](https://github.com/railsgirls)

## 💬 Support

- **Issues**: Report bugs or request features via GitHub Issues
- **Community**: Join Rails Girls Slack or Discord communities
- **Stack Overflow**: Tag questions with `rails-girls`
- **Local Meetups**: Find Rails Girls events in your area

## 🙏 Acknowledgments

- Rails Girls global community for inspiration and guidance
- All workshop organizers and mentors worldwide
- Contributors who help improve this platform
- The Ruby on Rails core team for the amazing framework

---

**Ready to start your Rails journey?** 🚀 [Get Started with Setup →](http://localhost:3000/setup)

Built with ❤️ for the Rails Girls community
