class ChangeNullConstraints < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :user_type, false
    change_column_null :users, :full_name, false
    change_column_null :users, :username, false
  end
end
