class StoriesDeleteJob < ApplicationJob
  queue_as :default

  def perform(stories)
    # Do something later
    stories.each do |story|
      story.destroy.set(wait: 1.day)
    end
  end
end
