class AddPhotosToUsers < ActiveRecord::Migration
  def change
    add_column :users, :photos, :json
  end
end
