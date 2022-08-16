# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_like, only: %i[destroy]

  def create
    @like = current_user.likes.new(like_params)
    @post = @like.post
    if @like.save
      redirect_to pathfeed_users_path
    else
      flash[:notice] = @like.errors.full_messages
    end
  end

  def destroy
    @like.destroy
      redirect_to pathfeed_users_path
  end

  private

  def set_like
    @like = current_user.likes.find(params[:id])
  end

  def like_params
    params.require(:like).permit(:post_id)
  end
end
