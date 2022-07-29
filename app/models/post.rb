# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  validates :caption, presence: true
  validates :caption, length: { minimum: 5, maximum: 60 }
end
