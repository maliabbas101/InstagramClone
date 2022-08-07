# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  include UsersHelper

  def feed
    @users = User.all
  end

  def index
    @users = populate_users
  end

  def show
    @posts = @user.posts
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
