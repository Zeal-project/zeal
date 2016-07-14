class ChangeUserIdFromStringToIntegerOnTableCompany < ActiveRecord::Migration[5.0]
  def change
  	change_column :companies, :user_id, :integer
  end
end
