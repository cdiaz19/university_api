# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.3.6"

gem "rails", "~> 8.0.0"
gem "pg"
gem "puma", ">= 5.0"
gem "jbuilder"

# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
gem "bootsnap", require: false
gem "kamal", require: false
gem "thruster", require: false
gem "rack-cors"
gem "will_paginate", "~> 3.3"
gem "faker"

group :test do
  gem "shoulda-matchers", "~> 4.0"
end

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false
  gem "dotenv-rails"
  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false
  gem "rspec-rails", "~> 7.0.0"
  gem "factory_bot_rails"
end

gem "tzinfo-data", platforms: %i[ windows jruby ]
