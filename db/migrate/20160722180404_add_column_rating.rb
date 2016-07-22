class AddColumnRating < ActiveRecord::Migration
  def change
    add_column(:brands, :rating, :integer)
  end
end
