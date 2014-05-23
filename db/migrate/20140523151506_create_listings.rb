class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :address
      t.integer :price
      t.text :description
      t.text :details
      t.integer :user_id

      t.timestamps
    end
  end
end
