ENV['RAILS_ENV'] ||= 'test'
ENV['RAILS_ROOT'] = File.expand_path('../dummy', __FILE__)
require File.expand_path('../dummy/config/environment', __FILE__)

require 'rspec/rails'

Dir[File.expand_path('../support/**/*.rb', __FILE__)].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = 'random'

  config.include FactoryGirl::Syntax::Methods
end