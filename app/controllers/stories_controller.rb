# frozen_string_literal: true

class StoriesController < ApplicationController
  before_action :set_story, only: %i[show destroy]
  before_action :set_user, only: %i[create]
  before_action :check_user, only: %i[new]
  before_action :set_user_with, only: %i[index]

  def index
    @stories = Story.all
    # authorize @stories
    @json_stories = @stories.map { |e| e.as_json.merge(images: e.images.map { |image| url_for(image) }) }
    @json_followers = @user.followers.map{ |e| e.as_json}
    # render json: @json_stories
    render json: {all_data: {json_stories:@json_stories, json_followers: @json_followers}}
  end

  def show; end

  def new
    @story = Story.new
    authorize @story
  end

  def create
    @story = @user.stories.new(story_params)
    authorize @story
    if @story.save
      redirect_to pathfeed_users_url, notice: "Story was successfully created."
    else
      redirect_to new_user_story_url, notice: "Story was not successfully created.",status: :unprocessable_entity
    end
  end

  def destroy
    if @story.destroy
      redirect_to pathfeed_users_url, notice: "Story was successfully deleted."
    else
      redirect_to pathfeed_users_url, notice: "Something went wrong"
    end
  end

  private

  def set_story
    @story = Story.find(params[:id])
    authorize @story
  end

  def story_params
    params.require(:story).permit(:user_id, images: [])
  end

  def set_user
    @user = User.find(params[:story][:user_id])
  end

  def set_user_with
    @user = User.find(params[:user_id])
  end

  def check_user
    set_user_with
    return true if @user.eql? current_user
    redirect_to pathfeed_users_path , notice: 'You are not authorized to perform this action.'
  end
end
