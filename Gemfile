source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails'
gem 'puma'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'turbolinks',
gem 'jbuilder'
gem 'will_paginate-bootstrap'
gem 'bootstrap-sass'
gem 'jquery-rails'
gem 'bcrypt'
gem 'gravatar_image_tag'
gem 'bootswatch'
gem 'devise'
gem 'jquery'
#gem 'pg', '0.20.0'
gem 'sqlite3'
gem 'stripe'
gem 'mailjet'
gem 'dotenv'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.7'
  gem 'guard-rspec', require: false
  gem 'factory_bot_rails'
  gem 'selenium-webdriver'
end

group :development do
  gem 'rspec-rails'
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :production do


end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]