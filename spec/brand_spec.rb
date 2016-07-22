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

  describe('#up_vote') do
    it "increases rating by 1" do
      brand = Brand.create({name: 'Nike'})
      brand.up_vote
      expect(brand.rating).to(eq(1))
    end
  end
end
