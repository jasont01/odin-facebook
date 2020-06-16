class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.int :user_id

      t.timestamps
    end
  end
end
