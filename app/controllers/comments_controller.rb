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

  def edit
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:comment][:post_id])
    @comment = @post.comments.create(comment_params)
    if @comment.save
      redirect_to @post, notice: 'Comment was successfully added.'
    else
      render 'posts/show', notice: 'Something went wrong'
    end
  end

  def update
    byebug
    @post = Post.find(params[:post_id])
    if @comment.update(comment_params)
      redirect_to @post, notice: 'Comment was successfully updated.'
    else
      render 'edit', notice: 'Something went wrong'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    if @comment.destroy
      redirect_to @post, notice: 'Comment was successfully deleted.'
    else
      redirect_to comments_url, notice: 'Something went wrong'
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id, [:comment])
  end
end
