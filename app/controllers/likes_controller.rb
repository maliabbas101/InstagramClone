# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_like, only: %i[destroy]

  def create
    @like = current_user.likes.new(like_params)
    @post = @like.post
    respond_to do |format|
      if @like.save
        format.html { redirect_to pathfeed_path }
        format.js
      else
        format.html { flash[:notice] = @like.errors.full_messages }
        format.js
      end
    end
  end

  def destroy
    post = @like.post
    @like.destroy
    respond_to do |format|
      format.html {redirect_to pathfeed_path}
      format.js
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
