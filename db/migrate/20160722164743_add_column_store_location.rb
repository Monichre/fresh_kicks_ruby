class AddColumnStoreLocation < ActiveRecord::Migration
  def change
    add_column(:stores, :location, :string)
  end
end
