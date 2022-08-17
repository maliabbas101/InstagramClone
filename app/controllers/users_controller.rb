# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  include UsersHelper

  def index;  end

  def feed
    @users = User.all
  end

  def show
    @posts = @user.posts
  end

  def search
    @users = User.name_search(params[:q])
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
