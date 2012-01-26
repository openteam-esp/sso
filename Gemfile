source :rubygems

gem 'compass', '~> 0.12.alpha.0'
gem 'configliere'
gem 'default_value_for'
gem 'devise'
gem 'devise-russian'
gem 'formtastic', :require => false
gem 'has_searcher'
gem 'inherited_resources'
gem 'jquery-rails'
gem 'omniauth'
gem 'rails', :require => false
gem 'russian'
gem 'sass-rails'
gem 'sunspot_rails'

group :assets do
  gem 'therubyracer' unless RUBY_PLATFORM =~ /freebsd/
  gem 'uglifier'
end

group :development do
  gem 'annotate', '~> 2.4.1.beta1'
  gem 'sunspot_solr'
end

group :production do
  gem 'hoptoad_notifier'
  gem 'pg', :require => false
  gem 'unicorn', :require => false unless ENV['SHARED_DATABASE_URL']
end

group :test do
  gem 'sqlite3', :require => false
  gem 'turn', :require => false
end
