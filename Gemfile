source "https://rubygems.org"

gem "rails", "~> 8.0.2"
gem "propshaft"  # Modern asset pipeline
gem "pg", "~> 1.1"  # PostgreSQL
gem "puma", ">= 5.0"  # Puma web server
gem "jbuilder"  # Build JSON APIs
gem "tzinfo-data", platforms: %i[ windows jruby ]  # Time zone data
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
gem "bootsnap", require: false  # Reduce boot times
gem "kamal", require: false  # Docker deployment
gem "thruster", require: false  # Asset caching for Puma
gem "tailwindcss-rails"  # Tailwind CSS gem

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false  # Static analysis for security vulnerabilities
  gem "rubocop-rails-omakase", require: false  # Ruby styling
end

group :development do
  gem "web-console"  # Debugging tool in development
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
