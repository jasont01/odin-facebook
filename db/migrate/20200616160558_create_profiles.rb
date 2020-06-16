class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.int :user_id
      t.string :name
      t.date :birthday
      t.int :profile_picture_id
      t.text :bio
      t.string :relationship_status
      t.int :significant_other_id
      t.int :location_id
      t.int :hometown_id
      t.int :job_id

      t.timestamps
    end
  end
end
