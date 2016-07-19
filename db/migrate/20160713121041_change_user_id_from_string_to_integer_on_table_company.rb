class ChangeUserIdFromStringToIntegerOnTableCompany < ActiveRecord::Migration[5.0]
  def up
    change_column :companies, :user_id, :integer
  end

  def down
    change_column :companies, :user_id, :string
  end
end
