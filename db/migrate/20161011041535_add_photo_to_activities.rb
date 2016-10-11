class AddPhotoToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :photo, :string
  end
end
