class CreateResumes < ActiveRecord::Migration[5.0]
  def change
    create_table :resumes do |t|
      t.integer :ideal_role
      t.integer :exp_in_role
      t.integer :length_of_working_exp
      t.integer :job_search_status
      t.text :reason_for_new_job
      t.integer :ideal_salary
      t.integer :user_id

      t.timestamps
    end
  end
end
