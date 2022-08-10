# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :active_friendships, class_name: 'Friendship', foreign_key: 'follower_id', dependent: :destroy
  has_many :following, through: :active_friendships, source: :followed

  has_many :passive_friendships,  class_name: 'Friendship', foreign_key: 'followed_id', dependent: :destroy
  has_many :followers, through: :passive_friendships, source: :follower

  has_many :recieved_requests, class_name: :Request, foreign_key: :reciever_id, dependent: :destroy
  has_many :sent_requests, class_name: :Request, foreign_key: :requester_id, dependent: :destroy

  validates :full_name, :username, :user_type, presence: true
  validates :username, :email, uniqueness: true
  has_one_attached :avatar
  validates :password, confirmation: true
  validates :full_name, format: { with: /\A[a-z0-9\s]+\Z/i,
                                  message: 'can not contain special characters or numerics.' }
  validate :correct_image_type

  def follow(user)
    active_friendships.create(followed_id: user.id)
  end

  def unfollow(user)
    active_friendships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    following.include?(user)
  end

  def send_request(user)
    sent_requests.create(reciever_id: user.id)
  end

  def delete_request(user)
    sent_requests.find_by(requester_id: user.id).destroy
  end

  private

  def correct_image_type
    if avatar.attached? && !avatar.content_type.in?(%w[image/jpeg image/png image/gif])
      errors[:base] << 'Image type is not correct.'
    end
  end
end
