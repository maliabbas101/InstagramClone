# frozen_string_literal: true

class Story < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  validates :images, presence: true
  scope :specific_user, ->(id) { where(user_id: id) }

end
