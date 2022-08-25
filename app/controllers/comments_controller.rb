# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]
  before_action :set_post, only: %i[edit update destroy]
  before_action :set_post_with, only: %i[create]

  def edit; end

  def create
    @comment = @post.comments.create(comment_params)
    authorize @comment
    if @comment.save
      redirect_to @post, notice: 'Comment was successfully added.'
    else
      redirect_to post_url(@post), notice: "Comment #{@comment.errors.full_messages.to_sentence}",status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @post, notice: 'Comment was successfully updated.'
    else
      redirect_to edit_post_comment_url, notice: "Comment #{@comment.errors.full_messages.to_sentence}",status: :unprocessable_entity
    end
  end

  def destroy
    if @comment.destroy
      redirect_to @post, notice: 'Comment was successfully deleted.'
    else
      redirect_to post_url(@post), notice: 'Something went wrong'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
    authorize @post
  end

  def set_comment
    @comment = Comment.find(params[:id])
    authorize @comment
  end

  def set_post_with
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id, [:comment])
  end
end
