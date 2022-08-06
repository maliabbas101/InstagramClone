# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_like, only: %i[destroy]

  def create
    @like = current_user.likes.new(like_params)
    respond_to do |format|
      if @like.save
        format.html { redirect_to pathfeed_path }
      else
        format.html { flash[:notice] = @like.errors.full_messages }
      end
    end
  end

  def destroy
    post = @like.post
    @like.destroy
    redirect_to pathfeed_path
  end

  private

  def set_like
    @like = current_user.likes.find(params[:id])
  end

  def like_params
    params.require(:like).permit(:post_id)
  end
end
