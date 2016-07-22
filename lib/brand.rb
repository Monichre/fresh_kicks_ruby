class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:name, :presence => true)
  before_save(:rating_default, :upcase_name)

  def rating_default
    self.rating = 0
  end

  def upcase_name
    self.name.capitalize!
  end
end
