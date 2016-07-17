class CreateUserFavCareerPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :user_fav_career_posts do |t|
    	t.integer :user_id, index: true
 			t.integer :career_post_id, index: true	
      t.timestamps null: false
    end
  end
end
