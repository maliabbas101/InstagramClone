# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  include UsersHelper

  def feed
    @users = User.all
    authorize @users
  end

  def show
    @posts = @user.posts
    authorize @user
  end

  def search
    @users = User.name_search(params[:q])
    authorize @users
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
