class CreateUserActivities < ActiveRecord::Migration
  def change
    create_table :user_activities do |t|
 			t.belongs_to :activity, index: true
      t.belongs_to :user, index: true
      t.integer :skill_level
      t.string :game_position
      t.timestamps null: false

    end
  end
end
