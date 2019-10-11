source 'https://rubygems.org'
ruby File.read(File.expand_path('../.ruby-version', __FILE__)).chomp

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
gem 'responders', '~> 2.0' # brought over becuase the upgrade to rails 4.2 broke this in controllers

gem 'pg'

gem 'mime-types'#, '~> 2.6.1', require: 'mime/types/columnar'

# Use SCSS for stylesheets
gem 'sass-rails'#, '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'#, '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'#, '~> 4.0.0'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'sprockets-rails', '2.3.3'
# gem 'turbolinks'  # we might be able to kill this one off with a pure ember app

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'json', '~> 2.0.2'   # 2.4 hack
gem 'jbuilder'      #, '~> 2.0'
gem 'oj'            # json render
gem 'oj_mimic_json' # we need this for Rails 4.1.x

# webserver
gem 'puma'

# perf
gem 'fast_blank'

# social
gem 'slack-notifier', '~> 2.1.0', require: false

# date manipulation
gem 'chronic'

# exception handler
gem 'rollbar'

# async
gem 'faktory_worker_ruby'
gem 'sucker_punch' # , '~> 1.0'

# job notification
gem 'snitcher'

# store related gems
gem 'printful_api', require: false

# gem 'tunemygc'

# security
gem 'rack-attack'

group :development, :test do
  # gem 'quiet_assets'

  gem 'thin'
  gem 'bullet' #orm profiling

  gem 'dotenv-rails'
  gem 'foreman' # for the procfile
  gem 'minitest-rails'#, '~> 2.0.0.beta1'
  gem 'minitest-rails-capybara', '~> 3.0.1'
  # gem 'capybara', '~> 2.18.0'
  gem 'rails-controller-testing'
  gem 'mocha'
  # gem 'turn'

 # benchmarking
 # gem 'rails-perftest'
 # gem 'ruby-prof'
 gem 'rails-erd'
end

group :production do
  gem 'rails_12factor'
  gem 'heroku-deflater'
end

# bundle exec rake doc:rails generates the API under doc/api.
# gem 'sdoc', '~> 0.4.0',          group: :doc
