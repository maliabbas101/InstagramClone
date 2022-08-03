class UsersController < ApplicationController
  def feed
    @users = User.all
  end
end
