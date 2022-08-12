# frozen_string_literal: true

u1 = User.find_or_create_by(full_name: 'Ali Abbas', email: 'ali@gmail.com', username: 'ali1',
                            user_type: User.user_types[:private]) do |user|
  user.password = '123456'
end
u1.skip_confirmation!
u1.save!

u2 = User.find_or_create_by(full_name: 'Ali Ahmed', email: 'ahmed@gmail.com', username: 'ahmed1',
                            user_type: User.user_types[:public]) do |user|
  user.password = '123456'
end
u2.skip_confirmation!
u2.save!

u3 = User.find_or_create_by(full_name: 'Ali Khan', email: 'khan@gmail.com', username: 'khan1',
                            user_type: User.user_types[:private]) do |user|
  user.password = '123456'
end
u3.skip_confirmation!
u3.save!

f1 = Friendship.create!(follower_id: u1.id, followed_id: u2.id)
f1.save!
