# frozen_string_literal: true

class UsersController < ApplicationController
  def feed
    @users = User.all
  end
end
