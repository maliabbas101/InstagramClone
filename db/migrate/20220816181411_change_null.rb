# frozen_string_literal: true
class ChangeNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :friendships, :follower_id, false
    change_column_null :friendships, :followed_id, false
    change_column_null :likes, :user_id, false
    change_column_null :likes, :post_id, false
    change_column_null :stories, :user_id, false
  end
end
