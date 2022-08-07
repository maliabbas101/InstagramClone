# frozen_string_literal: true

module UsersHelper
  def username(id)
    User.find(id).username
  end

  def useravatar(id)
    User.find(id).avatar
  end

  def check_like(post)
    current_user.likes.find_by(post: post)
  end

  def populate_users
    User.where('full_name ILIKE ?', "%#{params[:q]}%")
  end
end
