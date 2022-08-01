# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :comments, dependent: :destroy
  validates :images, presence: true
  validates :caption, length: { minimum: 0, maximum: 60 }
  validates :images, length: { minimum: 1, maximum: 10, message: 'can not exceed 10 per post.' }
  validate :correct_image_type

  private
  def correct_image_type
    if self.images.attached?
      images.each do |image|
        if !image.content_type.in?(%w(image/jpeg image/png image/gif))
          self.errors[:base] << "One or more image type is not correct."
        end
     end
    end
  end
end
