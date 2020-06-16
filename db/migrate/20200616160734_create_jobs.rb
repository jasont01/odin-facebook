class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.integer :employer_id
      t.string :job_title

      t.timestamps
    end
  end
end
