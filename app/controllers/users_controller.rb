# frozen_string_literal: true

class UsersController < ApplicationController
  def feed
    @users = User.all
  end
  def index
    @users = User.where("full_name LIKE ?","%" + params[:q] + "%" )
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

end
