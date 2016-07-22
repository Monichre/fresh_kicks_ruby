require('spec_helper')

describe(Store) do
  it "validates the presence of name" do
    store = Store.new({name: ""})
    expect(store.save()).to(eq(false))
  end

  it "validates the presence of location" do
    store = Store.new({location: ""})
    expect(store.save()).to(eq(false))
  end

  it "capitalizes name" do
    store = Store.create({name: 'nike'})
    expect(store.name).to(eq('Nike'))
  end
end
