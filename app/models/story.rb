# frozen_string_literal: true

class Story < ApplicationRecord
  has_many_attached :images
  validates :images, presence: true
  scope :specific_user, ->(id) { where(user_id: id) }

end
