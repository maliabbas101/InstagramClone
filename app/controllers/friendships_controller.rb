# frozen_string_literal: true

class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def create
    current_user.active_friendships.create(followed_id: @user.id)
    redirect_to user_path(@user.id)
  end

  def destroy
    current_user.active_friendships.find_by(followed_id: @user.id).destroy

    redirect_to user_path(@user.id)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
