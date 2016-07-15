class ChangeUserIdFromStringToIntegerOnTableCompany < ActiveRecord::Migration[5.0]
  def up
    connection.execute(%q{
      alter table companies
      alter column user_id
      type integer using cast(user_id as integer)
    })
  end

  # change_column :yourtable, :column_to_change, 'integer USING CAST("column_to_change" AS integer)'
  def down
    connection.execute(%q{
      alter table companies
      alter column user_id
      type varchar using cast(user_id as varchar)
    })
  end
end
