class ChangePriceTypeInListings < ActiveRecord::Migration
   def self.up
    change_column :listings, :price, :string
  end
 
  def self.down
    change_column :listings, :price, :integer
  end
end
