class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
 			t.belongs_to :activity, index: true
      t.belongs_to :user, index: true
      t.text :description
      t.timestamp :listing_datetime
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :pax_existing
      t.integer :pax_needed
      t.integer :status
      t.timestamps null: false
    end
  end
end
