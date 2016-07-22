require('spec_helper')

describe(Brand) do
  it "validates the presence of name" do
    brand = Brand.new({name: ""})
    expect(brand.save()).to(eq(false))
  end
  it "capitalizes name" do
    brand = Brand.create({name: 'nike'})
    expect(brand.name).to(eq('Nike'))
  end
  it "capitalizes name" do
    brand = Brand.create({name: 'Nike'})
    expect(brand.rating).to(eq(0))
  end
end
