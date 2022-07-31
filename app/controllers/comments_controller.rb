# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]
  def index
    @comments = Comment.all
  end

  def show; end

  def new
    @comment = Comment.new
  end

  def edit; end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @comment, notice: 'Comment was successfully added.'
    else
      render 'new', 'Something went wrong'
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: 'Comment was successfully updated.'
    else
      render 'edit', notice: 'Something went wrong'
    end
  end

  def destroy
    if @comment.destroy
      redirect_to comments_url, notice: 'Comment was successfully deleted.'
    else
      redirect_to comments_url, notice: 'Something went wrong'
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end
end
