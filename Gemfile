source "https://rubygems.org"

ruby "3.0.6"

gem "rails", "~> 7.1.2"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mswin mswin64 mingw x64_mingw jruby ]
gem "bootsnap", require: false
gem 'httparty'
gem 'sidekiq', '~> 7.1'
gem 'whenever', require: false

group :development, :test do
  gem "debug", platforms: %i[ mri mswin mswin64 mingw x64_mingw ]
end

group :development do
  gem "web-console"
  gem 'rubocop', '~> 1.57'
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
