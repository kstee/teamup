class CreateUserListings < ActiveRecord::Migration
  def change
    create_table :user_listings do |t|
 			t.belongs_to :listing, index: true
      t.belongs_to :user, index: true
      t.boolean :isApproved
      t.timestamps null: false
    end
  end
end
