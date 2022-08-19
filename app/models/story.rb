# frozen_string_literal: true

class Story < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  validates :images, presence: true
  scope :specific_user, ->(id) { where(user_id: id) }
  after_save :set_timer

  private
  def set_timer
    DeleteStoryJob.set(wait: 1.minute).perform_later(self.id)
  end
end
