$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'factory_girl_api/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'factory_girl_api'
  s.version     = FactoryGirlApi::VERSION
  s.authors     = ['Alexis King']
  s.email       = ['lexi.lambda@gmail.com']
  s.homepage    = 'https://github.com/philosophie/factory_girl_api'
  s.summary     = 'A Rails engine for mainpulating factories via API'
  s.license     = 'MIT'

  s.files = Dir[
    '{app,config,db,lib}/**/*',
    'MIT-LICENSE',
    'Rakefile',
    'README.rdoc'
  ]
  s.test_files = Dir['test/**/*']

  s.add_dependency 'database_cleaner', '~> 1.4'
  s.add_dependency 'factory_girl_rails', '~> 4.0'
  s.add_dependency 'rails', '~> 4.2'

  s.add_development_dependency 'pry', '~> 0.10'
  s.add_development_dependency 'rspec-rails', '~> 3.1'
  s.add_development_dependency 'sqlite3', '~> 1.3'
end
