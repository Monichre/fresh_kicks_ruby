require('spec_helper')

describe(Store) do
  it "validates the presence of name" do
    store = Store.new({name: ""})
    expect(store.save()).to(eq(false))
  end
end
