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
    expect(page).to have_content('Fresh kicks >> << Home Stores Shoes *Our Retailers +Add Retailers Nike PDX Store Name Store Location Add this Store')
    click_link('Nike')
    expect(page).to have_content('Nike')
  end
end

describe('/stores/:id/add_brand', {:type => :feature}) do
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

describe('/stores/:id/update', {:type => :feature}) do
  it "updates the store" do
    store = Store.create({name: 'Nike Depot', location: 'Portland'})
    visit('/stores/' + store.id.to_s)
    within(:css, "h3.store-header") do
      expect(page).to have_content('Nike depot, Portland >>Delete')
    end
    fill_in('update_store_name', :with => 'Nike')
    fill_in('update_store_location', :with => 'New York City')
    click_button('Update')
    within(:css, "h3.store-header") do
      expect(page).to have_content('Nike, New York City >>Delete')
    end
  end
end

# spec tests for brands routes -->

describe('/brands', {:type => :feature}) do
  it "displays all the brands" do
    brand = Brand.create({name: 'Adidas', rating: 5})
    brand2 = Brand.create({name: 'Puma'})
    visit('/brands')
    within(:css, "div.brands") do
      expect(page).to have_content('Adidas Rate them kicks + - Puma Rate them kicks + -')
      expect(page).to have_content('Puma Rate them kicks')
    end
  end
end

describe('/brands/:id', {:type => :feature}) do
  it "displays all the brands" do
    brand = Brand.create({name: 'Adidas', rating: 5})
    visit('/brands/' + brand.id.to_s)
    within(:css, "h3") do
      expect(page).to have_content('Adidas')
    end
  end
end
