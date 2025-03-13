class AddUserIdToTrackers < ActiveRecord::Migration[8.0]
  def change
    remove_column :pet_trackers, :user_id
    add_column :pet_trackers, :user_id, :int
  end
end
