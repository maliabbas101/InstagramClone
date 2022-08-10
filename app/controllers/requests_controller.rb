class RequestsController < ApplicationController
  before_action :authenticate_user!,only: %i[create destroy]
  before_action :set_user,only: %i[create]
  def index
    @requests = Request.all.where("reciever_id=#{current_user.id}")
  end

  def create
    current_user.send_request(@user)
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
    @user.follow(current_user)
    redirect_to user_path(@user.id)
  end

  private

  def set_user
    @user = User.find(params[:reciever_id])
  end
end
