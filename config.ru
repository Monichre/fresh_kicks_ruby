require 'active_record'
require ('./app')
ActiveRecord::Base.establish_connection(ENV['fresh_kicks_development'] || 'postgres://localhost/fresh_kicks_development')
run Sinatra::Application
