# frozen_string_literal: true

class StoriesDeleteJob < ApplicationJob
  # queue_as :default

  def perform(story)
    # Do something later
    story.destroy.set(wait: 1.day)
  end
end
