class CreateCareerPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :career_posts do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
