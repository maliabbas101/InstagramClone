# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create!(full_name: "Ali Abbas", email: "ali@gmail.com", password: "123456", username: "ali1",
                  user_type: "Private")
u1.skip_confirmation!
u1.save!

u2 = User.create!(full_name: "Ali Ahmed", email: "ahmed@gmail.com", password: "123456", username: "ahmed1",
                  user_type: "Public")
u2.skip_confirmation!
u2.save!

u3 = User.create!(full_name: "Usama Ahmed", email: "usama@gmail.com", password: "123456", username: "usama1",
                  user_type: "Private")
u3.skip_confirmation!
u3.save!

f1 = Friendship.create!(follower_id: u1.id, followed_id: u2.id)
f1.save!
