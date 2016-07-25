configure :production, :development do
  db = URI.parse(ENV['RACK_ENV'] || 'fresh_kicks_development')

  ActiveRecord::Base.establish_connection(
    :adapter  => 'postgresql',
    :database => 'fresh_kicks_development'

  )
end
