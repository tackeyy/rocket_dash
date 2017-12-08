source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# ============================
# Database
# ============================
# Seeds
gem 'seed-fu'

# Logical delete
gem 'paranoia'
# ============================
# View
# ============================
# Bootstrap & Bootswatch & font-awesome
gem 'bootstrap-sass'
gem 'font-awesome-rails'

# Fast Haml
gem 'faml'

# Pagenation
gem 'kaminari'

# Breadcrumbs
gem 'gretel'

group :deployment do
  # Deploy
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rails-console'
  gem 'capistrano-rbenv'
  gem 'capistrano3-puma'
end

group :development do
  gem 'listen', '~> 3.1.5'

  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'erb2haml'

  # help to kill N+1
  gem 'bullet'

  # To generate haml view by scaffold or other generate command
  gem 'haml-rails'

  # Syntax Checker
  # hook event pre-commit, pre-push
  gem 'overcommit', require: false

  # A static analysis security vulnerability scanner
  gem 'brakeman', require: false

  # Checks for vulnerable versions of gems
  gem 'bundler-audit', require: false

  gem 'haml-lint', require: false

  # A Ruby static code analyzer
  gem 'rubocop', require: false

  # Live load browser
  gem 'guard-livereload', require: false
end

group :development, :test do
  # Pry & extensions
  gem 'better_errors'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'pry-stack_explorer'

  # Show SQL result in Pry console
  gem 'awesome_print'
  gem 'hirb'

  # Checks email
  gem 'letter_opener_web'

  # PG/MySQL Log Formatter
  gem 'rails-flog'

  # Table/Schema
  gem 'annotate'

  # Rspec
  gem 'rspec-rails', '~> 3.6'

  # test fixture
  gem 'factory_bot_rails'

  # Handle events on file modifications
  gem 'guard-rspec',      require: false
  gem 'guard-rubocop',    require: false
end

group :test do
  # Mock for HTTP requests
  gem 'webmock'

  # Time Mock
  gem 'timecop'

  # Support to generate Test Data
  gem 'faker'

  # Cleaning test data
  gem 'database_rewinder'

  # This gem brings back assigns to your controller tests
  gem 'rails-controller-testing'
end