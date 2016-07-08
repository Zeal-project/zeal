class AddUserIdToCareerPosts < ActiveRecord::Migration[5.0]
  def change
  	add_column :career_posts, :user_id, :integer

  	add_index :career_posts, :user_id
  end
end
