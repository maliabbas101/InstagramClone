# frozen_string_literal: true

class RequestsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :set_user, only: %i[create]

  def index
    @requests = Request.all
  end

  def create
    current_user.sent_requests.create(reciever_id: @user.id)

    redirect_to user_path(@user.id)
  end

  def destroy
    @request = Request.find(params[:id])
    if @request.destroy
      redirect_to requests_url, notice: 'Request was successfully deleted.'
    else
      redirect_to requests_url, notice: 'Something went wrong'
    end
  end

  def approve_request
    @user = User.find(params[:requester_id])
    ActiveRecord::Base.transaction do
      if current_user.passive_friendships.create!(follower_id: @user.id)
        @user.sent_requests.find_by(reciever_id: current_user.id).destroy
        redirect_to user_path(@user.id) , notice: "Request Accepted."
      else
        redirect_to user_path(@user.id), notice: "Something went wrong."
      end
    end
  rescue ActiveRecord::RecordInvalid
    redirect_to user_path(@user.id), notice: 'Request was not accepted successfully.'
  end

  private

  def set_user
    @user = User.find(params[:reciever_id])
  end
end
