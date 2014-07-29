source 'https://rubygems.org'
ruby '2.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.1.0'

gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
#gem 'turbolinks'  # we might be able to kill this one off with a pure ember app
gem 'ember-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
gem 'oj'  # json render
gem 'oj_mimic_json' # we need this for Rails 4.1.x
# webserver
gem 'unicorn'
gem "gctools", :github => "FooBarWidget/gctools", :require => false
# perf
gem 'fast_blank'

#social
gem "slack-notifier", :require => false

#date manipulation
gem "chronic"

#cache
gem 'dalli'

#exception handler
gem 'rollbar'


group :development, :test do
  gem 'quiet_assets'
  gem 'spring'# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring

  gem 'thin'
  gem 'bullet' #orm profiling

  gem 'dotenv-rails'
  gem 'foreman' # for the procfile
  gem 'minitest-rails'#, '~> 2.0.0.beta1'
  gem 'minitest-rails-capybara'
  gem 'minitest-reporters', git: 'git://github.com/kern/minitest-reporters.git'
  gem 'mocha'
  #gem 'turn'

end

group :production do
  gem 'rails_12factor'
  gem 'newrelic_rpm'
  gem 'heroku-deflater'
end

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc
