ENV['RACK_ENV'] = 'test'

require("bundler/setup")
Bundler.require(:default, :test)
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }
set(:root, Dir.pwd())

#Attempting to implement 'Shoulda-matcher' per the docs -->
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :active_record
  end
end

RSpec.configure do |config|
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)
end



require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('./app')
