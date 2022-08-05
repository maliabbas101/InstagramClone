# frozen_string_literal: true

module UsersHelper
  def username(id)
    User.find(id).username
  end

  def useravatar(id)
    User.find(id).avatar
  end
end
