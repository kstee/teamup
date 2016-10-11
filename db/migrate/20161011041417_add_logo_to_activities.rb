class AddLogoToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :logo, :string
  end
end
