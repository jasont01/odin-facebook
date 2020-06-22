class AddIgnoreToFriendRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :friend_requests, :ignore, :boolean, default: false
  end
end
