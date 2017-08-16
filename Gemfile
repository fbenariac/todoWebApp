source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.0'

# DB ORM adapter lib
gem 'mysql2', '0.3.20'

# Encryptions lib
gem 'bcrypt'

# Use Puma as the app server
gem 'puma', '~> 3.7'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Devise authenticate gem
gem 'devise', '4.3.0'

# CanCanCan user rules gem
gem 'cancancan', '2.0.0'

# Assets stuff
gem 'sass-rails',   '>= 5'
gem 'coffee-rails', '>= 4.2'
gem 'uglifier', '>= 1.3.0'
gem 'bootstrap-sass', '>= 2.0.3.1'
gem 'jquery-rails', '>= 4.1.1'

# Devs
group :development, :test do
  gem 'sdoc', '~> 0.4.0', require: false
  gem 'rspec', '3.4.0',   require: false
  gem 'listen', '>= 3.0.5', '< 3.2', require: false
  gem 'annotate',         require: false
  gem 'rails-erd',        require: false
  gem 'simplecov',        require: false
end
