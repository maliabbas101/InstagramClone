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

  def back_rout(user)
    return pathfeed_path if current_user != user

    posts_path
  end

  def user_details(id)
    User.find(id)
  end

  def avatar_selection(user)
    return user.avatar if user.avatar.attached?

    'person_icon.png'
  end

  def show_suggestions?
    return false if current_user.following.count == User.count - 1

    true
  end

  def requested?(requests, user)
    requests.each do |request|
      return true if request.reciever_id == user.id
    end
    false
  end

  def follow_rout(user)
    return requests_path(reciever_id: user.id) if user.user_type == 'Private'

    friendships_path(user_id: user.id)
  end

  def if_plus(user)
    return false if user.stories.count == 0

    true
  end
end
