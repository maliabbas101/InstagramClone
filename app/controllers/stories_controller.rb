# frozen_string_literal: true

class StoriesController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :create_story, only: %i[create]
  def index
    @stories = Story.all
  end

  def show; end

  def new
    @story = Story.new
  end

  def create
    @story = @user.stories.create(story_params)
    if @story.save
      StoriesDeleteJob.perform_later @story
      redirect_to pathfeed_url, notice: 'Story was successfully created.'
    else
      byebug
      redirect_to pathfeed_url, notice: 'Something went wrong'
    end
  end

  def destroy
    if @story.destroy
      redirect_to pathfeed_url, notice: 'Story was successfully deleted.'
    else
      redirect_to pathfeed_url, notice: 'Something went wrong'
    end
  end

  private

  def set_post
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:user_id, images: [])
  end

  def create_story
    @user = User.find(params[:story][:user_id])
  end
end
