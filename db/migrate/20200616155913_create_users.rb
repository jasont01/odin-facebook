class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :image, null: false, default: 'images/profile_default.png'
      
      t.timestamps
    end
  end
end
