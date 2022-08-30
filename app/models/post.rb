# frozen_string_literal: true

class Post < ApplicationRecord
  default_scope { order(created_at: :desc) }

  belongs_to :user
  has_many_attached :images
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :images, presence: true
  validates :caption, length: { minimum: 0, maximum: 60 }
  validates :images, length: { minimum: 1, maximum: 10, message: 'can not exceed 10 per post.' }
end
