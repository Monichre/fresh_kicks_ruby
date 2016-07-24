require 'active_record'
require ('./app')
ActiveRecord::Base.establish_connection(ENV['RACK_ENV'] || 'postgres://localhost/fresh_kicks_development')
run Sinatra::Application
