# frozen_string_literal: true

module UsersHelper
  def username(id)
    User.find(id).username
  end

  def useravatar(id)
    User.find(id).avatar
  end

  def checkLike(post)
    current_user.likes.find_by(post: post)
  end
end
