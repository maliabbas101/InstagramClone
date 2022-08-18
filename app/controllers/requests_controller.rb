# frozen_string_literal: true

class RequestsController < ApplicationController
  include UsersHelper
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :set_user, only: %i[create]
  before_action :set_request, only: %i[edit destroy]

  def index
    @requests = Request.all
    authorize @requests
  end

  def create
    @request = current_user.sent_requests.create(reciever_id: @user.id)
    authorize @request
    redirect_to user_path(@user.id)
  end

  def destroy
    if @request.destroy
      redirect_to requests_url, notice: 'Request was successfully deleted.'
    else
      redirect_to requests_url, notice: 'Something went wrong'
    end
  end

  def edit
    @user = User.find(@request.requester_id)
    accept_request(@user)
  end

  private

  def set_user
    @user = User.find(params[:reciever_id])
  end

  def set_request
    @request = Request.find(params[:id])
    authorize @request
  end
end
