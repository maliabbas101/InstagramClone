# frozen_string_literal: true
class DeleteStoryJob < ApplicationJob
  queue_as :default

  def perform(story_id)
    # Do something later
    story = Story.find(story_id)
    story.destroy!
  end
end
