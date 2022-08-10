class Story < ApplicationRecord
  has_many_attached :images
  validates :images, presence: true
  validates :images, length: { minimum: 1, maximum: 10, message: 'can not exceed 10 per Story.'}
end
