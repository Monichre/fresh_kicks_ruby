class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:name, :presence => true)
  before_save(:upcase_name)
  before_create(:rating_default)

  def rating_default
    self.rating = 0
  end

  def upcase_name
    self.name.capitalize!
  end

  def up_vote
    self.rating += 1
    self.update({rating: rating})
  end

  def down_vote
    self.rating -= 1
    self.update({rating: rating})
  end
end
