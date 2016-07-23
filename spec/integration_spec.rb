require('spec_helper')

describe('/', {:type => :feature}) do
  it('displays home page') do
    visit('/')
    expect(page).to have_content('Fresh kicks >> << Home Stores Shoes Build This')
  end
end

describe('/stores', {:type => :feature}) do
  it('displays the stores') do
    visit('/stores')
    fill_in('store_name', :with => 'Nike')
    fill_in('store_location', :with => 'PDX')
    click_button('Add this Store')
    expect(page).to have_content('Fresh kicks >> << Home Stores Shoes +Our Retailers Nike PDX Store Name Store Location Add this Store')
    click_link('Nike')
    expect(page).to have_content('Nike')
  end
end
describe('/stores/:id', {:type => :feature}) do
  it "displays shoe brands on individual page" do
    store = Store.create({name: 'Nike Depot', location: 'Portland'})
    store.brands.create({name: 'Puma'})
    visit('/stores')
    within(:css, "div.store") do
      expect(page).to have_content('Nike depot Portland')
    end
    click_link('Nike depot')
    within(:css, "div.brand") do
      expect(page).to have_content('Puma')
    end
  end
end

# describe('/', {:type => :feature}) do
#   it('displays home page') do
#     visit('/')
#     fill_in('title', :with => 'green eggs and ham')
#     click_button('Send')
#     expect(page).to have_content('Green Eggs and Ham')
#   end
# end