ENV['RACK_ENV'] = 'test'

require("bundler/setup")
Bundler.require(:default, :test)
set(:root, Dir.pwd())
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('./app')

#Attempting to implement 'Shoulda-matcher' per the docs -->
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :active_record
  end
end

RSpec.configure do |config|
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)
  config.after(:each) do
    Store.all.each do |store|
      store.delete
    end
    Brand.all.each do |brand|
      brand.delete
    end
  end
end
