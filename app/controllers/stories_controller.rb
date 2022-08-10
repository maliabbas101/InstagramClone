# frozen_string_literal: true

class StoriesController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  def index
    @stories = Story.all
  end

  def show; end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      redirect_to pathfeed_url, notice: 'Story was successfully created.'
    else
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
end
