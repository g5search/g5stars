source 'https://rubygems.org'
ruby "1.9.3"

gem 'rails', '3.2.20'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'twitter-bootstrap-rails', '2.0.6'
gem 'devise', '2.2.8'
gem 'inherited_resources'
#gem 'curb'
gem 'nokogiri', '1.5.11'

group :production do
  gem 'pg'
  gem 'unicorn'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'therubyracer', :platform => :ruby
end

group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'nyan-cat-formatter'
  gem 'factory_girl_rails'
  gem 'factory_girl'
end

group :development, :test do
  gem 'sqlite3'
  gem 'ruby-debug19'
  gem 'awesome_print'
  gem 'pry'
end


gem 'jquery-rails'
