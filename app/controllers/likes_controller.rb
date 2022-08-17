# frozen_string_literal: true

class LikesController < ApplicationController
  include UsersHelper
  before_action :set_like, only: %i[destroy]

  def create
    @like = current_user.likes.new(like_params)
    @post = @like.post
    if @like.save
      redirect_to like_back(user_details(@post.user_id), @post.id)
    else
      flash[:notice] = @like.errors.full_messages
    end
  end

  def destroy
    @post = @like.post
    if @like.destroy
      redirect_to like_back(user_details(@post.user_id), @post.id)
    else
      redirect_to pathfeed_users_path, notice: "Like #{@like.errors.full_messages.to_sentence}"
    end
  end

  private

  def set_like
    @like = current_user.likes.find(params[:id])
  end

  def like_params
    params.require(:like).permit(:post_id)
  end
end
