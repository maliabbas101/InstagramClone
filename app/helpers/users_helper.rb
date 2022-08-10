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
    if user.avatar.attached?
      return user.avatar
    end
    return 'person_icon.png'
  end

  def show_suggestions?
    if current_user.following.count == (User.count)-1
      return false
    end
    return true
  end

  def requested?(requests,user)
    requests.each do |request|
      return true if request.reciever_id == user.id
    end
    return false
  end

  def follow_rout(user)
    if user.user_type == "Private"
      return requests_path(reciever_id: user.id)
    end
    return friendships_path(user_id: user.id)
  end
end
