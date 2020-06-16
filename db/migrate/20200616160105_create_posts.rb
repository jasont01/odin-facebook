class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.int :user_id
      t.text :content

      t.timestamps
    end
  end
end
