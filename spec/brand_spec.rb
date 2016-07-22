require('spec_helper')

describe(Brand) do
  it "validates the presence of name" do
    brand = Brand.new({name: ""})
    expect(brand.save()).to(eq(false))
  end
end
