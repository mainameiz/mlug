source 'https://rubygems.org'

gem 'rails', '3.2.6'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  #gem 'font-awesome-sass-rails'
end


gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'devise'
gem 'haml'
gem 'rails-i18n'
gem 'cancan'
#gem 'redcarpet'
gem 'therubyracer', :platforms => :ruby

# Deploy related gems
gem 'unicorn'
gem 'capistrano'

gem 'rspec-rails', :group => [ :test, :development ]
gem 'guard', :group => [ :test, :development]

group :development do
  gem 'vagrant'
  gem 'surb', :path => '../gems/surb'

  # Only on Linux
  gem 'libnotify'
  gem 'rb-inotify'
end

group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'launchy'
  gem 'spork'
  gem 'guard-rspec'
  gem 'guard-spork'

  # Pretty printed test output
  gem 'turn', '0.8.2', :require => false
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# To use debugger
# gem 'debugger'
