class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :name
      t.date :birthday
      t.integer :profile_picture_id
      t.text :bio
      t.string :relationship_status
      t.integer :significant_other_id
      t.integer :location_id
      t.integer :hometown_id
      t.integer :job_id

      t.timestamps
    end
  end
end
