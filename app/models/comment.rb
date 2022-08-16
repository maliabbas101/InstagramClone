# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :body, presence: true
  validates :body, length: { minimum: 0, maximum: 60 }
end
