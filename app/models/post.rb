# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :comments, dependent: :destroy
  validates :caption, presence: true
  validates :caption, length: { minimum: 5, maximum: 60 }
  validates :images, length: { minimum: 0, maximum: 10, message: 'can not exceed 10 per post.' }
  validate :correct_image_type

  private
  def correct_image_type
    if self.images.attached?
      images.each do |image|
        !image.content_type.in?(%w(images/jpeg images/png images/gif))
        self.errors[:base] << "One or more image type is not correct."
      end
    end
  end
end
