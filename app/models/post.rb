# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  validates :caption, presence: true
  validates :caption, length: { minimum: 5, maximum: 60 }
  validates :images , length:{minimum:0 ,maximum:10, message: 'can not exceed 10 per post.' }
end
