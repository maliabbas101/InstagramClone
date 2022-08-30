# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :active_friendships, class_name: 'Friendship', foreign_key: 'follower_id',
                                dependent: :destroy
  has_many :following, through: :active_friendships, source: :followed
  has_many :passive_friendships, class_name: 'Friendship', foreign_key: 'followed_id',
                                 dependent: :destroy
  has_many :followers, through: :passive_friendships, source: :follower
  has_many :recieved_requests, class_name: :Request, foreign_key: :reciever_id,
                               dependent: :destroy
  has_many :sent_requests, class_name: :Request, foreign_key: :requester_id, dependent: :destroy
  has_many :stories, dependent: :destroy
  has_one_attached :avatar

  validates :full_name, :username, :user_type, presence: true
  validates :full_name, :email, :username, length: { minimum: 5, maximum: 25 }
  validates :username, :email, uniqueness: true
  validates :password, confirmation: true
  validates :full_name , format: { with: /\A[a-z\s]+\Z/i,
                                   message: 'can not contain special characters or numerics.' }
  enum user_type: { 'private': 1, 'public': 2 }, _prefix: :is

  scope :name_search, ->(name) { where('full_name ILIKE ?', "%#{name}%") }

  def following?(user)
    following.include?(user)
  end

end
