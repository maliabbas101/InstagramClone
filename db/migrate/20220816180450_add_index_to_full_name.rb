# frozen_string_literal: true
class AddIndexToFullName < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :full_name
  end
end
