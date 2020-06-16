class CreateFriendRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :friend_requests do |t|
      t.int :user_id
      t.int :requesting_user_id

      t.timestamps
    end
  end
end
