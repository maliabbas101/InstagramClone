# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :full_name, :username, :user_type, presence: true
  validates :username, :email, uniqueness: true
  has_one_attached :avatar
  validates :password, confirmation: true
  validates :full_name, format: { with: /\A[a-z0-9\s]+\Z/i,
                                  message: 'can not contain special characters or numerics.' }
  validate :correct_image_type

  private

  def correct_image_type
    if avatar.attached? && !avatar.content_type.in?(%w[image/jpeg image/png image/gif])
      errors[:base] << 'Image type is not correct.'
    end
  end
end
