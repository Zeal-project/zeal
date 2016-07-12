class AddUserIdToCompany < ActiveRecord::Migration[5.0]
  def change
  	add_column :companies, :user_id, :string

  	add_index :companies, :user_id
  end
end
