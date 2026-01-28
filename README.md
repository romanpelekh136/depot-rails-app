# Depot - Rails 8 E-Commerce Application

A study project from the book **Agile Web Development with Rails 8**. This is a full-featured online store application built with Rails 8, demonstrating modern Rails development practices.

## About

Depot is an e-commerce application being built as I follow along with the book. The project demonstrates:
- Product catalog management
- Shopping cart functionality
- Line items and order processing
- Modern Rails 8 features (Turbo, Stimulus, Solid Queue, Solid Cache)
- Responsive design with Tailwind CSS

**Note:** This is a work-in-progress learning project. Features are being implemented chapter by chapter.

## Tech Stack

- **Ruby**: 3.4.5
- **Rails**: 8.0.4
- **Database**: SQLite3
- **Frontend**: Tailwind CSS, Hotwire (Turbo + Stimulus)
- **Testing**: RSpec

## Prerequisites

- Ruby 3.4.5 (consider using [asdf](https://asdf-vm.com/) or [rbenv](https://github.com/rbenv/rbenv))
- Bundler
- SQLite3
- Node.js (for asset pipeline)

## Setup

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd depot-rails-app
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Setup the database**
   ```bash
   bin/rails db:create
   bin/rails db:migrate
   bin/rails db:seed
   ```

4. **Start the development server**
   ```bash
   bin/dev
   ```
   
   Or manually:
   ```bash
   bin/rails server
   ```

5. **Visit the application**
   
   Open your browser and navigate to `http://localhost:3000`

## Running Tests

```bash
bundle exec rspec
```

## Features

As I progress through the book, I'm implementing:
- Product CRUD operations
- Shopping cart with AJAX updates
- Line items management
- Responsive UI with Tailwind CSS
- Turbo Frames for dynamic updates
- Comprehensive test suite with RSpec

## Project Structure

```
app/
├── controllers/    # Application controllers
├── models/         # Active Record models
├── views/          # View templates
├── javascript/     # Stimulus controllers
└── assets/         # Stylesheets and images

spec/               # RSpec test suite
db/                 # Database schema and migrations
config/             # Application configuration
```

## Learning Resources

This project follows the book:
- **Agile Web Development with Rails 8**
- Published by The Pragmatic Bookshelf

## License

This is a study project for educational purposes.
