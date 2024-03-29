source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

gem 'devise', '~> 4.9', '>= 4.9.3'
gem 'devise-jwt', '~> 0.11.0'

gem 'dotenv-rails', '~> 2.8', '>= 2.8.1'

gem 'image_processing', '~> 1.12', '>= 1.12.2'

gem 'jsonapi.rb', '~> 2.0', '>= 2.0.1'
gem 'jsonapi-serializer', '~> 2.2'

gem 'rack-cors', '~> 2.0', '>= 2.0.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.0.6', '>= 6.0.6.1'

gem 'ransack', '~> 3.1'

gem 'pundit', '~> 2.3', '>= 2.3.1'
gem 'rubocop', require: false
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'
gem 'shrine', '~> 3.5'

group :development, :test do
  gem 'annotate', '~> 3.2'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 5.0.0'
end

group :development do
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner-active_record', '~> 2.1'
  gem 'factory_bot_rails', '~> 6.4', '>= 6.4.2'
  gem 'ffaker', '~> 2.17'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'simplecov', '~> 0.22.0', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
