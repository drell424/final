class AddHouseNumToListing < ActiveRecord::Migration
  def change
    add_column :listings, :house_num, :string
  end
end
