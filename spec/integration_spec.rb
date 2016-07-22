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
    expect(page).to have_content('FootLocker, PDX')
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
