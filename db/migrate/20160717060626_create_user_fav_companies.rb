class CreateUserFavCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :user_fav_companies do |t|
      t.integer :user_id, index: true
      t.integer :company_id, index: true

      t.timestamps
    end
  end
end
