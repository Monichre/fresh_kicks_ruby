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

patch('/brands/:id/rating/upvote') do #fix these methods
  brand = Brand.find(params['id'])
  brand.up_vote
  redirect('/brands')
end

patch('/brands/:id/rating/downvote') do #fix these methods
  brand = Brand.find(params['id'])
  brand.down_vote
  redirect('/brands')
end

get('/stores') do
  @stores = Store.all
  erb(:stores)
end

get('/stores/:id') do
  @store = Store.find(params['id'])
  erb(:store)
end

post('/stores/new') do
  name = params['store_name']
  location = params['store_location']
  store = Store.create({name: name, location: location})
  redirect('/stores')
end

delete('/stores/:id') do
  store = Store.find(params['id'])
  store.delete
  redirect('/stores')
end

patch('/stores/:id/update') do
  store = Store.find(params['id'])
  name = params['update_store_name']
  location = params['update_store_location']
  store.update({name: name, location: location})
  redirect('/stores/' + store.id.to_s)
end

post('/stores/:id/new_brand') do
  store = Store.find(params['id'])
  brand_name = params['new_brand']
  store.brands.create({name: brand_name})
  redirect('/stores/' + store.id.to_s)
end
