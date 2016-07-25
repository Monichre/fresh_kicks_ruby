class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  validates(:name, :presence => true)
  validates(:location, :presence => true)
  before_save(:upcase_name)

  private
  def upcase_name
    self.name.capitalize!
  end
end
