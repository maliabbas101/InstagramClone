# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]
  before_action :set_post, only: %i[edit update destroy]
  before_action :create_comment, only: %i[create]
  def index
    @comments = Comment.all
  end

  def show; end

  def new
    @comment = Comment.new
  end

  def edit; end

  def create
    @comment = @post.comments.create(comment_params)
    if @comment.save
      redirect_to @post, notice: 'Comment was successfully added.'
    else
      flash[:notice] = 'Comment can not be blank.'
      render 'posts/show'
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @post, notice: 'Comment was successfully updated.'
    else
      render 'edit', notice: 'Something went wrong'
    end
  end

  def destroy
    if @comment.destroy
      redirect_to @post, notice: 'Comment was successfully deleted.'
    else
      redirect_to comments_url, notice: 'Something went wrong'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def create_comment
    @post = Post.find(params[:comment][:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id, [:comment])
  end
end
