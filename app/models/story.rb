# frozen_string_literal: true

class Story < ApplicationRecord
  has_many_attached :images
  validates :images, presence: true
end
