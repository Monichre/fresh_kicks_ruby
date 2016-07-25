require('spec_helper')

describe('/', {:type => :feature}) do
  it('displays home page') do
    visit('/')
    expect(page).to have_content('Fresh kicks >> << Home Stores Shoes OurStyles.. Aestheke Inc.')
  end
end

describe('/stores/:id/new_brand', {:type => :feature}) do
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

describe('/stores/:id/add_brand', {:type => :feature}) do
  it "adds shoe brands from store tile page" do
    store = Store.create({name: 'Nike Depot', location: 'Portland'})
    brand = Brand.create({name: 'Puma'})
    visit('/stores')
    within(:css, "div.store") do
      expect(page).to have_content('Nike depot Portland')
    end
    select('Puma', from: 'brand_id')
    within(:css, "div#brand_select_add_to_store_form") do
      click_button('+')
    end
    within(:css, "div.brand") do
      expect(page).to have_content('Puma')
    end
  end
end

describe('/stores/:id/update', {:type => :feature}) do
  it "updates the store" do
    store = Store.create({name: 'Nike Depot', location: 'Portland'})
    visit('/stores/' + store.id.to_s)
    fill_in('update_store_name', :with => 'Nike')
    fill_in('update_store_location', :with => 'New York City')
    within(:css, "form.update") do
      click_button('+')
    end
    within(:css, "h3.store-header") do
      expect(page).to have_content('Nike, New York City')
    end
  end
end

describe('/stores/:store_id/brands/:id/delete', {:type => :feature}) do #delete brand from store route
  it "updates the store and removes the respective brands from the general brand list" do
    store = Store.create({name: 'Nike Depot', location: 'Portland'})
    store.brands.create({name: 'Nike Air'})
    visit('/stores/' + store.id.to_s)
    within(:css, "p.brand_link") do
      expect(page).to have_content('Nike air')
    end
    click_button('X')
    within(:css, "div.brands") do
      expect(page).to have_content('No brands available at this retailer')
    end
    visit('/brands')
  end
end

# spec tests for brands routes -->

describe('/brands', {:type => :feature}) do
  it "displays all the brands" do
    brand = Brand.create({name: 'Adidas', rating: 5})
    brand2 = Brand.create({name: 'Puma'})
    visit('/brands')
    within(:css, "div.brands") do
      expect(page).to have_content('Adidas Rate them kicks + - X Puma Rate them kicks + - X')
      expect(page).to have_content('Puma Rate them kicks')
    end
  end
end

describe('/brands/:id', {:type => :feature}) do
  it "displays individual brand page" do
    brand = Brand.create({name: 'Adidas', rating: 5})
    visit('/brands/' + brand.id.to_s)
    within(:css, "h3.brand_title span.special.two") do
      expect(page).to have_content('Adidas')
    end
  end
end
