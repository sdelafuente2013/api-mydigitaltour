# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'rails', '~> 7.0.4', '>= 7.0.4.2'
gem 'puma', '~> 5.0'
gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]
gem 'bootsnap', require: false
gem 'rack-cors'
gem 'devise', '~> 4.8', '>= 4.8.1'
gem 'devise-jwt'
gem 'jsonapi-serializer'
gem 'rswag-api'
gem 'rswag-ui'

group :development, :test do
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails', '~> 6.0.0'
  gem 'shoulda-matchers'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker', '~> 2.23'
  gem 'byebug', '~> 9.0', '>= 9.0.6'
end

gem 'simplecov', require: false, group: :test

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :production do
  gem 'pg', '~> 1.1'
end

group :rubocop do
  gem 'rubocop', '>= 1.25.1', require: false
  gem 'rubocop-packaging', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
end
