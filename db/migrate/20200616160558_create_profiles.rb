class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.date :birthday
      t.text :bio
      t.string :relationship_status
      t.string :location
      t.string :hometown

      t.timestamps
    end
  end
end
