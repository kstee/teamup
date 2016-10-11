class ChangeAddressFormatInListings < ActiveRecord::Migration
  def change
    change_column :listings, :address, :text
  end
end
