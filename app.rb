require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/') do
  erb(:index)
end

get('/brands') do
  @brands = Brand.all()
  erb(:brands)
end

get('/brands/:id') do
  @brand = Brand.find(params['id'])
  erb(:brand)
end

post('/brands/new') do
  name = params['brand_name']
  brand = Brand.create({name: name})
  erb(:success)
end

post('/brands/:id/rating/upvote') do
  brand = Brand.find(params['id'])
  brand.up_vote
  redirect('/brands')
end

post('/brands/:id/rating/downvote') do
  brand = Brand.find(params['id'])
  brand.up_vote
  redirect('/brands')
end

get('/stores') do
  @stores = Store.all
  erb(:stores)
end
