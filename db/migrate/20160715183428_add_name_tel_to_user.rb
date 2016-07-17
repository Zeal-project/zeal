class AddNameTelToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :tel, :string
    add_column :users, :name, :string
    add_index :users, :name
  end
end
