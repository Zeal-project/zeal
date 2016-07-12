class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :job_desc
      t.string :seniority

      t.timestamps null: false
    end
  end
end
